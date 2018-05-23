package util.websocketSetting;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/chat/{user}", encoders=SocketEncoder.class, decoders=SocketDecoder.class, configurator=SocketConfig.class)
public class SocketEndPoint {
	
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session);
        System.out.println("11");
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
    
    @OnError
    public void onError(Session session, Throwable throwable, @PathParam("room") final String room) {}
		private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		return returnSet;
	}
}
