<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">

    <title>SomeMall 网上商城</title>

    <!--Icon-->
    <link rel="apple-touch-icon-precomposed" href="images/navlogo.png">
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="images/navlogo.png">
    <link rel="icon" href="images/navlogo.png" sizes="32x32">

    <!--字体-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" type="text/css">

    <!-- CSS  -->
    <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="style/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <!--自定waves颜色-->
    <style>
        .waves-effect.waves-black .waves-ripple {
            /* The alpha value allows the text and background color
            of the button to still show through. */
            background-color: #757575;
        }
        
    </style>
  </head>
<body>

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
	<div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br><br>
                <h1 class="header center red-text  text-darken-2">Recommend For You</h1>
                <div class="row center">
                    <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
                </div>
                <c:choose>
					<c:when test="${(empty sessionScope.user)||(sessionScope.user eq null)}">  
						<div class="row center">
                    		<a href="home/toLogin.do" class="btn-large waves-effect waves-red red lighten-2"><i class="material-icons left">trending_down</i> 个性推荐？请登录 </a>
                		</div>
					</c:when>
					<c:otherwise>
						<div class="row center">
                    		<a id="checkrec" onmouseover="this.style.cursor='pointer'" class="btn-large waves-effect waves-red red lighten-2"><i class="material-icons left">trending_down</i> 查看	推荐 </a>
                		</div>
					</c:otherwise>
				</c:choose>
                <br><br>
            </div>
        </div>
        <div class="parallax"><img src="images/paraE.png" alt="Unsplashed background img 1"></div>
    </div>
    
    
    
    
