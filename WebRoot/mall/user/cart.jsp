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
            background-color: #90caf9;
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
							<li class="center hide-on-med-and-down"><p style="color: black;font-size:18px;">查 看 您 的 购 物 车</p></li> 
							
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
                <h1 class="header center red-text  text-darken-2">查看你的购物车</h1>
                <div class="row center">
                    <h5 class="header col s12 light"></h5>
                </div>
            </div>
        </div>
    <div class="parallax"><img src="images/cart.png" alt="Unsplashed background img 1"></div>
</div>

</main>


<div id="anishow" class="container">
	<c:forEach var="cartItems" items="${requestScope.cartItems}">
		<ul class="collection">
	        <li class="collection-item avatar">
	            <img src="${cartItems.image}" alt="" class="circle">
	            
	            
	            
	            <span style="display: none">id</span>
	            
	            <span  class="title"> <a  href="item/toItem.do?itemid=${cartItems.itemid}">${cartItems.itemname}</a></span>
	            <p>单价:￥ ${cartItems.price} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            	数量:&nbsp;&nbsp;&nbsp;<span><a href="javascript:deleteOneCartItem(${cartItems.itemid})"> - &nbsp;&nbsp;</a></span><span id="itemamount${cartItems.itemid}">${cartItems.amount}</span><span><a href="javascript:addOneCartItem(${cartItems.itemid})">&nbsp;&nbsp;+</a></span>&nbsp;&nbsp;&nbsp;
	            
	            
	            <span class="input-field">
                   	 <input type="checkbox" name="cartitemcheckbox" id="checkbox${cartItems.itemid}" value="${cartItems.itemid}"/> 
                     <label for="checkbox${cartItems.itemid}"></label>
                </span>
	            </p>
	            
	            <a href="javascript:deleteCartItem(${cartItems.itemid})" class="secondary-content"> <i class="material-icons">close</i> </a>
	             
	        </li>
    	</ul>
	</c:forEach>
</div>


<div  class="fixed-action-btn hide-on-med-and-down" style="bottom:  45px;right: 90px;">
    <a  href="javascript:buyCartItems()" class="btn-floating btn-large waves-effect waves-light teal lighten-3 tooltipped" data-position="top" data-delay="50" data-tooltip="结算">
    <i class="material-icons">assignment</i></a>
    
</div>

<div  class="fixed-action-btn hide-on-med-and-down" style="bottom: 45px;right: 150px;">

    <a href="javascript:deleteCartItems()"  class="btn-floating btn-large waves-effect waves-light orange darken-1 tooltipped" data-position="top" data-delay="50" data-tooltip="删除">
    <i class="material-icons">delete</i></a>
    
</div>

<div  class="fixed-action-btn hide-on-large-only" style="bottom:  5px;right: 90px;">
    <a  href="javascript:buyCartItems()" class="btn-floating btn-large waves-effect waves-light teal lighten-3">
    <i class="material-icons">assignment</i></a>
    
</div>

<div  class="fixed-action-btn hide-on-large-only" style="bottom: 5px;right: 150px;">

    <a href="javascript:deleteCartItems()"  class="btn-floating btn-large waves-effect waves-light orange darken-1">
    <i class="material-icons">delete</i></a>
    
</div>


<%-- <div class="row container center" style="margin-top: 25px"> -->
<!-- 	<a href="javascript:deleteCartItems()" style="border:1px solid gray;" class="waves-effect waves-red btn-flat">删除</a> -->
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 	<a href="javascript:buyCartItems()" style="border:1px solid gray" class="waves-effect waves-blue btn-flat">结算</a> -->
<!-- 	<br>				 -->
<!-- </div> --%>









<jsp:include page="../basic/modal.jsp"></jsp:include>

<jsp:include page="../basic/button.jsp"></jsp:include>

