<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/jquery/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-form.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
</HEAD>
<body>
	<form id="fileform" name="Form1"
		action="${pageContext.request.contextPath}/product/addProduct.do" method="post"
		enctype="multipart/form-data">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="name" class="bg" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="price" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">优惠价格</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="specialOffer" class="bg" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
					<select name="cid" id="category">
						<option value="" selected="selected">--选择商品类加--</option>
						<c:forEach items="${clist}" var="c">
							<option value="${c.id}">${c.name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">出版社：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="platform" class="bg" /></td>

				<td align="center" bgColor="#f5fafe" class="ta_01">作者：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="author" class="bg" /></td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3">
				<input type="file" name="file" size="30" value="" />
				</td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<input type="button" class="button_ok" value="确定" onclick="addProduct()">
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel">					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>

<script>
	function addProduct() {
		//需要jquery_form.js文件支持
		var option = {
			url:"/product/addProduct.do",
			type:"post",
			dataType:"json",
			headers:{"ClientCallMode":"ajax"},
			success:function (data) {
				alert(data.message);
				if (data.status == 0) {
					window.location.href="/product/listProducts.do";
				}
			}
		};

		/*fileform是表单的id*/
		$("#fileform").ajaxSubmit(option);
		return false;
	}


</script>
</body>
</HTML>