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
        .waves-effect.waves-blue .waves-ripple {
            /* The alpha value allows the text and background color
            of the button to still show through. */
            background-color: #000000;
        }
    </style>
  </head>
<body>

<header id="top">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a href="home/toMallHome.do" class="brand-logo left" style="width: 32%">
                	<img onmouseover="this.style.cursor='pointer'" style="width: 100%;height: 60px" class="responsive-img" src="images/materialize.gif">
                </a>
                <span class="center hide-on-med-and-down">管理您的订单</font></span>
                <ul class="right">
					<c:choose>
						<c:when test="${(empty sessionScope.user)||(sessionScope.user eq null)}">  
							<li><a href="home/toLogin.do" class="waves-effect waves-red"><i class="material-icons left">input</i> 登    陆 </a></li>
							<li class="hide-on-med-and-down"><a href="home/toRegist.do" class="waves-effect waves-red"><i class="material-icons left">perm_identity</i><font color=#8b0000> 注    册</font></a></li>
						</c:when>
						<c:otherwise>
							<li class="center hide-on-med-and-down"><p style="color: black;font-size:18px;">管 理 您 的 订 单</p></li> 
							
							<li class="center hide-on-med-and-down">
								<p style="color: black;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
							</li>
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
               <h1 class="header center red-text  text-darken-2">Purchase Successfully</h1>
               <div class="row center">
                   <h5 class="header col s12 light">您的订单已发出，请耐心等待</h5>
               </div>
               <div class="row center">
                   <a href="" class="waves-effect waves-blue btn-flat" style="border: 1px solid white;"><font color="white" style="font-weight:900;"><i class="material-icons left">trending_down</i>返回 主页 </font></a>
                   <a href="user/toorder.do" class="waves-effect waves-blue btn-flat" style="border: 1px solid white;"><font color="white" style="font-weight:900;"><i class="material-icons left">trending_down</i>查看 订单 </font></a>
                   <a href="user/tocart.do" class="waves-effect waves-blue btn-flat" style="border: 1px solid white;"><font color="white" style="font-weight:900;"><i class="material-icons left">trending_down</i> 回购物车</font></a>
               </div>
               <br><br>
           </div>
       </div>
       <div class="parallax"><img src="images/redirect.png" alt="Unsplashed background img 1"></div>
   </div>





</main>

<footer class="page-footer grey darken-4">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">SomeMall Online Shopping</h5>
                <img src="images/navlogo2.png">


            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Designer</h5>
                <ul>
                    <li><a onmouseover="this.style.cursor='crosshair'" class="white-text tooltipped" data-position="top" data-delay="50" data-tooltip="Mail:dust_liu@163.com Tel:18524408044 qq:956696592">Dust Leo </a></li>
                    <li><a class="white-text"><br/></a></li>
                    <li><a onmouseover="this.style.cursor='crosshair'" class="white-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="Mail:yilany-95@163.com Tel:18540506819 qq:416643211">Yilany Iris </a></li>
                    <li><a class="white-text"></a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Core Tec</h5>
                <ul>
                    <li><a class="white-text" href="#!">SSM FrameWork</a></li>
                    <li><a class="white-text" href="#!">AJAX...</a></li>
                    
                    <li class="white-text" >If you like our works , please contact us .</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright black">
        <div class="container">
            Made by <a class="brown-text text-lighten-3 " onmouseover="this.style.cursor='pointer'">Materialize</a>
        </div>
    </div>
</footer>


<jsp:include page="../basic/modal.jsp"></jsp:include>
<%-- <jsp:include page="../basic/button.jsp"></jsp:include> --%>

<!------------------------------------------------  Scripts---------------------------------------------->
   <!--  Scripts-->
  <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>

    <script>if (!window.jQuery) {
        document.write('<script src="https:/code.jquery.com/jquery-2.1.4.min.js"><\/script>');
    }
    </script>

    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
    
    <script src="js/somemallbase.js"></script>
    <script src="js/sidediv.js"></script>
    <script type="text/javascript">
    $(function() {
        $("#sidediv").click(function(){
        	//alert();
        	//$("html,body").animate({scrollTop: '1600px'}, 800);
        	$('.button-collapse').sideNav('show');  
        });
    });
    </script>
    

  </body>
</html>