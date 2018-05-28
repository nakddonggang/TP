package util.websocketSetting;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/chat/{room}", encoders=SocketEncoder.class, decoders=SocketDecoder.class, configurator=SocketConfig.class)
public class SocketEndPoint {
	
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		System.out.println("chatEndpoint handleOpen();");
//		userSession.getUserProperties().put("room", room);
		chatroomUsers.add(userSession);
	}

	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		System.out.println("chatEndpoint handleMessage();");
		System.out.println("room: " + room);
		
		ChatMessage incomingChatMessage = (ChatMessage)incomingMessage;
		ChatMessage outgoingChatMessage = new ChatMessage();

		String username = (String) userSession.getUserProperties().get("username");
		System.out.println("username: " + username);
		if (username == null) {

			username = incomingChatMessage.getMessage();
			System.out.println("username: " + username);
			if (username != null) {
				userSession.getUserProperties().put("username", username);
			}
			System.out.println("username: " + username);
			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers){
					session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
				}
			}
		} else {
			outgoingChatMessage.setName(username);
			System.out.println("username: " + username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());
			System.out.println("message: " + outgoingChatMessage.getMessage());

			for (Session session : chatroomUsers){
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}

	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException{
		System.out.println("chatEndpoint handleClose();");
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers){
			session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
		}
	}

	@OnError
    public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
		System.out.println("chatEndpoint handleError();");
		System.out.println(throwable);
	}
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers){
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}
}
