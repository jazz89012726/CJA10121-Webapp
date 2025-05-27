<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.toiukha.spot.model.*"%>
<%
SpotService spotSvc = new SpotService();
List<SpotVO> list = spotSvc.getAll();
pageContext.setAttribute("list", list);

// ===== 分頁參數計算 =====
int rowsPerPage = 5;
int rowNumber = list.size();
int pageNumber = (rowNumber % rowsPerPage == 0) ? (rowNumber / rowsPerPage) : (rowNumber / rowsPerPage + 1);
int whichPage = 1;
int pageIndex = 0;
int[] pageIndexArray = new int[pageNumber];
for (int i = 1; i <= pageNumber; i++)
	pageIndexArray[i - 1] = (i - 1) * rowsPerPage;
try {
	whichPage = Integer.parseInt(request.getParameter("whichPage"));
	pageIndex = pageIndexArray[whichPage - 1];
} catch (Exception e) {
	whichPage = 1;
	pageIndex = 0;
}
%>
<html>
<head>
<title>所有景點資料</title>
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
	font-size: 1.8em;
	font-weight: bold;
	color: #222;
	vertical-align: middle;
}

.add-btn {
	margin-bottom: 12px;
	display: inline-block;
	background: #4e7cff;
	color: #fff;
	padding: 6px 16px;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
}

.add-btn:hover {
	background: #365bb5;
}

table {
	border-collapse: collapse;
	width: 100%;
	background: #fff;
}

th, td {
	border: 1px solid #bbb;
	padding: 7px 10px;
	text-align: center;
}

th {
	background: #e6e9f2;
	color: #333;
}

.pagination {
	margin: 12px 0;
}

.pagination a, .pagination form {
	display: inline-block;
	margin-right: 8px;
}

.pagination select {
	padding: 2px 6px;
}

.pagination input[type="submit"] {
	padding: 2px 10px;
}

.info-bar {
	margin: 10px 0 20px 0;
	color: #555;
}

.action-btn {
	margin: 0 2px;
}
</style>
</head>
<body>
	<!-- 回首頁圖片按鈕 -->
	<div class="header-bar">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img
			src="<%=request.getContextPath()%>/spot/images/back1.gif" alt="回首頁"
			class="back-btn" width="80" height="40">
		</a> <span class="main-title">所有景點資料</span>
	</div>

	<!-- 新增景點 -->
	<a href="addSpot.jsp" class="add-btn">新增景點</a>

	<!-- 分頁資訊 -->
	<div class="info-bar">
		第<%=whichPage%>/<%=pageNumber%>頁 ● 符合查詢條件如下所示：共<%=rowNumber%>筆
	</div>

	<!-- 資料表格 -->
	<table>
		<tr>
			<th>景點編號</th>
			<th>景點名稱</th>
			<th>建立者ID</th>
			<th>地址</th>
			<th>緯度</th>
			<th>經度</th>
			<th>狀態</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
		<%
		for (int i = pageIndex; i < pageIndex + rowsPerPage && i < rowNumber; i++) {
			SpotVO spotVO = list.get(i);
		%>
		<tr>
			<td><%=spotVO.getSpotId()%></td>
			<td><%=spotVO.getSpotName()%></td>
			<td><%=spotVO.getCrtId()%></td>
			<td><%=spotVO.getSpotLoc()%></td>
			<td><%=spotVO.getSpotLat()%></td>
			<td><%=spotVO.getSpotLng()%></td>
			<td><%=spotVO.getSpotStatus()%></td>
			<td><%=spotVO.getSpotDesc()%></td>
			<td>
				<form style="display: inline;" method="post" action="SpotServlet">
					<input type="hidden" name="spotId"
						value="<%=spotVO.getSpotId()%>" /> <input type="hidden"
						name="action" value="getOne_For_Update" /> <input type="submit"
						value="修改" class="action-btn" />
				</form>
				<form style="display: inline;" method="post" action="SpotServlet">
					<input type="hidden" name="spotId"
						value="<%=spotVO.getSpotId()%>" /> <input type="hidden"
						name="action" value="delete" /> <input type="submit" value="刪除"
						class="action-btn" onclick="return confirm('確定要刪除嗎？');" />
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>

	<!-- 分頁導覽列 -->
	<div class="pagination">
		<%
		if (rowsPerPage < rowNumber) {
		%>
		<%
		if (pageIndex >= rowsPerPage) {
		%>
		<a href="listAllSpot.jsp?whichPage=1">上一頁</a>
		<%
		}
		%>
		<%
		if (pageIndex + rowsPerPage < rowNumber) {
		%>
		<a href="listAllSpot.jsp?whichPage=<%=whichPage + 1%>">下一頁</a>
		<%
		}
		%>
		<%
		}
		%>
		<!-- 跳頁下拉選單 -->
		<%
		if (pageNumber > 1) {
		%>
		<form method="get" action="listAllSpot.jsp" style="display: inline;">
			<select name="whichPage">
				<%
				for (int i = 1; i <= pageNumber; i++) {
				%>
				<option value="<%=i%>" <%=(i == whichPage) ? "selected" : ""%>>跳至第<%=i%>頁
				</option>
				<%
				}
				%>
			</select> <input type="submit" value="確定" />
		</form>
		<%
		}
		%>
	</div>

	<div style="margin-top: 18px;">
		<a href="select_page.jsp" style="color: #4e7cff;">查詢單一景點</a>
	</div>
</body>
</html>
