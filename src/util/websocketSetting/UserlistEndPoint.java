package util.websocketSetting;

import java.io.IOException;
import java.io.StringReader;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/userlist", encoders=SocketEncoder.class, decoders=SocketDecoder.class)
public class UserlistEndPoint {
	
    private static Set<Session> connectedAllUsers = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException, EncodeException  {
		System.out.println("listEndpoint onMessage();");
    	String username = (String) session.getUserProperties().get("username");

		JsonObject jsonObject = Json.createReader(new StringReader(message)).readObject();
		String connectionType = jsonObject.getString("connectionType");

		if ("firstConnection".equals(connectionType) && username == null) {
			// 맨 처음 접속 시, 사용자의 이름을 가져옴
			username = jsonObject.getString("username");

			if (username != null && !isExisted(username)) {
				session.getUserProperties().put("username", username);

				for (Session sessionf : connectedAllUsers) {
					sessionf.getBasicRemote().sendText(buildJsonUserData(getUsers()));
				}
			}

		} else if ("chatConnection".equals(connectionType)) {
			// chatroomId로 또다른 webSocket url에 접근한다.	id generation으로 대체가능.
			String chatroomId = jsonObject.getString("username");

			// 다른 사용자와 대화하고자 시도할 때 채팅룸 사용자 저장
			Set<Session> chatroomMembers = new HashSet<Session>();
			chatroomMembers.add(session);

			// 선택한 사용자를 사용자들 안에서 찾기.
			String connectingUser = jsonObject.getString("connectingUser");

			if (connectingUser != null && !username.equals(connectingUser)) {
				// 사용자들 중 선택한 유저와 연결
				for (Session sessionf : connectedAllUsers) {
					if (connectingUser.equals(sessionf.getUserProperties().get("username"))) {
						// 선택한 사용자면 chatroomMember로 추가.
						chatroomMembers.add(sessionf);
					}
				}

				// chatroomMembers에게 room입장하라는 신호 보내기
				for (Session sessionf : chatroomMembers) {
					sessionf.getBasicRemote().sendText(
							Json.createObjectBuilder().add("enterChatId", chatroomId).add("username", (String) session.getUserProperties().get("username")).build().toString());
				}
			}
		}
	}
    
    @OnOpen
    public void onOpen(Session session) {
    	System.out.println("listEndpoint onOpen();");
    	connectedAllUsers.add(session);
    }
    
    @OnClose
    public void onClose(Session session) throws IOException, EncodeException  {
    	System.out.println("listEndpoint onClose();");
    	String disconnectedUser = (String) session.getUserProperties().get("username");
		connectedAllUsers.remove(session);

		if (disconnectedUser != null) {
			Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString();

			for (Session sessionf : connectedAllUsers) {
				sessionf.getBasicRemote().sendText(Json.createObjectBuilder().add("disconnectedUser", disconnectedUser).build().toString());
			}
		}
    }
    
    @OnError
    public void onError(Session session, Throwable thr) {
    	System.out.println("listEndpoint onError();");
    	System.out.println(thr);
    }
    
    private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : connectedAllUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			};
		}
		return returnSet;
	}
		
	private boolean isExisted(String username) {
		// 이미 username을 가진 session이 있는지 검사.
		for (Session existedUser : connectedAllUsers) {
			if (username.equals(existedUser.getUserProperties().get("username"))) {
				return true;
			}
		}
		return false;
	}
	
	private String buildJsonUserData(Set<String> set) {
		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

		for (String user : set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("allUsers", jsonArrayBuilder).build().toString();
	}
}