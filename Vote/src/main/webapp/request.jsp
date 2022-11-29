<%@ page import="util.JdbcTemplate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="util.DBSql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    Connection connection = JdbcTemplate.getConnection();
    int inputNum = Integer.parseInt(request.getParameter("check"));

    String[] names ={ "이영지","마동석","한소희","이종석" };

    String name = names[inputNum];
    String userName = (String) session.getAttribute("userName");
    addVoteCount(name, connection);
    changeUserVoteStatus(userName,connection);

    response.sendRedirect("vote_progress.jsp?num="+inputNum);
%>

<%!
    public Integer readCelebrityVoteCount(String name, Connection connection)  {
        Integer voteCount = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.readVoteSql.text());){
            preparedStatement.setString(1,name);
            try(ResultSet responseData = preparedStatement.executeQuery()){
    				if(responseData != null) {
    					while(responseData.next()) {
			                voteCount = responseData.getInt("voteCount");
    					}
    				}
    			}                
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return voteCount;
    }

    public void addVoteCount(String name, Connection connection){
        Integer voteCount = readCelebrityVoteCount(name,connection);
        try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.updateVoteCountSql.text());){
            preparedStatement.setInt(1,voteCount+1);
            preparedStatement.setString(2,name);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    public void changeUserVoteStatus(String userName, Connection connection){
        try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.updateMemberVoteStatusSql.text());){
            preparedStatement.setBoolean(1,true);
            preparedStatement.setString(2,userName);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

%>

<html>
<head>
    <title>요청 처리</title>
</head>
<body>
    <h1><%=inputNum%></h1>
    <h1><%=name%></h1>
</body>
</html>
