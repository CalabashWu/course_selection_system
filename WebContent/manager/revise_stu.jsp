<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改学生信息</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-style.css" rel="stylesheet">
  </head>
  
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <%
//     		String username = request.getParameter("username");
          	String username = (String)session.getAttribute("username");
          	String stu_no = request.getParameter("stu_no");
//           	session.setAttribute("stu_no", stu_no);
//           	if(stu_no == null){
//           		stu_no = (String)session.getAttribute("stu_no");	
//           	}
  			Class.forName("com.mysql.jdbc.Driver");    
  			Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
  			Statement st = ct.createStatement();
  			ResultSet rs = st.executeQuery("select * from info where username ='"+stu_no+"'");
  			String nickname = null;
  			String dept = null;
  			String sex = null;
  			String age = null;
  			String grade = null;
  			if(rs.next()){
  				nickname = rs.getString("nickname");
  				dept = rs.getString("dept");
  				sex = rs.getString("sex");
  				age = rs.getString("age");
  				grade = rs.getString("grade");
  			}
  			ct.close();
    	  %>
          <h1>欢迎<%= username %></h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li><a href="index.jsp" class="active"><i class="fa fa-home fa-fw"></i>管理学生信息</a></li>
            <li><a href="course.jsp"><i class="fa fa-bar-chart fa-fw"></i>管理课程信息</a></li>
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
      	<div class="col-1">
        	<div class="panel panel-default margin-10">
              <div class="panel-heading"><h2 class="text-uppercase">修改学生<%= stu_no %>的信息</h2></div>
                <div class="panel-body">
                  <form name="myform" action="update_stu.jsp" class="templatemo-login-form">
                    <div class="form-group">
                      <label>学号</label>
                      <label type="text" class="form-control"><%= stu_no%></label>
                      <input type="hidden" class="form-control" name="stu_no" value="<%= stu_no%>">
                    </div>
                    <div class="form-group">                      
                      <label>姓名</label>
                      <input type="text" class="form-control" name="nickname" value="<%= nickname %>">
                      </div>
                    <div class="form-group">                      
                      <label>性别</label>
                      <input type="text" class="form-control" name="sex" value="<%= sex %>">                                 
                    </div>
                    <div class="form-group">                      
                      <label>年龄</label>
                      <input type="text" class="form-control" name="age" value="<%= age %>">                                 
                    </div>
                    <div class="form-group">                      
                      <label>所在院系</label>
                      <input type="text" class="form-control" name="dept" value="<%= dept %>">                                 
                    </div>
                    <div class="form-group">                      
                      <label>用户等级</label>
                      <input type="text" class="form-control" name="grade" value="<%= grade %>">                                 
                    </div>
                    <div class="form-group">
                      <button type="button" class="templatemo-blue-button" onclick="check()">Submit</button>
                      <button type="reset" class="templatemo-blue-button" onclick="return confirm('确认重置？');">Reset</button>
                      <a href="index.jsp" class="templatemo-blue-button" onclick="return confirm('确认要取消？');" >cancel</a>
                    </div>
                  </form>
                </div>                
            </div>              
        </div>
      </div>
    </div>
	<script type="text/javascript">
		function check(){
			if(document.myform.stu_no.value == ""){
				alert("学生学号不能为空！");
			}else if(document.myform.nickname.value == ""){
				alert("学生姓名不能为空！");
			}else if(document.myform.sex.value == ""){
				alert("学生性别不能为空！");
			}else if(document.myform.age.value == ""){
				alert("学生年龄不能为空！");
			}else if(document.myform.dept.value == ""){
				alert("学生所在院系不能为空！");
			}else if(document.myform.grade.value == ""){
				alert("学生用户等级不能为空！");
			}else{
				if(confirm("确定要修改？")){
					document.myform.submit();
				}
			}
		}
	</script>
    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>        <!-- Templatemo Script -->
  </body>
</html>
