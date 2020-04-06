<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<head>
<title>书城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<body>
	<div class="header">
		<%@include file="head.jsp"%>
				<div class="header_bottom">
					<%@include file="categories.jsp"%>
						    <div class="header_bottom_right">					 
						 	    <!------ Slider ----3-------->
								  <div class="slider" >
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider" style="z-index: 0">
											<img width="500px" height="600px" src="/producuImage/timg%20(1).jpg" alt="">

										</div>
							        </div>
						   		</div>
						<!------End Slider ------------>
			         </div>
			     <div class="clear"></div>
			</div>
   		</div>
   </div>
<!--   <div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>-->
   <!------------End Header ------------>


<%--公告--%>
<div id="divcontent" style="text-align: center">
	<table style="text-align: center" border="0" cellspacing="0">
		<tr>
			<td>
				<img src="/images/billboard.png" width="100%" height="38" />
				<table cellspacing="0" >
					<c:forEach items="${notice}" var="n" begin="0" end="4">
						<tr>
							<td width="485" height="100%">${n.title}</td>
						</tr>
					</c:forEach>
				</table>
			</td>
	</table>
</div>

  <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>新品上市</h3>
    		</div>
    	</div>
	      <div class="section group">

			  <c:forEach items="${pList}" var="p">
			  <div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html?id=${p.id}"><img src="${p.imgurl}" alt="" /></a>
                  <h4>${p.name}</h4>
					<div class="price-details">
				       <div class="price-number">
							<p>价格:<span class="rupees">${p.specialOffer}&nbsp;&nbsp;</span></p>
					    </div>
					       		<div class="add-cart">
									<h4><a href="/product/selectProductOrCategory.do?id=${p.id}">查看详情</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
			  </c:forEach>


			</div>


			<div class="content_bottom">
    		<div class="heading">
    		<h3>热门产品</h3>
    		</div>
    	  </div>
			<div class="section group">

				<c:forEach items="${pListh}" var="p" begin="0" end="4">
					<div class="grid_1_of_5 images_1_of_5">
						<a href="/product/selectProductOrCategory.do?id=${p.id}"><img src="${p.imgurl}" alt="" /></a>
						<h4>${p.name}</h4>
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
				</c:forEach>

			</div>
       </div>
  </div>
</div>
   <div class="footer">
   	  <div class="wrap">	
<%--	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="#">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="contact.html">Sign In</a></li>
							<li><a href="index.html">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="contact.html">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<li><span>+91-123-456789</span></li>
							<li><span>+00-123-000000</span></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="../images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="../images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="../images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="../images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>--%>
			 <div class="copy_right">
				<!--<p>Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>-->
		   </div>			
        </div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</html>

