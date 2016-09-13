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
            background-color: rgb(95, 162, 244);
        }
    </style>
  </head>
<body>

<header id="top">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo left"><img style="width: 460px;height: 80px" class="responsive-img" src="images/Create.png"></a>
                <ul class="right hide-on-med-and-down">
                    <li style="padding-top: 9px;">
                        <font color="black"><i class="material-icons left">mdi_action_done</i> 请仔细确认您的订单</font>
                    </li>
                    <li>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><i class="material-icons left">mdi_action_done</i> 请仔细确认您的订单</li>
                    <li>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

<main>
<div class="section"></div>
<div class="section"></div>
<div class="section">

	<div class="container" style="background:#f5f2f0;border: 1px solid gray;padding-top: 10px;padding-bottom: 10px;padding-left: 50px;padding-right: 50px">
	    <ul class="collection z-depth-0" style="background:#f5f2f0;border:0px">
	        <li class="collection-item avatar" style="background:#f5f2f0;">
	            <img src="images/ilogo/apple.jpg" alt="" class="circle">
	            <form action="">
		            <span style="display: none">id</span>
		            <span><font color="#b71c1c">年月日</font></span>
		            <p>订单号: </p>
		            
		            <p>总价格: ￥ 111</p>
					<p>包括的物品: 什么鬼 几个   什么鬼 几个   什么鬼 几个</p>
					<p>收货地址:下拉下拉 下拉</p>
		            <input type="submit" class="btn red" value="确认无误并支付">  </input>
	<!-- 		            <a href="#!" class="secondary-content"> <i class="material-icons">close</i> </a> -->
				</form>
	        </li>
	    </ul>
	</div>
</div>
<div class="section"></div>
<div class="section"></div>

</main>
<div class="col offset-l1 m11">
     <ul class="tabs tab-demo ">
         <li class="tab red-text text-darken-4" style="background-color:#eeeeee"><strong><h5>PLEASE CHECK YOUR ORDER ITEMS CAREFULLY.THANKS FOR YOUR PURCHASE</h5></strong></li>
     </ul>
 </div>

<jsp:include page="../basic/button.jsp"></jsp:include>
<jsp:include page="../basic/footer.jsp"></jsp:include>
<jsp:include page="../basic/modal.jsp"></jsp:include>



<!------------------------------------------------  Scripts---------------------------------------------->
   <!--  Scripts-->
  <script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>

    <script>if (!window.jQuery) {
        document.write('<script src="https:/code.jquery.com/jquery-2.1.4.min.js"><\/script>');
    }
    </script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>

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
  	$(
  	function(){
  		
  		
  		
  		
  		
  		$("#scroll_top").click(function(){$("html,body").animate({scrollTop: '0px'}, 800);}); 	
  		
  		
 
    		
    	$("#updateusernamebtn")	.click(function(){
    		$.ajax({
				    url : "user/modifyusername.do",  
				    type : "POST",  
				    data : $("#updatenameform").serialize(),
				    dataType : 'json',
				    success : function(data) {
				    	var displayname="";
				    	if(data.username.length>10 ){
				    		displayname=data.username.substr(0, 10)+"...";
				    	}else{
				    		displayname=data.username;
				    	}
				    	$("#sidediv").html("<img src='images/mianmm.png' alt='Contact Person'>"+displayname );
				    	$("#usernamesidebar").html("<i class='material-icons left'>mode_edit</i>"+displayname );
				    	Materialize.toast('finish',1500,'rounded') // int是Toast持续时间
				    }
			});
    	});
    	
    	
    	$("#updateemailbtn").click(
    		function(){
	    		$.ajax({
	    		url : "user/emailupdate.do",
	    		type : "POST",
	    		data : $("#updateemailform").serialize(),
	    		dataType : "json",
	    		success:function(data){
	    			var displayemail="";
				    	if(data.email.length>9 ){
				    		displayemail=data.email.substr(0, 9)+"...";
				    	}else{
				    		displayemail=data.email;
				    	}
				    	$("#emailupdate").html("<i class='material-icons left'>email</i>"+ displayemail);
				    	Materialize.toast('finish',1500,'rounded') // int是Toast持续时间
    		}
    		})
    	});
  		
 
  	}
  )
  </script>
  
<script type="text/javascript">
 
 function bigger(num){
 var str = "imgp"+num;
 var img = document.getElementById(str);
  img.style.width = '52%';
}


 function smaller(num){
 var str = "imgp"+num;
 var img = document.getElementById(str);
  img.style.width = '49%';
}
 </script>
 
 
    <script type="text/javascript">
        $(function() {
            $("#sidediv").click(function(){
                $('.button-collapse').sideNav('show');
            })
        })
    </script>
    

  </body>
</html>