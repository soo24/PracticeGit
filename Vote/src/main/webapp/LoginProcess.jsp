<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="util.JdbcTemplate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="util.DBSql" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Objects" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	response.setContentType("text/html; charset=utf-8"); // 한글 사용을 위한 설정
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	Connection connection = JdbcTemplate.getConnection();

	boolean isLoginChecked = isMatches(userId, userPwd, connection);

	if(isLoginChecked) {
	//로그인 성공
		session.setAttribute("userName", userId);
		session.setAttribute("userPwd", userPwd);
		response.sendRedirect("index.jsp");
	}else {
		request.setAttribute("LoginErrMsg", "<script>alert('로그인 오류입니다.');</script>");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>

<%!
	public boolean isMatches(String name, String userPwd, Connection connection){
		String responsePwd = null;
		try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.readPwdSql.text());){
			preparedStatement.setString(1,name);
			
			try(ResultSet responseData = preparedStatement.executeQuery()){
				System.out.print(Objects.isNull(responseData));
			
				if(responseData != null) {
					while(responseData.next()) {
						responsePwd = responseData.getString("pwd");
					}
				}
			}
		}catch (SQLException e){
			System.out.println(e.getMessage());
		}
		if(Objects.isNull(responsePwd) || !Objects.equals(responsePwd, userPwd)){
			return false;
		}
		return true;
	}
%>
</body>
</html>