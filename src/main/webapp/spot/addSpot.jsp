<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.toiukha.spot.model.SpotVO"%>
<%
SpotVO spotVO = (SpotVO) request.getAttribute("spotVO");
%>
<html>
<head>
<title>景點資料新增 - addSpot.jsp</title>
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
	<!-- 回首頁圖片按鈕 -->
	<div class="header-bar">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img
			src="<%=request.getContextPath()%>/spot/images/back1.gif" alt="回首頁"
			class="back-btn" width="80" height="40">
		</a> <span class="main-title">新增景點資料</span>
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
			<label>景點名稱：</label> <input type="text" name="spotName"
				value="<%=spotVO != null ? spotVO.getSpotName() : ""%>" required>
			<label>會員ID：</label> <input type="text" name="crtId"
				value="<%=spotVO != null ? spotVO.getCrtId() : ""%>" required>
			<label>地址：</label> <input type="text" name="spotLoc"
				value="<%=spotVO != null ? spotVO.getSpotLoc() : ""%>" required>
			<label>緯度：</label> <input type="text" name="spotLat"
				value="<%=spotVO != null ? spotVO.getSpotLat() : ""%>" required>
			<label>經度：</label> <input type="text" name="spotLng"
				value="<%=spotVO != null ? spotVO.getSpotLng() : ""%>" required>
			<label>狀態：</label> <input type="text" name="spotStatus"
				value="<%=spotVO != null ? spotVO.getSpotStatus() : ""%>" required>
			<label>描述：</label> <input type="text" name="spotDesc"
				value="<%=spotVO != null ? spotVO.getSpotDesc() : ""%>">
			<input type="hidden" name="action" value="insert" /> <input
				type="submit" value="新增" />
		</form>
	</div>
	<div class="back-link">
		<a href="listAllSpot.jsp">回所有景點列表</a>
	</div>
</body>
</html>
