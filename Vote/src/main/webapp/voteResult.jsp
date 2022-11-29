<%@page import="java.util.List"%>
<%@page import="enter.EnterDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="enter.EnterDao"%>
<%@ page import="util.ImgLink" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
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
</head>
<body>
<%
if(session.getAttribute("userName") != null) { %>
	<a class = "link" href="Logout.jsp">로그아웃</a>
<% }
%>
<div align="center"><br/>
	<h1>투표 결과</h1>
	<%
		String leeYoungJiImg = ImgLink.LeeYoungZyImg.url();
	    String maDongSuckImg = ImgLink.MaDongSuckImg.url();
	    String hanSoHeeImg = ImgLink.HanSoHeeImg.url();
	    String leeJongSuckImg = ImgLink.LeeJongSuckImg.url();
	
		EnterDao dao = new EnterDao();
		ArrayList<enter.EnterDto> enterList = dao.selectAll();
		
		Random r= new Random(); //막대그래프 랜덤한 색깔 부여
		
		// 1등 수 
		int max = 0;
		for(int i=0; i<enterList.size(); i++) {
			int num = enterList.get(i).getVoteCount();
			if(max < num) {
				max = num;
			}
		} 
		
		// 1등 이름
		ArrayList<String> enterMax = new ArrayList<String>();
		for(int i=0; i<enterList.size(); i++) {
			if(max == enterList.get(i).getVoteCount()) {
				enterMax.add(enterList.get(i).getEnterName());
			}
		} 
		
		// 1등 이름 출력
		String winnerName = "";
		String winnerImg = "";
	%>
	<table border="1">
		<td bgcolor=#D9E5FF colspan="100%" align="center"><b>포스코ICT
				4기 인기 연예인 1등은?</b></td>
		<tr>
			<%
			for (int i = 0; i < enterMax.size(); i++) {
				winnerName = enterMax.get(i);
				switch (winnerName) {
				case "이영지":
					winnerImg = leeYoungJiImg;
					break;
				case "한소희":
					winnerImg = hanSoHeeImg;
					break;
				case "마동석":
					winnerImg = maDongSuckImg;
					break;
				case "이종석":
					winnerImg = leeJongSuckImg;
					break;
				}
			%>
			<td>
				<%
				out.print(winnerName);
				%>
			
			<td>
				<%
				out.print("<img src=" + winnerImg + " width=300px, height=400px >");
				}
				%>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
		google.charts.load('current', {'packages' : [ 'corechart' ]});
		google.charts.setOnLoadCallback(drawChart);

		var enterName = [ '이영지', '한소희', '마동석', '이종석' ];
		var voteCount = [<%=enterList.get(0).getVoteCount()%>,<%=enterList.get(1).getVoteCount()%>,<%=enterList.get(2).getVoteCount()%>,<%=enterList.get(3).getVoteCount()%>];
		
		function drawChart() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'enterName');
			data.addColumn('number', 'voteCount');
			for (i = 0; i < enterName.length; i++) {
				data.addRow([ enterName[i], voteCount[i] ]);

			}
			var options = {
				title : '인기 투표 결과'
			};

			// 어떤 위치에 chart를 표현할 것인지에 대한 html tag 정보 반영
			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			//data와 option값을 적용하여 chart 그리기
			chart.draw(data, options);
		}
	</script>
	
	<br/>		
	<h1>그래프</h1>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	
	<br/>
	<h1>투표 상세 현황</h1>
	    <table width="700"  align="center" border="1">
        <tr bgcolor=#D9E5FF>
            <th> 연예인 이름 </th>
            <th> 득표수 </th>
            <th> 득표율(bar) </th>
            <th> 득표율(%) </th>
        </tr>
		<%
		// 총 투표인원
		int sumCount = 0;
		for(int i=0; i<enterList.size(); i++){
			sumCount += enterList.get(i).getVoteCount();
		}
		
		for( enter.EnterDto enter : enterList ){
			// 투표 비율
			int ratio = new Double(Math.round((double)
					enter.getVoteCount()/sumCount*100)).intValue();
			//색상수
			String rgb = "#"+Integer.toHexString(r.nextInt(255*255*255));
		%>
        <tr>
            <td width="200" align="center"><%= enter.getEnterName() %></td>
            <td width="150" align="center"><%= enter.getVoteCount() %></td>
            <td >
            	<table width="<%=ratio*2.5%>">
					<tr>
						<td bgcolor="<%=rgb%>" height = "15"></td>
					</tr>
				</table>
            </td>
            <td width="100" align="center"><%= ratio %></td>
        </tr>
		<% } %>
		<tr>
			<td colspan="4" align="center">
			<b>총 투표인원 : <%= sumCount %></b>
			</td> 
        </tr>
   		</table> <br/>
	<br/>	
</div>
</body>
</html>