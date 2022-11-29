<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="util.DBSql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="util.JdbcTemplate" %>
<%@ page import="util.ImgLink" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: ahngilung
  Date: 2022/11/17
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection connection = JdbcTemplate.getConnection();
    Integer nowVoteCount = readAllVoteCount(connection);

    int inputNum = Integer.parseInt(request.getParameter("num"));
    int voteRate = (int) ((double) nowVoteCount/(double) 14 * 100.0);
    String leeYoungJiImg = ImgLink.LeeYoungZyImg.url();
    String maDongSuckImg = ImgLink.MaDongSuckImg.url();
    String hanSoHeeImg = ImgLink.HanSoHeeImg.url();
    String leeJongSuckImg = ImgLink.LeeJongSuckImg.url();
    String waitImg = ImgLink.WaitImg.url();
    String[] links = {leeYoungJiImg , maDongSuckImg, hanSoHeeImg, leeJongSuckImg, waitImg};

    System.out.println(nowVoteCount);
    
    if(Objects.equals(nowVoteCount,14)){
        response.sendRedirect("voteResult.jsp");
    }
%>

<%!
    public Integer readAllVoteCount(Connection connection)  {
        Integer voteCount = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.readVoteCountSql.text());){
        	try(ResultSet responseData = preparedStatement.executeQuery()){
    			System.out.print(Objects.isNull(responseData));
    				if(responseData != null) {
    					while(responseData.next()) {
                			voteCount = responseData.getInt("count");
                			System.out.print(voteCount);
    					}
    				}
    			}
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return voteCount;
    }
%>
<script>
    window.setTimeout(jbFunc,5000);
    function jbFunc() {
        window.location.href='vote_progress.jsp?num=<%=inputNum%>';
    }
</script>
<style type="text/css">
    div {
        margin: 10px 0px;
        text-align: center;
        font-family: Consolas, monospace;
        font-style: italic;
        font-size: 13px;
    }
    .c {
         border: 5pt groove #3f51b5;
     }
     .link{
		text-decoration: none;
		background-color: #e091a9;
		     color: white;
		     padding: 15px 25px;
		     text-align: center;
		     text-decoration: none;
		     display: inline-block;
		     float:right;
		}
		
		
		link:hover, link:active{
		 background-color: #FF4500;
		}
    </style>
<html>
<head>
    <meta charset="utf-8">
    <title>HTML</title>
    <style>
        #jb {
            width: 80%;
            height: 50px;
        }
    </style>
</head>
<body>
<%
if(session.getAttribute("userName") != null) { %>
	<a class = "link" href="Logout.jsp">로그아웃</a>
<% }
%>

<div class="c">
    <img src="<%=links[inputNum]%>" width="400" height="450">
    <h2>땡큐 떙큐</h2>
</div>

<div class="c">
    <h2>현재 투표 진행율</h2>
    <h2><%=voteRate%>%</h2>
    <progress value="<%=voteRate%>" max="100" id="jb"></progress>
   <div><button onclick="jbFunc()" >현재 투표 진행률 수동 갱신하기</button></div>
</div>
</body>
</html>
