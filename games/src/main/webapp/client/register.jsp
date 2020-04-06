<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
<title>Contact</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/form.js"></script>
</head>
<body>
	<div class="header">
		<%@include file="head.jsp"%>
  	  		<div class="wrap">
   		</div>
   </div>
 <div class="main">
 	<div class="wrap">
     <div class="content">
     	<div class="content_top">
    		<div class="back-links"  style="width: 100px;">
    		<p><a href="index.html">主页</a> &gt;&gt; <a href="#" class="active">注册</a></p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    	<div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2>注册</h2>
					    <form method="get" action="/client/register.do" id="form1" onsubmit="return checkForm();">
					    	<div>
						    	<span><label>名称</label></span>

								<span><input id="username" name="username" type="text" class="textbox" onkeyup="checkUsername();" onblur="checkOnblurUsername()"></span>
                                <td colspan="2">
									<span id="usernameMsg" style="color: red;"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font>
								</td>
						    </div>
						    <div>
						    	<span><label>密码</label></span>
						    	<span><input id="password" name="password" type="text" class="textbox" onkeyup="checkPassword();"></span>
								<td><span id="passwordMsg"style="color: red;"></span><font color="#999999">密码请设置6-16位字符</font></td>
							</div>
							<div>
								<span><label>重复密码</label></span>
								<td>
									<input type="text" class="textbox"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
								</td>
								<td><span id="confirmMsg"style="color: red;"></span>&nbsp;</td>
							</div>
						    <div>
						     	<span><label>电子邮箱</label></span>
						    	<span><input id="email" name="email" type="text" class="textbox" onkeyup="checkEmail();" onblur="checkOnblurEmail()"></span>
								<td colspan="2"><span id="emailMsg" style="color: red;"></span><font color="#999999">请输入有效的邮箱地址</font></td>
							</div>
							<div>
									<td style="text-align: right">性别：</td>
									<td colspan="2">&nbsp;&nbsp;
									 	<input type="radio" name="gender" value="男" checked="checked" /> 男
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="gender" value="女" /> 女
									</td>
									<td>&nbsp;</td>
 							</div>
							<div>
								<tr>
									<span><label>联系电话</label></span>
									<td colspan="2">
										<input type="text" class="textinput"
											   style="width: 350px" name="telephone" />
									</td>
									<td>&nbsp;</td>
								</tr>
							</div>
						    <div>
						    	<span><label>个人描述</label></span>
						    	<span><textarea name="introduce"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="注册" onclick="tijiao()"  class="mybutton"  name="submit"width="140" height="35"></span>
						   </div>
					    </form>
				  </div>
  				</div>
			  </div>		
         </div> 
    </div>
 </div>
 <%--  <div class="footer">
   	  <div class="wrap">	

			 <div class="copy_right">
		   </div>
        </div>
    </div>--%>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
		function tijiao() {
            $("#form1").submit
        }
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>


<script type="text/javascript">
        function checkOnblurUsername(){

            var username = $("#username").val();
			var msg = $("#usernameMsg");
			var path="/client/checkUsername.do";
			if (checkUsername()==true){
				$.ajax({
					url:path,
					type:"POST",
					contentType:'application/json',
					data:JSON.stringify({username:username}),

					success:function (data) {
						if (data.flag==true){
							msg.html("用户名可以注册");
							msg.css({"color":"green"})
						}else {
							msg.html("用户名不能注册");
							msg.css({"color":"red"})
						}
					}
				})
			}

        }
</script>
</body>
</html>

