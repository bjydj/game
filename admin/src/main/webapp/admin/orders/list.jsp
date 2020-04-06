<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
	</script>
</HEAD>
<body>
	<br />
	<form id="Form1" name="Form1" action="/findOrderByManyCondition" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>订 单 列 表</strong>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="right"></td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="20%">订单编号</td>
								<td align="center" width="10%">购买用户</td>
								<td align="center" width="10%">联系电话</td>
								<td width="11%" align="center">总价</td>
								<td width="10%" align="center">订单状态</td>
							</tr>
							<tbody id="showOrders">
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.id}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.receivername}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.receiverphone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${order.money}</td>
									<td width="20%" align="center">${order.paystate==0?"未支付":"已支付"}</td>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>

</body>
</HTML>