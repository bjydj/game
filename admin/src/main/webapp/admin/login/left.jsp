<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>菜单</title>
	<link href="${pageContext.request.contextPath}/admin/css/left.css" rel="stylesheet" type="text/css">
</head>
	<body style="background-color: #5580D7;color: black">
		<table width="100" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="12"></td>
		  </tr>
		</table>
		<table width="100%" border="0">
			  <tr>
			  	<td><a href="/product/listProducts.do" target="mainFrame" class="left_list">商品管理</a></td>
			  </tr>
<%--			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/admin/products/download.jsp" target="mainFrame" class="left_list">销售榜单</a></td>
			  </tr>--%>
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/order/findAllOrder.do" target="mainFrame" class="left_list">订单管理</a></td>
			  </tr>
			  <tr>
			  	<td><a href="/notice/findAll.do" target="mainFrame" class="left_list">公告管理</a></td>
			  </tr>
		</table>
	</body>
</html>
