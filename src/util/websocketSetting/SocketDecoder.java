package util.websocketSetting;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class SocketDecoder implements Decoder.Text<Message> {

	@Override
	public void destroy() {}

	@Override
	public void init(EndpointConfig arg0) {}
	
	@Override
	public Message decode(String message) throws DecodeException {
		ChatMessage chatMessage = new ChatMessage();

		JsonObject jsonObject = Json
				.createReader(new StringReader(message)).readObject();
		chatMessage.setMessage(jsonObject.getString("message"));
		chatMessage.setRoom(jsonObject.getString("room"));
		return chatMessage;
	}

	@Override
	public boolean willDecode(String message) {
		boolean flag = true;

		try {
			Json.createReader(new StringReader(message)).readObject();
		} catch (Exception ex) {
			flag = false;
		}
		return flag;
	}
}
