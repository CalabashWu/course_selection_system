<%@ page language="java" contentType="text/html;  charset=UTF-8" import="java.sql.*"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
<title>修改信息</title>  
</head>  

<body>  
  
<%  
    String Grade = request.getParameter("Grade");  
    String stu_no = request.getParameter("stu_no");
    String lessonNo = request.getParameter("lessonNo");
//     String nickname = new String(request.getParameter("Nickname").getBytes("ISO-8859-1"),"UTF-8");
//     String u = (String)session.getAttribute("username");
  
    Class.forName("com.mysql.jdbc.Driver");    
    Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");      
    Statement st = ct.createStatement();
    int addGrade = st.executeUpdate("update sc set Grade = '"+Grade+"' where username='"+stu_no+"' and lessonNo='"+lessonNo+"'");
    response.sendRedirect("index.jsp?addGrade="+addGrade+"&lessonNo="+lessonNo);
    ct.close();
%>  
</body>  
</html>