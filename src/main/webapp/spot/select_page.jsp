<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>查詢單一景點</title>
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
	padding: 20px 28px 14px 28px;
	border-radius: 8px;
	box-shadow: 0 1px 6px #eee;
	width: 320px;
	margin: 0 auto;
}

.form-area label {
	font-weight: bold;
}

.form-area input[type="text"] {
	width: 90%;
	padding: 6px;
	margin-left: 4px;
	border: 1px solid #bbb;
	border-radius: 4px;
}

.form-area input[type="submit"] {
	margin-left: 10px;
	background: #4e7cff;
	color: #fff;
	border: none;
	padding: 6px 18px;
	border-radius: 5px;
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
		</a> <span class="main-title">查詢單一景點</span>
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
			<label>請輸入景點編號：</label> <input type="text" name="spotId" required>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="查詢">
		</form>
	</div>

	<div class="back-link">
		<a href="listAllSpot.jsp">回所有景點列表</a>
	</div>
</body>
</html>
