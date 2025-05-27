<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.toiukha.spot.model.SpotVO"%>
<%
SpotVO spotVO = (SpotVO) request.getAttribute("spotVO");
%>
<html>
<head>
<title>景點資料修改 - update_spot_input.jsp</title>
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

.form-area {
	background: #fff;
	padding: 22px 28px 18px 28px;
	border-radius: 8px;
	box-shadow: 0 1px 6px #eee;
	width: 350px;
	margin: 0 auto;
}

.form-area label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
}

.form-area input[type="text"] {
	width: 97%;
	padding: 6px;
	margin-top: 2px;
	border: 1px solid #bbb;
	border-radius: 4px;
}

.form-area input[type="submit"] {
	margin-top: 16px;
	background: #4e7cff;
	color: #fff;
	border: none;
	padding: 8px 24px;
	border-radius: 5px;
	font-size: 1em;
}

.form-area input[type="submit"]:hover {
	background: #365bb5;
}

.error-msg {
	color: #c00;
	margin-bottom: 10px;
}

.back-link {
	margin-top: 18px;
	text-align: center;
}

.back-link a {
	color: #8a2be2;
	text-decoration: underline;
}
</style>
</head>
<body>
	<%
	if (spotVO == null) {
	%>
	<div class="header-bar">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img
			src="<%=request.getContextPath()%>/spot/images/back1.gif" alt="回首頁"
			class="back-btn" width="80" height="40">
		</a> <span class="main-title">景點資料修改</span>
	</div>
	<div class="form-area" style="text-align: center;">
		<h3 style="color: red;">查無此景點資料，請回上一頁重新查詢。</h3>
		<div class="back-link">
			<a href="listAllSpot.jsp">回所有景點列表</a>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="header-bar">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img
			src="<%=request.getContextPath()%>/spot/images/back1.gif" alt="回首頁"
			class="back-btn" width="80" height="40">
		</a> <span class="main-title">修改景點資料</span>
	</div>
	<div class="form-area">
		<!-- 錯誤訊息顯示區塊 -->
		<c:if test="${not empty errorMsgs}">
			<div class="error-msg">
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li>${message}</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<form method="post" action="<c:url value='/spot/SpotServlet'/>">
			<input type="hidden" name="spotId" value="<%=spotVO.getSpotId()%>" />
			<label>名稱：</label> <input type="text" name="spotName"
				value="<%=spotVO.getSpotName()%>" required> <label>建立者ID：</label>
			<input type="text" name="crtId" value="<%=spotVO.getCrtId()%>"
				required> <label>地址：</label> <input type="text"
				name="spotLoc" value="<%=spotVO.getSpotLoc()%>" required> <label>緯度：</label>
			<input type="text" name="spotLat" value="<%=spotVO.getSpotLat()%>"
				required> <label>經度：</label> <input type="text"
				name="spotLng" value="<%=spotVO.getSpotLng()%>" required> <label>狀態：</label>
			<input type="text" name="spotStatus"
				value="<%=spotVO.getSpotStatus()%>" required> <label>描述：</label>
			<input type="text" name="spotDesc" value="<%=spotVO.getSpotDesc()%>"
				required> <input type="hidden" name="action" value="update" />
			<input type="submit" value="修改" />
		</form>
	</div>
	<div class="back-link">
		<a href="listAllSpot.jsp">回所有景點列表</a>
	</div>
	<%
	}
	%>
</body>
</html>
