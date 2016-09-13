<%@ page pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--浏览器适配-->
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">

	<title>SomeMall-Forget</title>

    <!--Icon-->
    <link rel="apple-touch-icon-precomposed" href="images/navlogo.png">
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="images/navlogo.png">
    <link rel="icon" href="images/navlogo.png" sizes="32x32">

    <!--字体-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" type="text/css">

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
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" href="css/materialize.min.css">
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
        html {
            /*display: table;*/
            margin: auto;
        }
        body {
            /*display: table-cell;*/
            vertical-align: middle;
            background-color: #666666;
            background-image:url(images/bg.png);
            background-size: cover;
            /*background-repeat:no-repeat;*/
            background-position:center;
        }

        .margin {
            margin: 0 !important;
        }
    </style>
    <!--[if IE]>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body style="padding-left: 0%"  >

<div id="login-page" class="row" >
    <br><br class="hide-on-small-only"><br class="hide-on-small-only">
    <div class="col offset-l3 l6 offset-s1 s9 z-depth-5 card " >
        <form class="forgetForm">
            <div class="row">
                <div class="input-field col s12 center">
                <a class="tooltipped" data-delay="5" data-tooltip="Click Me To Home" href="home/toMallHome.do">
                	<img src="images/navlogo.png" alt="" class="responsive-img valign">
                </a>
                    <p class="center login-form-text"><b> Forget Password</b></p>
                </div>
            </div>
            
           <div class="row margin">
                <div class="input-field col s12">
                    <i class="material-icons prefix">account_circle</i>
                    <input class="validate" id="email" type="email">
                    <label for="email" data-error="wrong" data-success="right">Email</label>
                    <span id="emailSpan"></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <a id="sendEmail" type="button" class="btn waves-effect waves-light col s12" style="background-color: lightslategray">找回我的密码</a>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 m6 l6">
                    <p class="margin medium-small"><a href="home/toLogin.do">返回登陆~</a></p>
                </div>
                <div class="input-field col s6 m6 l6">
                    <p class="margin right-align medium-small"><a href="home/toRegist.do">现在注册!</a></p>
                </div>
            </div>
        </form>
    </div>
</div>



  <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script>if (!window.jQuery) {
        document.write('<script src="js/jquery-2.2.0.min.js"><\/script>');
    }
    </script>
    
	<script type="text/javascript">
		$(function(){
			$("#sendEmail").click(function(){
				$("#emailSpan").text("");
				var email = $("#email").val();
				if (email ==""||email==" ") {
					//提示，如果用户名为空，则被此判断拦截，页面不会做判断和跳转
					$("#emailSpan").append("&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 邮箱不能为空");
					return;
				} 
				var param ="email="+email;
				$.ajax({
				    url : "home/sendemail.do",  
				    type : "POST",  
				    data : param,
				    dataType: 'text',
				    success : function(data) {  
				    	var result =data;
				    	/* alert(result); */
						if (result == "1") {
							$("#emailSpan").text("");
							//window.location.href = "home/toMallHome.do";
							alert("已将密码发送至您的邮箱，请注意查收～")
						} else{
							
							$("#emailSpan").append("&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 此邮箱尚未注册");
						} 
				        /* console.log(result);  */
				    }  
				}); 
			});
		});
	</script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>
