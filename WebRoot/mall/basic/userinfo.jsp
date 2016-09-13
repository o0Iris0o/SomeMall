<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<ul id="slide-out" class="side-nav">
	<c:choose>
		<c:when test="${(empty sessionScope.user)||(sessionScope.user eq null)}">  
			<div class="container">
				<div class="row">
					<div class="userView">
						<a href="#!user"><img class="circle" src="images/m-logo-salmon.png" style="width: 50%;margin-top:10px"> <label class="red-text">未登录</label> </a>
					</div>
				</div>
		    </div>
		</c:when>
		<c:otherwise>
			<div class="container">
		        <div class="row">
		            <div class="userView">
		                <a href="#!user"><img class="circle" src="images/mianmm.png" style="width: 50%;margin-top:10px"> <label class="amber-text">#^_^#</label> </a>
		            </div>
		        </div>
		    </div>
			
			    <div class="row" style="top:60%">
			        <li>
			            <a class="modal-trigger tooltipped btn-flat waves-effect waves-red" href="#modal1" data-position="right" data-delay="50" data-tooltip="点击修改用户名">
			                <i class="material-icons left">mode_edit</i>CrazyBuyer...
			                <!--取子串前10个字母+...-->
			            </a>
			        </li>
			
			        <li>
			            <a class="modal-trigger tooltipped btn-flat waves-effect waves-red" href="#modal2" data-position="right" data-delay="50" data-tooltip="点击修改邮箱">
			                <i class="material-icons left">email</i> bLeo@gmaa...
			                <!--取子串前9个字母+...-->
			            </a>
			        </li>
			
			        <li>
			            <a class="modal-trigger tooltipped btn-flat waves-effect waves-red" href="#modal3" data-position="right" data-delay="50" data-tooltip="点击修改密码">
			                <i class="material-icons left">verified_user</i> ••••••
			            </a>
			        </li>
			
			        <li>
			            <a class="modal-trigger tooltipped btn-flat waves-effect waves-red" href="#modal4" data-position="right" data-delay="50" data-tooltip="点击新增收获地址">
			                <i class="material-icons left">location_on</i> 古城西路杨庄...
			                <!--取子串前六个+"..."-->
			            </a>
			        </li>
			
			    </div>
			
		</c:otherwise>
	</c:choose>
</ul>




<!-- Modal Structure -->
<div id="modal1" class="modal bottom-sheet">
    <div class="modal-content">

        <ul class="collection">
            <li class="collection-item avatar">
                <img src="images/mianmm.png" alt="" class="circle">
                <span class="title">修改用户名</span>
                <p>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6 offset-s2">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="Musername" type="text" class="validate">
                            <label for="Musername">新用户名</label>
                        </div>

                        <div class="col s2 offset-s1">
                            <button style="margin-top: 15%" class="btn waves-effect waves-light" type="submit">Submit
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">mode_edit</i></a>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="#!" class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
    </div>
</div>




<div id="modal2" class="modal bottom-sheet">
    <div class="modal-content">
        <ul class="collection">
            <li class="collection-item avatar">
                <img src="images/mianmm.png" alt="" class="circle">
                <span class="title">修改邮箱地址</span>
                <p>
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6 offset-s2">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="email" class="validate">
                            <label for="email" data-error="wrong" data-success="right">Email</label>
                        </div>

                        <div class="col s2 offset-s1">
                            <button style="margin-top: 15%" class="btn waves-effect waves-light" type="submit">Submit
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">email</i></a>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="#!" class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
    </div>
</div>



<div id="modal3" class="modal bottom-sheet">
    <div class="modal-content">



        <ul class="collection">
            <li class="collection-item avatar">
                <img src="images/yuna.jpg" alt="" class="circle">
                <span class="title">修改密码</span>

                <p>
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s5">
                                <i class="material-icons prefix">lock_open</i>
                                <input id="icon_prefix3" type="password" class="validate">
                                <label for="icon_prefix3">旧密码</label>
                            </div>
                            <div class="input-field col s5">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="icon_prefix4" type="password" class="validate">
                                <label for="icon_prefix4">新密码</label>
                            </div>
                            <div class="col s2">
                                <button style="margin-top: 15%" class="btn waves-effect waves-light" type="submit">Submit
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                        </div>
                    </form>
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">verified_user</i></a>
            </li>
        </ul>


    </div>
    <div class="modal-footer">
        <a href="#!" class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
    </div>
</div>


<div id="modal4" class="modal">
    <div class="modal-content">
        <h5><i class="small material-icons left">location_on</i>新增收货地址</h5>
        <p>
            <form  class="col s12">
                <div class="row">
                    <div class="input-field col s4">
                        <select>
                            <option value="" disabled selected>Choose your province</option>
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
                        </select>
                        <label>选择省份</label>
                    </div>
                    <div class="input-field col s4">
                        <select>
                            <option value="" disabled selected>Choose your city</option>
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
                        </select>
                        <label>选择城市</label>
                    </div>
                    <div class="input-field col s4">
                        <select>
                            <option value="" disabled selected>Choose your district</option>
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
                        </select>
                        <label>选择行政区域</label>
                    </div>


                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <input id="addstr" type="text" class="validate">
                        <label for="addstr">门牌号详细地址</label>
                    </div>
                    <div class="col s2">
                        <button style="margin-top: 15%" class="btn waves-effect waves-light" type="submit">Submit
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
		</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
    </div>
</div>
</body>
</html>