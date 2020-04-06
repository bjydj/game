<%--
  Created by IntelliJ IDEA.
  User: a'su's
  Date: 2019/5/6
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/move-top.js"></script>
    <script type="text/javascript" src="../js/easing.js"></script>
</head>
<body>
<div class="header">
    <%@include file="head.jsp"%>
    <div class="wrap">
    </div>
        <div class="main">
            <div class="wrap">
                <div class="content">
                    <div class="content_top">
                        <div class="back-links">
                            <p><a href="index.html">主页</a> &gt;&gt;<a href="#" class="active">登录</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="section group">
                        <div class="col span_2_of_3">
                            <div class="contact-form">
                                <h2>登录</h2>
                                <form   action="/client/login.do" method="post">
                                    <div>
                                        <span><label>名称</label></span>
                                        <input class="text_box"  id="username" name="username" type="text" >
                                    </div>
                                    <div>
                                        <span><label>密码</label></span>
                                        <span><input class="textbox" id="password" name="password" type="text" ></span>
                                    </div>
                                    <div class="form-group">
                                        <p style="color: red">${msg}</p>

                                    </div>
                                    <td colspan="2" style="padding-top:10px; text-align:center">
                                        <input name="image" type="image" onclick="return formcheck()" src="/images/loginbutton.png" width="90" height="30" />
                                    </td>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</body>
</html>
