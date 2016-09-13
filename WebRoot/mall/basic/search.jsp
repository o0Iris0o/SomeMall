<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<!--浏览器适配-->
<base href="<%=basePath%>">
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="msapplication-tap-highlight" content="no">

<title>SomeMall-Search</title>

    <!--Icon-->
    <link rel="apple-touch-icon-precomposed" href="images/navlogo.png">
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="images/navlogo.png">
    <link rel="icon" href="images/navlogo.png" sizes="32x32">


<!--字体-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Inconsolata"
	rel="stylesheet" type="text/css">

<!-- CSS  -->
<link href="css/materialize.min.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="style/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<!--自定waves颜色-->
<style>
.waves-effect.waves-blue .waves-ripple {
	/* The alpha value allows the text and background color
            of the button to still show through. */
	background-color: rgb(95, 162, 244);
}
</style>
</head>
<body class="col l12 m12 s12">
<header id="top">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a href="home/toMallHome.do" class="brand-logo left" style="width: 52%">
                	<img onmouseover="this.style.cursor='pointer'" style="width: 100%;height: 80px" class="responsive-img" src="images/materialize.gif">
                </a>
                <ul class="right">
					<c:choose>
						<c:when test="${(empty sessionScope.user)||(sessionScope.user eq null)}">  
							<li><a href="home/toLogin.do" class="waves-effect waves-red"><i class="material-icons left">input</i> 登    陆 </a></li>
							<li class="hide-on-med-and-down"><a href="home/toRegist.do" class="waves-effect waves-red"><i class="material-icons left">perm_identity</i><font color=#8b0000> 注    册</font></a></li>
						</c:when>
						<c:otherwise>
		    				<li>
		                        <div id="sidediv" onmouseover="this.style.cursor='pointer'" data-activates="slide-out" class="chip">
		                            <img src="images/mianmm.png" alt="Contact Person">
		                            ${sessionScope.user.username}
		                        </div>
	                		</li>
	                  		<li class="hide-on-med-and-down"><a href="home/toLogout.do" class="waves-effect waves-red"><i class="material-icons left">input</i> 注    销 </a></li>
						</c:otherwise>
					</c:choose>
            	</ul>
        	</div>
    	</nav>
	</div>
</header>


	<main>
	
	<div class="section linen s12 m12 l12" >

		
	</div>
	<div class="section" style="background-image:url(images/rr06.jpg);background-size:cover;">
	<div class="row container">
			<div class="row">
				 <form>
				<div class="col m8 s10 offset-s1">
					<div class="input-field" >
	                    <i class="material-icons prefix">search_circle</i>
	                    <input id="searchContext" type="text" class="validate">
	                    <label for="searchContext">&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</label>
	                </div>
				</div>
				
				<div class="col m4 s12 center" style="margin-top: 25px">
					<a href="javascript:search()" style="border:1px solid black" class="waves-effect waves-black btn-flat"><i class="material-icons left"><i class="material-icons">search</i></i>click to search</a>
				</div>
			</form>
			</div>
				<form id="useridinfo" style="display: none;visibility: hidden;">
					<input id="userid" name="userid" value="${user.userid}"> <input
						name="currentPage" id="currentPage" />
				</form>
				<span id="userinfo" style="display: none;visibility: hidden;">欢迎用户：${user.username}</span>
				<span id="totalCount" style="display: none;visibility: hidden;">${page.totalCount}</span>
			
		</div>
	
		<div class="row" >
			<div class="col m9 offset-m1">
				<div class="row" id="showlist">
					<c:forEach items="${page.data}" var="collect">
						<div class="col s12 m6 l4">
							<div class="card small hoverable sticky-action"
								style="overflow: hidden;">
								<div class="card-image waves-effect waves-block waves-light">
									<img class="activator" src="${collect.image}"
										alt="${collect.itemname}">

								</div>
								<div class="card-content">
									<span class="card-title activator grey-text text-darken-4"><i
										class="material-icons right">more_vert</i></span>

									<p>
										<a href="item/toItem.do?itemid=${collect.itemid}">${collect.displayname}</a>
									</p>
								</div>

