<%@ page import="util.JdbcTemplate" %>
<%@ page import="util.ImgLink" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="util.DBSql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: ahngilung
  Date: 2022/11/17
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.head{
font-size:50px;
text-align: center;
color: black;

}

.d{
    width: 400px;
    border-radius: 10%;
}

.f{
width: 25px;
  height: 25px;
  border: 5px solid #000000;
  border-radius: 5px;
  cursor: pointer;
  position:relative;
  top: 6px;
}
.e{
    position: relative;
    bottom: 488px;
}

.c2{
text-align: center;
position: relative;
    left: 100px;
}

.d2{
width: 378px;
height: 452px;
    border-radius: 10%;
    
}
.f2{
width: 25px;
  height: 25px;
  border: 5px solid #000000;
  border-radius: 5px;
  cursor: pointer;
  position:relative;
  top: 6px;
}

.e2{
    position: relative;
    right: 165px;
    bottom: 484px;
}
.c3{
text-align: center;
position: relative;
    left: 200px;
}

.d3{
display: block;
    width: 365px;
    height: 447px;
    border-radius: 10%;
    background-color: #24212f;
}

.f3{
width: 25px;
  height: 25px;
  border: 5px solid #000000;
  border-radius: 5px;
  cursor: pointer;
  position:relative;
  top: 6px;
}

.e3{
    position: relative;
    right: 159px;
    bottom: 479px;
}

.c4{
text-align: center;
position: relative;
    left: 300px;
}

.d4{
display: block;
    width: 362px;
    height: 448px;
    border-radius: 10%;
    background-color: #24212f;
}
.f4{
width: 25px;
  height: 25px;
  border: 5px solid #000000;
  border-radius: 5px;
  cursor: pointer;
  position:relative;
  top: 6px;
}

.e4{
    position: relative;
    right: 158px;
    bottom: 480px;
}
.pink-outline{
	margin: 0;
    padding: 0;
    box-sizing: border-box;
	text-align: center;
    padding: 20px;
    background: white;
    display: table-cell;
    margin: 20px;
    border: 3px solid #f199bc;
    color: black;
        position: relative;
    left: 932px;
    top: 100px;
    position: relative;
    left: 1003px;
}
.pink-outline:hover {
    background-color: #f199bc;
    color: white;
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}
.pink-outline2{
	margin: 0;
    padding: 0;
    box-sizing: border-box;
	text-align: center;
    padding: 20px;
    background: white;
    display: table-cell;
    margin: 20px;
    border: 3px solid #f199bc;
    color: black;
        position: relative;
    left: 900px;
    top: 100px;
}
.pink-outline2:hover {
    background-color: #f199bc;
    color: white;
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
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

.z{
position: relative;
    right: 66px;
    top: 60px;

}
</style>
</head>
<body>
<%
    String leeYoungJiImg = ImgLink.LeeYoungZyImg.url();
    String maDongSuckImg = ImgLink.MaDongSuckImg.url();
    String hanSoHeeImg = ImgLink.HanSoHeeImg.url();
    String leeJongSuckImg = ImgLink.LeeJongSuckImg.url();

    Connection connection = JdbcTemplate.getConnection();
    String userName = (String) session.getAttribute("userName");
    Boolean userVoteChecked = isVoteChecked(userName,connection);
    if(userVoteChecked != null) {
	    if(userVoteChecked){
	        response.sendRedirect("vote_progress.jsp?num=4");
	    } 
    }
%>

<%!
    public Boolean isVoteChecked(String name, Connection connection){
        Boolean flag = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(DBSql.readVoteCheckSql.text());){
            preparedStatement.setString(1,name);
            try(ResultSet responseData = preparedStatement.executeQuery()){
    			System.out.print(Objects.isNull(responseData));
    			
    				if(responseData != null) {
    					while(responseData.next()) {
			                flag = responseData.getBoolean("isVote");
    					}
    				}
    			}
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return flag;
    }
%>

<%
if(session.getAttribute("userName") != null) { %>
	<a class = "link" href="Logout.jsp">로그아웃</a>
<% }
%>

<script type="text/javascript">
    function clickOnlyOne(self){
        const boxes = document.getElementsByName("check");
        boxes.forEach((checkbox) =>{
            checkbox.checked =false;
        })
        self.checked = true;
    }
</script>
<form action="request.jsp" method="post">
<h1 class = "head">⭐  포스코 4기 연예인 인기 투표  ⭐</h1>
<div class = "a" style = "display: flex; position: relative; left: 70px; top: 100px;">
<div class= "c">

<img class = "d" src=<%=leeYoungJiImg%>>
<div style = " position: relative; left: 150px; top: 25%;">이영지<input type='checkbox' class = "f" name='check' value='0' onclick="clickOnlyOne(this)" />
</div>
<img class = "e" src="img/5.PNG">

</div>



<div class= "c2" style = "text-align: center;">
<img class = "d2" src=<%=maDongSuckImg%>>
<div style = " position: relative; top : 25%">마동석<input type='checkbox' class = "f2" name='check' value='1' onclick="clickOnlyOne(this)" /></div>
<img class = "e2" src="img/6.PNG">
</div>


<div class= "c3" >
<img class = "d3" src=<%=hanSoHeeImg%>>
<div style = " position: relative; top : 25%">한소희<input type='checkbox' class = "f3" name='check' value='2' onclick="clickOnlyOne(this)" /></div>
<img class = "e3" src="img/7.PNG">
</div>


<div class= "c4" >
<img class = "d4" src=<%=leeJongSuckImg%>>
<div style = " position: relative; top : 25%">이종석<input type='checkbox' class = "f4" name='check' value='3' onclick="clickOnlyOne(this)" /></div>
<img class = "e4" src="img/8.PNG">
</div>

</div>

<div class = "z">
   <input class = "pink-outline" type="submit" value="투표하기"/>
    </div>
</form>
</body>
</html>
