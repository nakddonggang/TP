package util.websocketSetting;

import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class SocketEncoder implements Encoder.Text<Message>{

	@Override
	public void destroy() {	}

	@Override
	public void init(EndpointConfig arg0) {	}
	
	@Override
	public String encode(Message message) throws EncodeException {
		String result = null;
		if (message instanceof ChatMessage) {
			 ChatMessage chatMessage = (ChatMessage) message;
			 result = Json.createObjectBuilder().add("messageType", chatMessage.getClass().getSimpleName())
					 .add("name", chatMessage.getName())
					 .add("message", chatMessage.getMessage())
					 .build().toString();
		} else if (message instanceof UsersMessage) {
			UsersMessage userMessage = (UsersMessage) message;
			result = buildJsonUserData(userMessage.getUsers(), userMessage.getClass().getSimpleName());
		}
		return result;
	}

	private String buildJsonUserData(Set<String> set, String messageType) {
		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

		for (String user: set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("messageType", messageType)
										 .add("users", jsonArrayBuilder)
										 .build().toString();
	}
}