<!--     <div class="section lighten-5"  style="background-color: rgba(255, 216, 190, 0.31)"> -->
    <div class="section lighten-5"  style="background:url(images/rr06.jpg)">
        <div class="row">
			<form id="searchForm" action="item/toSearch.do">
				<div class="col m6 offset-m2 s11">
					<div class="input-field" >
	                    <i class="material-icons prefix">search_circle</i>
	                    <input id="searchContext" name="searchContext" type="text" class="validate">
	                    <label for="searchContext">&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</label>
	                </div>
				</div>
				
				<div class="col m3 s10 center" style="margin-top: 25px">
					<a id="search" type="submit" style="border:1px solid black" class="waves-effect waves-black btn-flat"><i class="material-icons left"><i class="material-icons">search</i></i>click to search</a>
				</div>
			</form>
        </div>
        
        
        <div class="row">
        	<ul class="col l2 hide-on-med-and-down collection card white hoverable" style="left: 25px;margin-top: 11px;">
					<iframe allowtransparency="true" style="padding-top: 10px;" frameborder="0" width="175" height="345" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=1&v=1&d=4&bd=0&k=000000&f=800000&q=0&e=1&a=1&c=54511&w=210&h=420&align=right"></iframe>
	        </ul>
        	<div class="col l10 m12 s12">
        		<div id="banner_tabs" class="flexslider">
		        	<ul class="slides">
			            <li>
			                <a title="" target="_blank" href="#">
			                    <img alt="" style="background: url(images/slider1.png) no-repeat center;" src="images/alpha.png">
			                </a>
			            </li>
			            <li>
			                <a title="" href="#">
			                    <img alt="" style="background: url(images/slider2.png) no-repeat center;" src="images/alpha.png">
			                </a>
			            </li>
			            <li>
			                <a title="" href="#">
			                    <img alt="" style="background: url(images/slider3.png) no-repeat center;" src="images/alpha.png">
			                </a>
			            </li>
			            <li>
			                <a title="" href="#">
			                    <img alt="" style="background: url(images/slider4.png) no-repeat center;" src="images/alpha.png">
			                </a>
			            </li>
		        	</ul>
			        <ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
			            <li><a>1</a></li>
			            <li><a>2</a></li>
			            <li><a>3</a></li>
			            <li><a>4</a></li>
			        </ol>
	    		</div>
        	</div>
        </div>
    </div>

    <div class="section" style="padding: 0">
        <div class="row card" style="margin: 0;padding: 0">
            <div class="col l9 m12 s12" style="margin: 0;padding: 0;">
                <ul class="tabs  ">
                    <li  id="mostsold" class="tab col s2 m3 s3 active"><a onmouseover="this.style.cursor='pointer'">最高销量</a></li>
                    <li class="tab col l2 m3 s3"><a id="hotcollect" onmouseover="this.style.cursor='pointer'">最高人气</a></li>
                    <%--<li class="tab col l2 m3 s3"><a id="hotcomment" onmouseover="this.style.cursor='pointer'">最佳好评</a></li> --%>
                    <li class="tab col l2 m3 s3"><a id="newitem" onmouseover="this.style.cursor='pointer'">最新上市</a></li>
                </ul>
            </div>
            <div class="col l3 hide-on-med-and-down" style="margin: 0;padding: 0;">
                <ul class="tabs  ">
                    <li class="tab col s2 disabled"><a href="#test2">LOGOS</a></li>

                </ul>
            </div>
        </div>

    </div>

    <div class="section" style="padding: 0">
        <div class="row grey lighten-4" style="margin: 0">
            <div id="hotlist" class="col l9 m12 s12 grey lighten-4" >
                <div id="brdiv" style="position: relative;"><br><br></div>
                <div id="hottab" style="position: relative;">
    			<c:forEach var="item" items="${hotestlist}">
    				<div class="col s12 m4 l4">
	                    <div class="card small sticky-action z-depth-0 hoverable" style="overflow: hidden;">
	                   
	                        <div class="card-image waves-effect waves-block waves-light">
	                            <img class="activator" src="${item.image}">
	                        </div>
	                        
	                        <div class="card-content">
                            	<span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i></span>
                            	<p><a href="item/toItem.do?itemid=${item.itemid}">${item.itemname}</a></p>
                        	</div>
	
	                        <div class="card-action">
	                            <a href="javascript:addItemToCart(${user.userid},${item.itemid})" class="waves-effect"><i class="material-icons left">add_shopping_cart</i> 购物车</a>    
	                            <a href="javascript:addToCollect(${item.itemid})" class="waves-effect"><i class="material-icons left">star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	                        </div>
	
	                        <div class="card-reveal" style="display: none; transform: translateY(0px);">
	                            <span class="card-title grey-text text-darken-4">${item.displayname}<i class="material-icons right">close</i></span>
	                            <p>${item.itemname}</p>
	                        </div>
	                    </div>
                	</div>	
				</c:forEach>
				
				</div>
    	 		<br>
            </div>
            <div  class="col grey lighten-4 l3 m12 s12" style="margin-left:auto;left:auto;right:auto">
                <ul class="collapsible popout" data-collapsible="accordion">
                	<li>
                        <div class="collapsible-header"><i class="material-icons">filter_drama</i>XX品牌</div>
                        <div class="collapsible-body white">
                        	<a href="" class="hoverable"><img src="images/ilogo/mz.jpg" style="width: 49%"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/apple.jpg" style="width: 49%"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/ss.jpg" style="width: 49%"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/hw.jpg" style="width: 49%"></a>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">phonelink_ring</i>智能品牌</div>
                        <div class="collapsible-body white">
                            <a href="" class="hoverable"><img src="images/ilogo/mz.jpg" style="width:49%;"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/apple.jpg" style="width: 49%"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/ss.jpg" style="width: 49%"></a>
                            <a href="" class="hoverable"><img src="images/ilogo/hw.jpg" style="width: 49%"></a>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header active"><i class="material-icons">swap_calls</i>运动品牌</div>
                        <div class="collapsible-body white">
                        	<a href="" class="hoverable"><img id="imgp1" src="images/ilogo/nike.jpg" style="width:49%;"></a>
                        	<a href="" class="hoverable"><img id="imgp2" src="images/ilogo/adidas.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp3" src="images/ilogo/nb.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp4" src="images/ilogo/tep.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp5" src="images/ilogo/361.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp6" src="images/ilogo/aape.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp7" src="images/ilogo/lining.jpg" style="width: 49%"></a>
                        	<a href="" class="hoverable"><img id="imgp8" src="images/ilogo/qd.jpg" style="width: 49%"></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>



	<c:choose>
		<c:when test="${(empty sessionScope.user)||(sessionScope.user eq null)}">  
			
		</c:when>
		<c:otherwise>
			
			<div class="parallax-container">
			     <div class="section no-pad-bot">
			         <div class="container">
			             <br><br>
			             <h1 class="header center white-text  text-darken-2">猜 您 喜 欢</h1>
			             <div class="row center">
			                 <h5 class="header col s12 light">Recommand according to your purchase history</h5>
			             </div>
			         </div>
			     </div>
			     <div id="#recstart" class="parallax"><img src="images/parallax2.jpg" alt="Unsplashed background img 1"></div>
			 </div>	 
			 
			 
			<div class="section grey lighten-4">
			<div class="row">
				<c:forEach var="recitem" items="${recs}">
					<div class="col s12 m4">
	
						<div class="card small sticky-action z-depth-0 hoverable" style="overflow: hidden;">
	
					    <div class="card-image waves-effect waves-block waves-light">
					        <img class="activator" src="${recitem.image}">
					    </div>
					    
					    <div class="card-content">
					       	<span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i></span>
					       	<p><a href="item/toItem.do?itemid=${recitem.itemid}">${recitem.itemname}</a></p>
					   	</div>
					
					    <div class="card-action">
					        <a href="javascript:addItemToCart(${user.userid},${recitem.itemid})" class="waves-effect"><i class="material-icons left">add_shopping_cart</i> 购物车</a>    
					        <a href="javascript:addToCollect(${recitem.itemid})" class="waves-effect"><i class="material-icons left">star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					    </div>
					
					    <div class="card-reveal" style="display: none; transform: translateY(0px);">
					        <span class="card-title grey-text text-darken-4">${recitem.displayname}<i class="material-icons right">close</i></span>
					        <p>${recitem.itemname}</p>
					        </div>
					    </div>
					</div>	
				</c:forEach>
			</div>
			</div>
		</c:otherwise>
	</c:choose>

	
	<%--
	<c:forEach var="recitem" items="${recs}">
		<h1>${recitem.key}----${recitem.value}</h1>
	</c:forEach>
	 --%>
    

	

   <div class="col offset-l1 m11">
        <ul class="tabs tab-demo ">
            <li class="tab red-text text-darken-4" style="background-color:#fcfcfc"><strong><h5>Thank you for your patronage <img style="width: 24px; height: 24px" src="images/thk.png"> WE WILL DO BETTER AND BETTER</h5></strong></li>
        </ul>
    </div>
    
    <div class="parallax-container">
        <div class="parallax"><img src="images/LastPara.png"></div>
    </div>
    
