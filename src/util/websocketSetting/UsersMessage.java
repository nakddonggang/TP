package util.websocketSetting;

import java.util.Set;

/**
* @Class Name : UsersMessage.java
* @Description : 사용자 리스트를 담는 VO
* @Modification Information
*/
public class UsersMessage implements Message{

	private Set<String> users = null;

	public UsersMessage(Set<String> users) {
		this.users = users;
	}

	public Set<String> getUsers() {
		return users;
	}

	public void setUsers(Set<String> users) {
		this.users = users;
	}

}
