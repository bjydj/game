<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" type="text/css">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header_bottom_left"  style="width: 250px;" >
    <div class="categories" style="width: 250px">
        <ul>
            <h3>类别</h3>
            <li>
                <a href="${pageContext.request.contextPath}/product/findAllProduct.do?cid=&currentPage=1">全部</a>
            </li>
<%--        <li><a href="#">动作游戏(Action Game)</a></li>
            <li><a href="#">射击游戏(Shooting Game)</a></li>
            <li><a href="#">格斗游戏(Fighting Game)</a></li>
            <li><a href="#">冒险游戏(Adventure Game)</a></li>
            <li><a href="#">模拟游戏(Simulation Game)</a></li>
            <li><a href="#">角色扮演游戏(Role-playing game)</a></li>
            <li><a href="#">策略游戏(Strategy Game)</a></li>--%>
            <c:forEach items="${category}" var="c">
               <li>
                   <a href="${pageContext.request.contextPath}/product/selectfindByCid.do?cid=${c.id}&currentPage=1">${c.name}</a>
               </li>
            </c:forEach>
        </ul>
    </div>
</div>