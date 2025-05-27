<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.toiukha.spot.model.SpotVO"%>
<%
SpotVO spotVO = (SpotVO) request.getAttribute("spotVO");
%>
<html>
<head>
<title>景點資料 - listOneSpot.jsp</title>
<style>
body {
	font-family: "微軟正黑體", Arial, sans-serif;
	background: #fafbfc;
}

.header-bar {
	margin-bottom: 10px;
}

.back-btn {
	vertical-align: middle;
	margin-right: 8px;
}

.main-title {
	display: inline-block;
	font-size: 1.5em;
	font-weight: bold;
	color: #222;
	vertical-align: middle;
}

.content-area {
	background: #fff;
	padding: 20px 28px;
	border-radius: 8px;
	box-shadow: 0 1px 6px #eee;
	margin: 0 auto;
	max-width: 800px;
}

.spot-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.spot-table th, .spot-table td {
	border: 1px solid #bbb;
	padding: 10px;
	text-align: left;
}

.spot-table th {
	background: #e6e9f2;
	color: #333;
	font-weight: bold;
	width: 120px;
}

.spot-table td {
	background: #fff;
}

.back-link {
	text-align: center;
	margin-top: 15px;
}

.back-link a {
	color: #8a2be2;
	text-decoration: underline;
}

.action-buttons {
	text-align: center;
	margin-top: 15px;
}

.action-buttons a {
	display: inline-block;
	margin: 0 8px;
	padding: 6px 16px;
	background: #4e7cff;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.action-buttons a:hover {
	background: #365bb5;
}
</style>
</head>
<body>
	<!-- 回首頁圖片按鈕 -->
	<div class="header-bar">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img
			src="<%=request.getContextPath()%>/spot/images/back1.gif" alt="回首頁"
			class="back-btn" width="80" height="40">
		</a> <span class="main-title">景點資料詳細</span>
	</div>

	<div class="content-area">
		<table class="spot-table">
			<tr>
				<th>景點編號</th>
				<td><%=spotVO.getSpotId()%></td>
			</tr>
			<tr>
				<th>景點名稱</th>
				<td><%=spotVO.getSpotName()%></td>
			</tr>
			<tr>
				<th>建立者ID</th>
				<td><%=spotVO.getCrtId()%></td>
			</tr>
			<tr>
				<th>地址</th>
				<td><%=spotVO.getSpotLoc()%></td>
			</tr>
			<tr>
				<th>緯度</th>
				<td><%=spotVO.getSpotLat()%></td>
			</tr>
			<tr>
				<th>經度</th>
				<td><%=spotVO.getSpotLng()%></td>
			</tr>
			<tr>
				<th>狀態</th>
				<td><%=spotVO.getSpotStatus()%></td>
			</tr>
			<tr>
				<th>描述</th>
				<td><%=spotVO.getSpotDesc()%></td>
			</tr>
		</table>

		<div class="action-buttons">
			<a href="select_page.jsp">再次查詢</a> <a
				href="SpotServlet?action=getOne_For_Update&spotId=<%=spotVO.getSpotId()%>">修改此景點</a>
		</div>

		<div class="back-link">
			<a href="listAllSpot.jsp">回所有景點列表</a>
		</div>
	</div>
</body>
</html>
