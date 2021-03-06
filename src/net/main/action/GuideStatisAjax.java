package net.main.action;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.db.AdminDAO;
import util.actionForward.Action;
import util.actionForward.ActionForward;

public class GuideStatisAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String selected = request.getParameter("selected");
	
		
		int sta_type = 0;
		
		int nYear;
		  
		 
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		nYear = calendar.get(Calendar.YEAR);
		
		
		
		if(selected.equals("month")){
			sta_type=nYear;
			
			AdminDAO aDAO = new AdminDAO();
			 List<Map<String,Integer>> VisitMonth = aDAO.getVisitMonthCount(sta_type);
			 List<Map<String,Integer>> BookMonth = aDAO.getBookMonthCount(sta_type);
			 List<Map<String,Integer>> BbookMonth = aDAO.getBbookMonthCount(sta_type);

			/****** JSON ******/
			JsonArray arr = null;
			JsonObject json = null;
			int month=0;
			int count=0;
			Map m = null;
			int month1=0;
			int count1=0;
			Map m1 = null;
			int month2=0;
			int count2=0;
			Map m2 = null;

			
			String result = "";
			for(int j=1; j<13; j++){
				//visit 월별 방문자수
				for(int i=0; i<VisitMonth.size(); i++){
					 m = VisitMonth.get(i);
					if((Integer)m.get("month") == j){
						month = Integer.parseInt(m.get("month").toString());
						count = Integer.parseInt(m.get("count").toString());
						break;
					}
				}
				if((Integer)m.get("month") != j){
					month = j;	count = 0;
				}
				
							
					json= Json.createObjectBuilder()
						  .add("month", month)
						  .add("count", count).build();
						result += json.toString();
						if(j != 12)	result += ",";
				}
			
			result += ",";
			for(int a=1; a<13; a++){
				//book 월별 입고수
				for(int q=0; q<BookMonth.size(); q++){
					 m1 = BookMonth.get(q);
					if((Integer)m1.get("month") == a){
						month1 = Integer.parseInt(m1.get("month").toString());
						count1 = Integer.parseInt(m1.get("count").toString());
						break;
					}
				}
				if((Integer)m1.get("month") != a){
					month1 = a;	count1 = 0;
				}
				
				
							
					json= Json.createObjectBuilder()
						  .add("month1", month1)
						  .add("count1", count1).build();
						result += json.toString();
						if(a != 12)	result += ",";
				}
			
			result += ",";
			for(int a=1; a<13; a++){
				//book 월별 입고수
				for(int f=0; f<BbookMonth.size(); f++){
					 m2 = BbookMonth.get(f);
					if((Integer)m2.get("month") == a){
						month2 = Integer.parseInt(m2.get("month").toString());
						count2 = Integer.parseInt(m2.get("count").toString());
						break;
					}
				}
				if((Integer)m2.get("month") != a){
					month2 = a;	count2 = 0;
				}
					
					json= Json.createObjectBuilder()
						  .add("month2", month2)
						  .add("count2", count2).build();
						result += json.toString();
						if(a != 12)	result += ",";
				}

			
			arr = Json.createArrayBuilder()
					.add(result).build();
			
			System.out.println(arr);

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(arr);
			out.flush();
			out.close();
			
			return null;
			
			
		}else if(selected.equals("year")){
			sta_type=nYear;
			
			AdminDAO aDAO = new AdminDAO();
			 List<Map<String,Integer>> VisitYear = aDAO.getVisitYearCount(sta_type);
			 List<Map<String,Integer>> BookYear = aDAO.getBookYearCount(sta_type);
			 List<Map<String,Integer>> BbookYear = aDAO.getBbookYearCount(sta_type);

			 
			
			/****** JSON ******/
			JsonArray arr = null;
			JsonObject json = null;
			int year=0;
			int count=0;
			Map m = null;
			int year1=0;
			int count1=0;
			Map m1 = null;
			int year2=0;
			int count2=0;
			Map m2 = null;

			
			String result = "";
			for(int j=(sta_type-4); j<=sta_type; j++){
				//visit 월별 방문자수
				for(int i=0; i<VisitYear.size(); i++){
					 m = VisitYear.get(i);
					if((Integer)m.get("year") == j){
						year = Integer.parseInt(m.get("year").toString());
						count = Integer.parseInt(m.get("count").toString());
						break;
					}
				}
				if((Integer)m.get("year") != j){
					year = j;	count = 0;
				}
				
							
					json= Json.createObjectBuilder()
						  .add("year", year)
						  .add("count", count).build();
						result += json.toString();
						if(j != sta_type)	result += ",";
				}
			
			result += ",";
			for(int a=(sta_type-4); a<=sta_type; a++){
				//book 월별 입고수
				for(int q=0; q<BookYear.size(); q++){
					 m1 = BookYear.get(q);
					if((Integer)m1.get("year") == a){
						year1 = Integer.parseInt(m1.get("year").toString());
						count1 = Integer.parseInt(m1.get("count").toString());
						break;
					}
				}
				if((Integer)m1.get("year") != a){
					year1 = a;	count1 = 0;
				}
				
				
							
					json= Json.createObjectBuilder()
						  .add("year1", year1)
						  .add("count1", count1).build();
						result += json.toString();
						if(a != sta_type)	result += ",";
				}
			
			result += ",";
			for(int b=(sta_type-4); b<=sta_type; b++){
				//bbook 월별 대출수
				for(int w=0; w<BbookYear.size(); w++){
					 m2 = BbookYear.get(w);
					if((Integer)m2.get("year") == b){
						year2 = Integer.parseInt(m2.get("year").toString());
						count2 = Integer.parseInt(m2.get("count").toString());
						break;
					}
				}
				if((Integer)m2.get("year") != b){
					year2 = b;	count2 = 0;
				}
				
							
					json= Json.createObjectBuilder()
						  .add("year2", year2)
						  .add("count2", count2).build();
						result += json.toString();
						if(b != sta_type)	result += ",";
				}
			

			
			arr = Json.createArrayBuilder()
					.add(result).build();
			System.out.println(arr);

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(arr);
			out.flush();
			out.close();
			
			return null;
			
		}else{
			return null;
		}
		
		

		

	}
	
}