</main>









<jsp:include page="../basic/modal.jsp"></jsp:include>
<jsp:include page="../basic/button.jsp"></jsp:include>
<jsp:include page="../basic/footer.jsp"></jsp:include>


<!------------------------------------------------  Scripts---------------------------------------------->
   <!--  Scripts-->
  <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>

   <script>if (!window.jQuery) {
       document.write('<script src="https:/code.jquery.com/jquery-2.1.4.min.js"><\/script>');
   }
   </script>
   <script src="js/materialize.js"></script>
   <script src="js/init.js"></script>
 	
  	
   <script src="js/home.js"></script>
   <script src="js/somemallbase.js"></script>
   <script src="js/slider.js"></script>
   <script src="js/slidercontrol.js"></script>
   <script type="text/javascript">
    $(function() {
        $("#sidediv").click(function(){
            $('.button-collapse').sideNav('show');
        })
    });
  	</script>
  	
  
	<script type="text/javascript">
	function addItemToCart(itemid) {
		var userid =${user.userid};
		/* alert("成功添加到购物车^_^～"); */
		Materialize.toast('添加成功',500,'rounded') // int是Toast持续时间
		var param = "userid="+userid+"&itemid="+itemid;
		$.post("user/addItemToCart.do",param);
	};
	function addToCollect(itemid) {
			var userid =${user.userid};
			var param = "itemid="+itemid+"&userid="+userid;
			$.post("user/addToCollect.do",param,function(data){
				var result = data;
				if(result=="0"){
					Materialize.toast('商品已收藏',500,'rounded') // int是Toast持续时间
					/* alert("您已收藏此商品^_^"); */
				}else if(result=="1"){
					/* alert("收藏成功～！"); */
					Materialize.toast('收藏成功',500,'rounded') // int是Toast持续时间
				}
			},"text");
	};
 </script>

  </body>
</html>