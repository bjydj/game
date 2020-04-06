<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/jquery/jquery-1.4.2.js"></script>
	<%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
		}
		//删除商品
		function p_del() {
			var msg = "您确定要删除该商品吗？";   
			if (confirm(msg)==true){
			return true;   
			}else{
			return false;
			}
		}   
	</script>
</HEAD>
<body>
	<br />
	<form id="Form1" name="Form1"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品编号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">类别：</td>
								<td class="ta_01" bgColor="#ffffff">
								<select name="cid" id="cid">
										<option value="" selected="selected" name="cid">--选择商品类别--</option>
										<c:forEach items="${clist}" var="c">
											<option value="${c.id}">${c.name}</option>
										</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" id="name" name="name" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="minprice" size="10" value="" />
									- 
									<input type="text" name="maxprice" size="10" value="" />
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="button" id="search" name="search" value="&#26597;&#35810;" class="button_view" onclick="searchByCondition()">
										&#26597;&#35810;
									</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商 品 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
							&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="24%">商品编号</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">优惠价格</td>
								<td width="8%" align="center">商品类别</td>
								<td width="8%" align="center">编辑</td>
								<td width="8%" align="center">删除</td>
							</tr>
							<tbody id="showPorducts">
                            <!--  循环输出所有商品 -->
							<c:forEach items="${plist}" var="p">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.specialOffer}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category.name}</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="/product/findByIdproductorcartory.do?id=${p.id}">
											<img src="/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="/product/deleteProduct.do?id=${p.id}" onclick="javascript:return p_del()">
												<img src="/admin/images/i_del.gif"
												width="16" height="16" border="0" style="CURSOR: hand">
										</a>
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

<script>
	function searchByCondition() {
   var formDate = $("#Form1").serialize();
  $.ajax({
	url:"/product/searchByCondition.do;",
	type:"POST",
	data:formDate,
	dateType:"json",
	success:function (data) {
		/*原内容清空*/
		var str1="";
		$("#showPorducts").html("");
		/*为页面内容重写，拼接*/
		for (var i = 0;i<data.length;i++) {
			str1 = "<tr onmouseover=\"this.style.backgroundColor = 'white'\"\n" +
					"\tonmouseout=\"this.style.backgroundColor = '#F5FAFE';\">"+
					"<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"200\">"+ data[i].id + "</td>"+
					"<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"18%\">"+ data[i].name + "</td>"+
					"<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"8%\">"+ data[i].price + "</td>"+
					"<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"8%\">"+ data[i].specialOffer + "</td>"+
					"<td style=\"CURSOR: hand; HEIGHT: 22px\" align=\"center\" width=\"8%\">"+ data[i].category.name + "</td>"+
					"<td align=\"center\" style=\"HEIGHT: 22px\" width=\"7%\">\n" +
					"<a href=\"/product/findProductById.do?id="+data[i].id+"\">\n" +
					"\t<img src=\"/admin/images/i_edit.gif\" border=\"0\" style=\"CURSOR: hand\">\n" + "</a>\n" +
					"</td>" +
					"<td align=\"center\" style=\"HEIGHT: 22px\" width=\"7%\">\n" +
					"<a href=\"/product/deleteProduct.do?id=${p.id}\" onclick=\"javascript:return p_del()\">\n" +
					"<img src=\"/admin/images/i_del.gif\" width=\"16\" height=\"16\" border=\"0\" style=\"CURSOR: hand\">\n" +
					"</a>\n" +
					"</td>"+

					"</tr>";
			$("#showPorducts").append(str1);

		}
	}
})

	}
</script>
</body>
</HTML>