<%-- 								<div class="card-action">
									<a href="javascript:addItemToCart(${collect.itemid})"> <i
										class="material-icons">add</i>购物车
									</a> <a href="javascript:addToCollect(${collect.itemid})"> <i
										class="material-icons">star</i>收藏
									</a>
								</div> --%>
					            <div class="card-action">
					     		<a href="javascript:addItemToCart(${collect.itemid})" class="waves-effect">
					     		<i class="material-icons left">add_shopping_cart</i> 购物车</a>    
					   			<a href="javascript:addToCollect(${collect.itemid})" class="waves-effect">
					   			<i class="material-icons left">star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
								</div>								

								<div class="card-reveal"
									style="display: none; transform: translateY(0px);">
									<span class="card-title grey-text text-darken-4">${collect.displayname}<i class="material-icons right">close</i>
									</span>
									<p>${collect.itemname}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
<div class="row" align="center" style="padding: 0;margin: 0;">
	
		<ul class="pagination s12 " id="pages">
			<li class="waves-effect "><a href="javascript:toPage(1);"><i
					class="material-icons" style="width: 13%">chevron_left</i><i
					class="material-icons">chevron_left</i></a></li>
			<c:if test="${page.currentPage==1}">
				<li class="disabled"><a><i class="material-icons">chevron_left</i></a></li>
			</c:if>
			<c:if test="${page.currentPage!=1}">
				<li class="waves-effect"><a
					href="javascript:toPage(${page.currentPage-1});"><i
						class="material-icons">chevron_left</i></a></li>
			</c:if>
			
			<c:forEach begin="1" end="${page.totalPage}" var="p">
				<c:choose>
					
					
 					<c:when test="${page.totalPage<=7}">   
 					  <c:if test="${p==page.currentPage}">
						<li class="active"><a href="javascript:toPage(${p});">${p}</a></li>
					  </c:if>
					  <c:if test="${p!=page.currentPage}">
						<li class="waves-effect"><a href="javascript:toPage(${p});">${p}</a></li>
					  </c:if>
 					</c:when> 
 					
 					<c:when test="${page.totalPage>7}">   
				<c:choose>
 					<c:when test="${page.currentPage<=5}"> 
						<c:if test="${p<=page.currentPage+2}">
								<c:if test="${p==page.currentPage}">
									<li class="active"><a href="javascript:toPage(${p});">${p}</a></li>
							 	</c:if>
							  	<c:if test="${p!=page.currentPage}">
									<li class="waves-effect"><a href="javascript:toPage(${p});">${p}</a></li>
								</c:if>
						</c:if>
						<c:if test="${p==page.currentPage+2}">
							...
						</c:if>
 					</c:when>	
					<c:when test="${page.currentPage>=page.totalPage-2}">  
						<c:if test="${p==page.totalPage-2}">
							...
						</c:if>	
						<c:if test="${p>=page.totalPage-2}">
								<c:if test="${p==page.currentPage}">
									<li class="active"><a href="javascript:toPage(${p});">${p}</a></li>
							 	</c:if>
							  	<c:if test="${p!=page.currentPage}">
									<li class="waves-effect"><a href="javascript:toPage(${p});">${p}</a></li>
								</c:if>
						</c:if>
 					</c:when>
					<c:otherwise>
						<c:if test="${p==page.totalPage-2}">
							...
						</c:if>
						<c:if test="${p>=page.currentPage-2||p<=page.currentPage+2}">
								<c:if test="${p==page.currentPage}">
									<li class="active"><a href="javascript:toPage(${p});">${p}</a></li>
							 	</c:if>
							  	<c:if test="${p!=page.currentPage}">
									<li class="waves-effect"><a href="javascript:toPage(${p});">${p}</a></li>
								</c:if>
						</c:if>
						<c:if test="${p==page.totalPage+2}">
							...
						</c:if>
					</c:otherwise>
 		
 						</c:choose>
 						
 					</c:when>
 					
		</c:choose>
				
			</c:forEach>
			
			<c:if test="${page.currentPage==page.totalPage}">
				<li class="disabled"><a><i class="material-icons">chevron_right</i></a></li>
			</c:if>
			<c:if test="${page.currentPage!=page.totalPage}">
				<li class="waves-effect"><a
					href="javascript:toPage(${page.currentPage+1});"><i
						class="material-icons">chevron_right</i></a></li>
			</c:if>
			<li class="waves-effect"><a
				href="javascript:toPage(${page.totalPage});"><i
					class="material-icons" style="width: 13%">chevron_right</i><i
					class="material-icons">chevron_right</i></a></li>

		</ul>
	</div>
			</div>
			
		</div>


	</div>


	</main>
 <div class="col l12 m11">
	        <ul class="tabs tab-demo card ">
	            <li class="tab " style="background-color:#fcfcfc">Thank you for your patronage</li>
	        </ul>
 </div>
	
