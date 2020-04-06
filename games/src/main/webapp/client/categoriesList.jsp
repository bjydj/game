<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>商品</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/move-top.js"></script>
    <script type="text/javascript" src="../js/easing.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <style>
        .add{
            display: inline-block;
            width: 70px;
            height: 20px;
            background: orangered;
        }
    </style>
</head>
<body>
<div class="header">
    <%@include file="head.jsp"%>
</div>
<%@include file="categories.jsp"%>

<div class="row-fluid" >


            <div class="container" >



                <div class="row clearfix" >


                    <div class="col-md-12 column" style="border: #0f0f0f 1px solid; width: 919px">
                        <c:forEach items="${pListc}" var="p">
                        <ul style="display: block ;width: 904px;height:162px;border: #0f0f0f 1px solid;">
                                <li style=";margin-bottom: 60px;">
                                    <a style="float: left; " href="/product/selectProductOrCategory.do?id=${p.id}">
                                        <img alt="140x140" src="${p.imgurl}" width="128" height="160" />
                                    </a>
                                    <p>&nbsp;&nbsp;&nbsp;<a style="color: orangered ;font-size: 20px;font-family: 黑体" href="/product/selectProductOrCategory.do?id=${p.id}">${p.name}</a></p>
                                    <ul style="width: 630px ;height: 90px">
                                     <li>&nbsp;&nbsp;&nbsp;发售时间:${p.productTime}</li>
                                     <li>&nbsp;&nbsp;&nbsp;价格:${p.price}</li>
                                     <li>&nbsp;&nbsp;&nbsp;平台:${p.platform}</li>
                                    </ul>
                                    &nbsp;&nbsp;&nbsp;<div class="add">&nbsp;<a href="/product/selectProductOrCategory.do?id=${p.id}" style="color: white">查看详情</a></div>
                                </li>
                        </ul>
                        </c:forEach>

                    </div>


                </div>
            </div>


    </div>


<%--
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            <div>
                <%@include file="categories.jsp"%>
            </div>
        </div>
        <div class="span2">
            <img alt="140x140" src="/producuImage/ne_jxjy.jpg" />
        </div>
        <div class="span8">
            <p>
                <em>Git</em>是一个分布式的版本控制系统，
            </p>
            <p>
                最初由<strong>Linus Torvalds</strong>编写，用作
            </p>
        </div>
    </div>
</div>
--%>


<%--
            <c:forEach items="${pListc}" var="p" begin="0" end="4">
            <div class="grid_1_of_5 images_1_of_5">
                <a href="preview.html?id=${p.id}"><img src="${p.imgurl}" alt="" /></a>
                <h2><a href="preview.html?id=${p.id}">${p.name}</a></h2>
                <div class="price-details">
                    <div class="price-number">
                        <p>价格:<span class="rupees">${p.specialOffer}&nbsp;&nbsp;</span></p>
                    </div>
                    <div class="add-cart">
                        <p><h4><a href="/product/selectProductOrCategory.do?id=${p.id}">查看详情</a></h4></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            </c:forEach>--%>

</body>
</html>