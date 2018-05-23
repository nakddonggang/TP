package util.websocketSetting;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;


public class SocketConfig extends Configurator{

	//대화창 서버객체(ChatServerEndPoint) 저장하는 Map
	private final static Map<String, SocketEndPoint> endpointMap = new HashMap<String, SocketEndPoint>();
	private String currentUri;

	@SuppressWarnings("unchecked")
	@Override
     public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {

		SocketEndPoint endpoint = endpointMap.get(currentUri);

		 if(endpoint == null) {
			 endpoint = new SocketEndPoint();
			 endpointMap.put(currentUri, endpoint);
		 }

		 return (T)endpoint;
     }

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		currentUri = request.getRequestURI().toString();
		super.modifyHandshake(sec, request, response);
	}
}
