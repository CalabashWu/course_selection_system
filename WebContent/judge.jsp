<%@ page language="java" contentType="text/html;  charset=UTF-8" import="java.sql.*"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
<title>登录失败</title>  
</head>  

<body>  
  
<%  
    String u = request.getParameter("username");  
    String p = request.getParameter("passwd");
//     out.print(u+" "+p);
  
    Class.forName("com.mysql.jdbc.Driver");    
    Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
    Statement st = ct.createStatement();
    ResultSet rs = st.executeQuery("select * from info where username ='"+u+"'");
    if(rs.next()){
    	if(rs.getString("passwd").equals(p)){
    			session.setAttribute("username", u);
    			if(rs.getString("grade").equals("1")){
    				response.sendRedirect("manager/index.jsp");
    			}else if(rs.getString("grade").equals("2")){
    				response.sendRedirect("teacher/course.jsp");	
    			}else{
    				response.sendRedirect("student/index.jsp");	
    			}	
    	}else{
    		response.sendRedirect("login.jsp?error=1");
//     		out.print("密码错误!");
    	}
    }else{
    	response.sendRedirect("login.jsp?error=2");
//     	out.print("用户名错误!");
    }
    ct.close();
%>  
</body>  
</html>