<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>${poc.name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
	<script type="text/javascript" src="/js/jquery-form.js"></script>
	<script type="text/javascript" src="/js/jquery-1.9.0.min.js"></script>

</head>
<body>
	<div class="header">
		<%@include file="head.jsp"%>
  	  		<div class="wrap"></div>
   </div>
   <div class="main">
	   <input type="hidden" value="${poc.id}" id="pid">
   	 <div class="wrap">
   	 	<div class="content_top">
    		<div class="back-links" style="width: 100px;">
    		<p><a href="/cart/findByCart.do">主页</a> &gt;&gt;&gt; <a href="/product/selectProductOrCategory.do?id=${poc.id}" class="active">介绍</a></p>
    	    </div>
    		<div class="clear"></div>
    	</div>

		 <div class="section group">
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">

					<div class="grid images_3_of_2">
						<img src="${poc.imgurl}" alt="" />
				  </div>

                      <div class="desc span_3_of_2">
                       ${poc.name}
                      </div>

				<div class="desc span_3_of_2">
					<div class="price">
						<p>价格:<span>${poc.specialOffer}</span></p>
					</div>
					<div class="available">
						<ul>
<%--						  <li><span>Model:</span> &nbsp; Model 1</li>--%>
						    <li><span>作者:</span>&nbsp; ${poc.author}</li>
						    <li><span>出版社:</span>&nbsp; ${poc.platform}</li>
							<li><span>书籍类别:</span>&nbsp; ${poc.category.name}</li>
					    </ul>
					</div>
				<div class="share-desc">
<%--					<div class="share">
						<p>Number of units :</p><input class="text_box" type="text">				
					</div>--%>
					<div class="button"><span><a href="#" type="button" onclick="addProductToCart()">加入购物车</a></span></div>
					<div class="clear"></div>
				</div>
				 <div class="wish-list">
				 </div>
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			 <h2>介绍</h2>
			${poc.description}
	   </div>
   </div>
				<div class="rightsidebar span_3_of_1 sidebar">
					<h2>促销商品</h2>

					<div class="special_movies">
						<c:forEach items="${pListh}" var="p" begin="0" end="4">
							<div class="movie_poster">
								<a href="/product/selectProductOrCategory.do?id=${p.id}"><img style="width: 100px;height: 100px" src="${p.imgurl}" alt="" /></a>
							</div>
							<div class="movie_desc">
								<a href="/product/selectProductOrCategory.do?id=${p.id}" style="color: orange">${p.name}</a>
								<p>¥<span>${p.price}</span> &nbsp; ${p.specialOffer}</p>
								<div class="add-cart">
									<p><h4><a href="/product/selectProductOrCategory.do?id=${p.id}">查看详情</a></h4></p>
								</div>
							</div>
						</c:forEach>
								<div class="clear"></div>
					 		</div>
 					   </div>
 		 		 </div>
		 <form   action="/mood/addMood.do" method="post">
		 <div style="position: relative;top: 100px; " >
             <div class="write" style="width: 912px;height: 350px;border: 1px solid black;border-radius: 10px;margin-left: 120px;margin-bottom: -30px">
                 <%--<h4>评论区</h4>--%>
                 <textarea  id="textArea" name="textArea" required="required" style="height: 85%;width: 100%;opacity:50%;font-size: 30px;border-radius:10px "></textarea>
                 <input id="pl_anniu" type="submit"  value="发送" style="width: 120px;height: 40px;position: relative;left: 780px"/>
             </div>
		 </div>
		 </form>
             <div id="jiangluo" style="position: relative;top: 200px;">
<c:forEach items="${comment}" var="c">

                     <div style="position: relative;top: 50px;width: 80%;margin-left:121px;height: 300px;" id="one" >
                         <div style="position: relative;left: 120px;top: -50px;" id="username">
                             <%--username--%>
                             <p style="font-size: 20px;color: #3a7b6d;position: relative;left: -100px">用户名：${c.username}</p>
                         </div>

                         <div style="padding-top: 20px;padding-left:20px;border-radius: 10px;box-shadow: 2px 2px 2px black;font-size: 20px;width: 650px;height: 250px;position: relative;left:200px;top: -120px;border: 1px solid grey;text-align: left" id="tpinglun">
                             <%--内容--%>
                             <span>${c.mesg}</span>
                         </div>
                     </div>
</c:forEach>

             </div>
		 </div>
   	 		</div>
        </div>
   <div class="footer">
   	  <div class="wrap">	

        </div>
    </div>
<%--   <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>--%>

	<script>

		function addProductToCart() {
			var pid = $("#pid").val();
			$.ajax({
				url:"/cart/insertCart.do",
				type:"post",
				data:"pid="+pid,
				dataType:"json",
				headers:{"ClientCallMode":"ajax"},
				success:function (data) {
					alert(data.message);
					if (data.status == 0) {
						window.location.href = "/cart/findByCart.do";

					}
				}
			})

		}
	</script>

	<script>
        function addMood() {
            //需要jquery_form.js文件支持
            var option = {
                url:"/mood/addMood",
                type:"post",
                dataType:"json",
                headers:{"ClientCallMode":"ajax"},
                success:function (data) {
                    alert(data.message);
                    if (data.status == 0) {
                        window.location.href="/mood/findMoodByid.do";
                    }
                }
            };

            /*fileform是表单的id*/
            $("#fileform").ajaxSubmit(option);
            return false;
        }


	</script>
</body>
</html>

