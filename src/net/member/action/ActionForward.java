package net.member.action;

public class ActionForward {
	//이동방식 저장	//약속 true response, false forward
	boolean isRedirect;
	//이동경로 저장
	String path;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
