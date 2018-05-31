package net.main.action;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class ChatlogSaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String chatuser = request.getParameter("chatuser");
		String chatlog = request.getParameter("chatlog");
		System.out.println("username: " + chatuser);
		System.out.println("chatlog: " + chatlog);
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
		String chattime = dayTime.format(new Date(System.currentTimeMillis()));
		System.out.println("time: " + chattime);
		
		
		String realPath = request.getRealPath("/data/chatlog");
		System.out.println("upload폴더 물리적경로 : "+realPath);
		
		String chatlog1 = chatlog.replaceAll("(<div class=\"username right\">)|(<div class=\"username left\">)", "[");
		chatlog = chatlog1.replaceAll("(</div><div class=\"bubble right\"><span class=\"tail\">&nbsp;</span><p>)|(</div><div class=\"bubble left\"><span class=\"tail\">&nbsp;</span><p>)", "]: ");
		chatlog1 = chatlog.replaceAll("</p></div>", "\r\n");
		
		chatlog = " /* " + chattime + " - " + chatuser + " WEBCHAT LOGFILE */\r\n\r\n" + chatlog1 + "\r\n/* LOGFILE END  */";
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(realPath + "/" + chatuser + "(" + chattime + ").txt"));
		bw.write(chatlog);
		bw.flush();
		bw.close();
		return null;
	}

}