<jsp:include page="../basic/button.jsp"></jsp:include>
<jsp:include page="../basic/modal.jsp"></jsp:include>
<jsp:include page="../basic/footer.jsp"></jsp:include>

	<!--  Scripts-->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="js/jquery-2.2.0.min.js"></script>
	<script type="text/javascript">
		if (!window.jQuery) {
			document.write('<script src="js/jquery-2.2.0.min.js">'
					+ '<'+'/script>');
		}
	</script>


	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
	<script src="js/somemallbase.js"></script>
	<script type="text/javascript">
		$(function() {
			if ($("#userid").val() == "") {
				$("#userinfo").text("请登录");
			}
			if($("#totalCount").text() == "0"){
				//此处因为同步异步请求，刷新会有bug，刷新会重新加载之前点进来的同步请求，因此显示内容与搜索不符
				//修复方法：search页点击搜索也同样使用同步请求，翻页使用异步请求
    			$("#showlist").html("");
   			 	$("#showlist").append("<h1 class='center'>没有您搜索的商品T_T</h1>");
			}
			$("#searchContext").val(
					sessionStorage.getItem("searchContext").toString());
			$("#currentPage").val(
					sessionStorage.getItem("currentPage").toString());

		})
	</script>
	<script type="text/javascript">
		//分页查询
		function toPage(currentPage) {
			sessionStorage.setItem("currentPage", currentPage);

			$("#currentPage").val(currentPage);
			document.getElementById("currentPage").value = currentPage;
			/* alert($("#currentPage").val()); */
			/* document.getElementById("searchForm").submit(); */
			searchItem();
			/* window.location.replace("mall/main/search.jsp"); */
		}
		function searchItem() {

			var param = "searchContext=" + $("#searchContext").val()
					+ "&currentPage=" + $("#currentPage").val();
			/* alert(param); */
			/* $.post("item/toSearch.do", param, function(data, status) {
				
			}, "json"); */
			$.ajax({
			    url : "item/search.do",  
			    type : "POST",  
			    data : param,
			    dataType: 'json',
			    success : function(page,status) {  
			    	var list =page.data;
			    	/* alert(list.length); */
			    	$("#showlist").html("");
			    	$.each(list, function(i,item){    
			    		if(item.itemname==null||item.itemname==""){
			    			 $("#showlist").append("<h1 class='center'>没有您搜索的商品T_T</h1>");
			    		}else{
				    	    $("#showlist").append("<div class='col s12 m6 l4'><div class='card small hoverable sticky-action'style='overflow: hidden;'><div class='card-image waves-effect waves-block waves-light'><img class='activator' src='"+item.image+"'alt='"+item.itemname+"'></div><div class='card-content'><span class='card-title activator grey-text text-darken-4'><i class='material-icons right'>more_vert</i></span><p><a href='item/toItem.do?itemid="+item.itemid+"'>"+item.displayname+"</a></p></div><div class='card-action'><a href='javascript:addItemToCart("+item.itemid+")' class='waves-effect'> <i class='material-icons left'>add_shopping_cart</i>购物车</a> <a href='javascript:addToCollect("+item.itemid+")' class='waves-effect'> <i class='material-icons left'>star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>	<div class='card-reveal'style='display: none; transform: translateY(0px);'><span class='card-title grey-text text-darken-4'>"+item.displayname+"<i class='material-icons right'>close</i></span><p>"+item.itemname+"</p></div></div></div>");
			    		}
			    	});
			    	
			    	$("#pages").html("");
			    	$("#pages").append("<li class='waves-effect'><a href='javascript:toPage(1);'><i class='material-icons' style='width: 13%'>chevron_left</i><i class='material-icons'>chevron_left</i></a></li>"); 
			    	
			    	if(page.currentPage==1){
			    		$("#pages").append("<li class='disabled'><a><i class='material-icons'>chevron_left</i></a></li>");
		    		}else{
		    			$("#pages").append("<li class='waves-effect'><a href='javascript:toPage("+(page.currentPage-1)+");'><i class='material-icons'>chevron_left</i></a></li>");
		    		};
		    		for(p=1;p<=page.totalPage;p++){
		    			if(page.totalPage<=7){
		    				if(p==page.currentPage){
			    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
			    			}else{
			    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
			    			}
		    			}else if(page.totalPage>7){
		    				
		    				if(page.currentPage<=5){

		    					if(p<=page.currentPage+2){
		    						if(p==page.currentPage){
					    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
					    			}else{
					    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
					    			}
		    					}
		    					if(p==page.currentPage+2){
		    						$("#pages").append("...");
		    					}
		    				}else if(page.currentPage>=page.totalPage-2){
		    					if(p<=2){
		    						if(p==page.currentPage){
					    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
					    			}else{
					    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
					    			}
			    				}
		    					if(p==page.currentPage-2){
		    						$("#pages").append("...");
		    					}
		    					if(p>=page.currentPage-2){
		    						if(p==page.currentPage){
					    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
					    			}else{
					    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
					    			}
		    					}

		    				}else{
		    					if(p<=2){
		    						if(p==page.currentPage){
					    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
					    			}else{
					    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
					    			}
			    				}
		    					if(p==page.currentPage-2){
		    						$("#pages").append("...");
		    					}
		    					if(p>=page.currentPage-2 && p<=page.currentPage+2){
		    						if(p==page.currentPage){
					    				$("#pages").append("<li class='active'><a href='javascript:toPage("+p+");'>"+p+"</a></li>");
					    			}else{
					    				$("#pages").append("<li><a href='javascript:toPage("+p+");'>"+p+"</a></li> ");
					    			}
		    					}		    					
		    					if(p==page.currentPage+2){
		    						$("#pages").append("...");
		    					}
		    				}
		    			}
		    			
		    			
		    		}
			    	
			    	if(page.currentPage==page.totalPage){
			    		$("#pages").append("<li class='disabled'><a><i class='material-icons'>chevron_right</i></a></li>");
		    		}else{
		    			$("#pages").append("<li class='waves-effect'><a href='javascript:toPage("+(page.currentPage+1)+");'><i class='material-icons'>chevron_right</i></a></li>");
		    		};
		    		
			    	$("#pages").append("<li class='waves-effect'><a	href='javascript:toPage("+page.totalPage+");'><i class='material-icons' style='width: 13%'>chevron_right</i><i class='material-icons'>chevron_right</i></a></li>");
			    
			    
			    } 
			});
			/* window.location.replace("mall/main/search.jsp"); */
		}
		function search() {
			sessionStorage.setItem("searchContext", $("#searchContext").val());
			sessionStorage.setItem("currentPage", 1);
			if($("#searchContext").val()==""||$("#searchContext").val()==" "||$("#searchContext").val()=="  "){
					Materialize.toast('请输入搜索内容',500,'rounded') // int是Toast持续时间
			}else{
				$("#currentPage").val("1");
				searchItem();
			}
		}
	</script>
	<script language="javascript" type="text/javascript">
		function addItemToCart(itemid) {
			var userid = ${user.userid};
			Materialize.toast('添加购物车成功',500,'rounded') // int是Toast持续时间
			var param = "userid="+userid+"&itemid="+itemid;
			$.post("user/addItemToCart.do",param);

		}
		function addToCollect(itemid) {
			var userid = ${user.userid};
			var param = "itemid=" + itemid + "&userid=" + userid;
			$.post("user/addToCollect.do", param, function(data) {
				var result = data;
				if (result == "0") {
					Materialize.toast('商品已收藏',500,'rounded') // int是Toast持续时间
				} else if (result == "1") {
					Materialize.toast('收藏成功',500,'rounded') // int是Toast持续时间
				}
			}, "text");
		}
	</script>


    <script type="text/javascript">
        $(function() {
            $("#sidediv").click(function(){
                $('.button-collapse').sideNav('show');
            })
        })
    </script>


  <script type="text/javascript">
        $(function() {
            var bannerSlider = new Slider($('#banner_tabs'), {
                time: 5000,
                delay: 400,
                event: 'hover',
                auto: true,
                mode: 'fade',
                controller: $('#bannerCtrl'),
                activeControllerCls: 'active'
            });
            $('#banner_tabs.flex-prev').click(function() {
                bannerSlider.prev()
            });
            $('#banner_tabs.flex-next').click(function() {
                bannerSlider.next()
            });
        })
    </script>
    <script src="js/slider.js"></script>


  <script type="text/javascript">
        $(function() {
            var bannerSlider = new Slider($('#banner_tabs'), {
                time: 5000,
                delay: 400,
                event: 'hover',
                auto: true,
                mode: 'fade',
                controller: $('#bannerCtrl'),
                activeControllerCls: 'active'
            });
            $('#banner_tabs.flex-prev').click(function() {
                bannerSlider.prev()
            });
            $('#banner_tabs.flex-next').click(function() {
                bannerSlider.next()
            });
        })
    </script>
    <script src="js/slider.js"></script>


<script type="text/javascript">
  	
  </script>
  
</body>
</html>