<footer class="page-footer brown darken-2">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">SomeMall Online Shopping</h5>
                <img src="images/navlogo2.png">


            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Designer</h5>
                <ul>
                    <li><a onmouseover="this.style.cursor='crosshair'" class="white-text tooltipped" data-position="top" data-delay="50" data-tooltip="Mail:dust_liu@163.com Tel:18524408044 qq:956696592">Dust Liu </a></li>
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
    <div class="footer-copyright brown darken-3" style="height: 0px;">
        <!-- 
        <div class="container">
            Made by <a class="brown-text text-lighten-3" href="">Materialize</a>
        </div>
         -->
        
    </div>
</footer>

<!-- ------------------------------------------------------------------------------------------------- -->

<form id="useridinfo" style="display: none;visibility: hidden;">
		<input id="userid"  name="userid" value="${user.userid}">
		<input name="currentPage" id="currentPage" />
</form>
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
    <script type="text/javascript">
        $(function() {
            $("#sidediv").click(function(){
                $('.button-collapse').sideNav('show');
            })
        })
    </script>

    <script type="text/javascript">
      var options = [
        {selector: '#anishow', offset: 50, callback: function(el) {
          Materialize.showStaggeredList($(el));
          //$("#call-3").velocity({ backgroundColor: "#333", color: "#ef5350" }, {duration: 500});
        } }
      ];
      Materialize.scrollFire(options);
    </script>
    <script type="text/javascript">
    function deleteCartItem(itemid){
		var  r = window.confirm("确定要从购物车删除此商品？");
		var userid = $("#userid").val();
		var param = "userid="+userid+"&itemid="+itemid;
		if(r){
			$.post("user/delectCartItem.do",param);
			window.location.replace("user/tocart.do");
		}
	}
    function addOneCartItem(itemid){
    	var userid = $("#userid").val();
    	var idname= "itemamount"+itemid;
    	var amount = $("#itemamount"+itemid).html();
    	var changed = parseInt(amount)+1;
    	
    	
    	var param = "userid="+userid+"&itemid="+itemid+"&itemamount="+changed;
		if(changed<=20){
			$("#itemamount"+itemid).html(changed);
			$.post("user/changCartItemAmount.do",param);
    	}else{
    		
    	}

	}
    function deleteOneCartItem(itemid){
    	var userid = $("#userid").val();
    	var idname= "itemamount"+itemid;
    	var amount = $("#itemamount"+itemid).html();
    	var changed = parseInt(amount)-1;
    	
    	var param = "userid="+userid+"&itemid="+itemid+"&itemamount="+changed;
    	if(changed<=0){
    		
    	}else{
    		$("#itemamount"+itemid).html(changed);
    		$.post("user/changCartItemAmount.do",param);
    		
    	}
	}
    </script>
    <script type="text/javascript">
    function deleteCartItems(){
    	var userid = $("#userid").val();
    	
    	var checkedCartItems = findChecked();
    	if(checkedCartItems.length!=0){
    		var  r = window.confirm("确定要从购物车删除这些商品？");
            var param = "userid="+userid+"&itemids="+checkedCartItems;
    		if(r){
    			$.post("user/delectCartItems.do",param,function(){
        			window.location.replace("user/tocart.do");
        		});
    		}
    	}
    	
    }
    function buyCartItems(){
    	var userid = $("#userid").val();
    	var checkedCartItems = findChecked();
    	
    	if(checkedCartItems.length!=0){
    		var param = "userid="+userid+"&itemids="+checkedCartItems;
    		Materialize.toast('正在生成订单',1500,'rounded') // int是Toast持续时间
    		$.post("user/orderCartItems.do",param,function(){
    			window.location.replace("mall/user/redirect.jsp");
    			/* window.location.replace("user/redirect.do"); */
    		});
			// url : "user/orderCartItems.do",  
		
    	}
    }
    function findChecked(){
    	var hasChecked = 0;
    	var test = document.getElementsByName("cartitemcheckbox"); 
    	var cartItems = new Array();
    	for(var i=1; i<=test.length; i+=1){
    		if(test[i-1].checked){ 
    		cartItems[cartItems.length]=test[i-1].value;
    		hasChecked=1;
    		}
    	} 
    	if(hasChecked==0){
    		Materialize.toast('请至少选择一个商品',500,'rounded') // int是Toast持续时间
    	}
		return cartItems;
    }
    </script>
  </body>
</html>