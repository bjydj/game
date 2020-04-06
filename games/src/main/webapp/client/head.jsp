<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/24
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    function confirm_logout() {
        var msg = "您确定要退出登录吗？";
        if (confirm(msg)==true){
            return true;
        }else{
            return false;
        }
    }
</script>
<div class="headertop_desc">
    <div class="wrap">
        <div class="nav_list">
            <ul>
                <li><a href="/cart/findByCart.do">主页</a></li>
                <li><a href="/client/mood.jsp">留言板</a></li>
            </ul>
        </div>
        <div class="account_desc">
            <ul>
    <c:choose>
        <c:when test="${ login == null }">
                    <li><a href="/client/login.jsp">登录</a></li>
                    <li><a href="/client/register.jsp">注册</a></li>
            <p style="color: whitesmoke">请登录</p>

        </c:when>
        <c:otherwise>
    <%--
                    <li><a href="/client/preview.jsp">付款</a></li>
    --%>
                    <li><a href="/createOrder.do">结账</a></li>
                    <li><a href="/client/logout.do" onclick="javascript:return confirm_logout()">退出</a></li>
            <p style="color: whitesmoke">欢迎您:${login}</p>
        </c:otherwise>
    </c:choose>
            </ul>

        </div>
        <div class="clear"></div>
    </div>
</div>				<div class="header_top">
    <div class="logo">
        <a href="/cart/findByCart.do"><img height="100px" width="100px" src="../images/logo.jpg" alt="" /></a>
    </div>
    <div class="header_top_right" style="z-index: auto">
        <div class="cart" >
            <p><span>购物车</span><div id="dd" class="wrapper-dropdown-2">
            <ul class="dropdown">
                <c:choose>
                    <c:when test="${empty suss1}">
                        <li>购物车为空</li>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${cart}" var="c">
                            <li><a href="/product/selectProductOrCategory.do?id=${c.pid}" style="color: #0f0f0f">${c.product.name}</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;￥${c.product.specialOffer}&nbsp;&nbsp;<a href="/cart/deleteCart.do?id=${c.id}">删除</a></li>
                            <%--<li>${c.product.name}</li>--%>
                            <%--<img src=${c.product.imgurl}--%>
                            <%--<li>${c.product.name}</li>--%>
                        </c:forEach>
                        <li>总价：${sum}</li>
                    </c:otherwise>
                </c:choose>
            </ul></div></p>
        </div>
<%--        <div class="search_box">
            <form>
                <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
            </form>
        </div>--%>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        function DropDown(el) {
            this.dd = el;
            this.initEvents();
        }
        DropDown.prototype = {
            initEvents : function() {
                var obj = this;

                obj.dd.on('click', function(event){
                    $(this).toggleClass('active');
                    event.stopPropagation();
                });
            }
        }

        $(function() {

            var dd = new DropDown( $('#dd') );

            $(document).click(function() {
                // all dropdowns
                $('.wrapper-dropdown-2').removeClass('active');
            });

        });
    </script>
    <div class="clear"></div>
</div>