package net.board.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.actionForward.Action;
import util.actionForward.ActionForward;

public class FileDownloadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileDownloadAction execute()");
		request.setCharacterEncoding("utf-8");
		
        // 파일 이름을 받아서
        String filename = request.getParameter("filename");

        // 실제 파일이 들어있는 경로에 설정한 
        // upload폴더와 파일 이름을 붙여서
        String uploadFileName = request.getRealPath("/upload") + "/" + filename;
 
        // 해당 스트링에서 파일을 가져온 후
        File downFile = new File(uploadFileName);
 
        // 다운로드
        if (downFile.exists() && downFile.isFile()) {
            try {
                // 파일 사이즈 조사하고
                long filesize = downFile.length();

                // content타입과 해더를 셋팅하여 파일을 출력
                response.setContentType("application/x-msdownload");
                response.setContentLength((int) filesize);
                String strClient = request.getHeader("user-agent");
 
                if (strClient.indexOf("MSIE 5.5") != -1) {
                    response.setHeader("Content-Disposition", "filename=" + filename + ";");
                } else {
                    response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
                }
                response.setHeader("Content-Length", String.valueOf(filesize));
                response.setHeader("Content-Transfer-Encoding", "binary;");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Cache-Control", "private");
 
                byte b[] = new byte[1024];
 
                BufferedInputStream fin = new BufferedInputStream(new FileInputStream(downFile));
                BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
 
                int read = 0;
 
                while ((read = fin.read(b)) != -1) {
                    outs.write(b, 0, read);
                }
                outs.flush();
                outs.close();
                fin.close();
            } catch (Exception e) {
                System.out.println("Download Exception : " + e.getMessage());
            }
        } else {
            System.out.println("Download Error : downFile Error [" + downFile + "]");
        }

		return null;
	}
}