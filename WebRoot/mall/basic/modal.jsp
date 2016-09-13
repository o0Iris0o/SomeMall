<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<!-- ------------------------------------------------------------------------------------------------- -->
	<ul id="slide-out" class="side-nav">
		<c:choose>
			<c:when
				test="${(empty sessionScope.user)||(sessionScope.user eq null)}">
				<div class="container">
					<div class="row">
						<div class="userView">
							<a href="#!user"><img class="circle"
								src="images/m-logo-salmon.png"
								style="width: 50%;margin-top:10px"> <label
								class="red-text">未登录</label> </a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container">
					<div class="row">
						<div class="userView">
							<a href="#!user"><img class="circle" src="images/mianmm.png"
								style="width: 50%;margin-top:10px"> <label
								class="amber-text">#^_^#</label> </a>
						</div>
					</div>
				</div>

				<div class="row" style="top:60%">

					<li><a id="usernamesidebar"
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						href="#modal1" data-position="right" data-delay="50"
						data-tooltip="点击修改用户名"> <i class="material-icons left">mode_edit</i>${sessionScope.user.username}
							<!--取子串前10个字母+...-->
					</a></li>

					<li><a id="emailupdate"
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						href="#modal2" data-position="right" data-delay="50"
						data-tooltip="点击修改邮箱"> <i class="material-icons left">email</i>${fn:substring(sessionScope.user.email, 0, 9)}•••
							<!--取子串前9个字母+...-->
					</a></li>

					<li><a
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						href="#modal3" data-position="right" data-delay="50"
						data-tooltip="点击修改密码"> <i class="material-icons left">verified_user</i>
							••••••
					</a></li>

					<li><a
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						href="#modal4" data-position="right" data-delay="50"
						data-tooltip="点击新增收获地址"> <i class="material-icons left">location_on</i>${fn:substring(addr, 0, 6)}...
							<!--取子串前六个+"..."-->
					</a></li>
					<li>
					<a
						href="user/toCollect.do" 
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						data-position="right" data-delay="50"
						data-tooltip="我的收藏"> <i class="material-icons left">star</i>我的收藏
					</a>
					</li>
					
					<li>
					<a
						href="user/tocart.do" 
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						data-position="right" data-delay="50"
						data-tooltip="购物车"> <i class="material-icons left">shopping_cart</i>购物车
					</a>
					</li>
					
					<li>
					<a
						href="user/toorder.do"
						class="modal-trigger tooltipped btn-flat waves-effect waves-red"
						data-position="right" data-delay="50"
						data-tooltip="我的订单"> <i class="material-icons left">assignment</i>我的订单
					</a>
					</li>
					
					<li>
					<a 
						href="home/toLogout.do" 
						class="modal-trigger tooltipped btn-flat waves-effect waves-red" 
						data-position="right" data-delay="50"
						data-tooltip=" 注   销 "
						><i class="material-icons left">reply_all</i> 注 &nbsp;&nbsp; 销 </a>
					</li>
				
				</div>

			</c:otherwise>
		</c:choose>
	</ul>
	<!-- ------------------------------------------------------------------------------------------------- -->





	<!-- ------------------------------------------Modal Structure---------------------------------------- -->
	<div id="modal1" class="modal bottom-sheet">
		<div class="modal-content">

			<ul class="collection">
				<li class="collection-item avatar"><img src="images/mianmm.png"
					alt="" class="circle"> <span class="title">修改用户名</span>
					<p>
					<form id="updatenameform" class="col s12">
						<div class="row">
							<div class="input-field col s6 offset-s2">
								<i class="material-icons prefix">account_circle</i> <input
									name="userid" value="${sessionScope.user.userid}"
									style="display: none;" type="text"> <input
									name="newname" id="newname" type="text" class="validate">
								<label for="Musername">新用户名</label>
							</div>

							<div class="col s2 offset-s1">
								<button id="updateusernamebtn" style="margin-top: 15%"
									class="btn waves-effect waves-light" type="button">
									Submit <i class="material-icons right">send</i>
								</button>
							</div>
						</div>
					</form>
					</p> <a href="#!" class="secondary-content"><i
						class="material-icons">mode_edit</i></a></li>
			</ul>


		</div>
		<div class="modal-footer">
			<a href="#!"
				class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
		</div>
	</div>




	<div id="modal2" class="modal bottom-sheet">
		<div class="modal-content">



			<ul class="collection">
				<li class="collection-item avatar"><img src="images/mianmm.png"
					alt="" class="circle"> <span class="title">修改邮箱地址</span>
					<p>
					<form id="updateemailform" class="col s12">
						<div class="row">
							<div class="input-field col s6 offset-s2">
								<i class="material-icons prefix">email</i> 
								<input name="userid"
									value="${sessionScope.user.userid}" style="display: none;"
									type="text"> 
								<input id="email" name="email"
									type="email" class="validate"> <label for="email"
									data-error="格式错误" data-success="格式正确">Email</label>
							</div>

							<div class="col s2 offset-s1">
								<button id="updateemailbtn" style="margin-top: 15%"
									class="btn waves-effect waves-light" type="button">
									Submit <i class="material-icons right">send</i>
								</button>
							</div>
						</div>
					</form>
					</p> <a href="#!" class="secondary-content"><i
						class="material-icons">email</i></a></li>
			</ul>


		</div>
		<div class="modal-footer">
			<a href="#!"
				class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
		</div>
	</div>



	<div id="modal3" class="modal bottom-sheet">
		<div class="modal-content">



			<ul class="collection">
				<li class="collection-item avatar"><img src="images/mianmm.png"
					alt="" class="circle"> <span class="title">修改密码</span>
					<p>
					<form id="pwdform" class="col s12">
						<div class="row">
							<div class="input-field col s5">
								<i class="material-icons prefix">lock_open</i> 
								 <input name="userid"
									value="${sessionScope.user.userid}" style="display: none;"
									type="text"> 
								<input
									id="oldPwd" name="oldPwd" type="password" class="validate"> <label
									for="oldPwd">旧密码</label>
							</div>
							<div class="input-field col s5">
								<i class="material-icons prefix">lock_outline</i> <input
									id="newPwd" name="newPwd" type="password" class="validate"> <label
									for="newPwd">新密码</label>
							</div>
							<div class="col s2">
								<button id="updatepwdbtn" style="margin-top: 15%" type="button"
									class="btn waves-effect waves-light">
									Submit <i class="material-icons right">send</i>
								</button>
							</div>
						</div>
					</form>
					</p> <a href="#!" class="secondary-content"><i
						class="material-icons">verified_user</i></a></li>
			</ul>


		</div>
		<div class="modal-footer">
			<a href="#!"
				class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
		</div>
	</div>


	<div id="modal4" class="modal">
		<div class="modal-content">
			<h5>
				<i class="small material-icons left">location_on</i>新增收货地址
			</h5>
			<p>
			<form class="col s12">
				<div class="row">
					<div class="input-field col s4">
						<select>
							<option value="" disabled selected>Choose your province</option>
							<option value="1">河北</option>
							<option value="2">四川</option>
							<option value="3">辽宁</option>
						</select> <label>选择省份</label>
					</div>
					<div class="input-field col s4">
						<select>
							<option value="" disabled selected>Choose your city</option>
							<option value="1">北京</option>
							<option value="2">上海</option>
							<option value="3">沈阳</option>
						</select> <label>选择城市</label>
					</div>
					<div class="input-field col s4">
						<select>
							<option value="" disabled selected>Choose your district</option>
							<option value="1">朝阳区</option>
							<option value="2">石景山区</option>
							<option value="3">皇姑区</option>
						</select> <label>选择行政区域</label>
					</div>


				</div>
				<div class="row">
					<div class="input-field col s8">
						<input id="addstr" type="text" class="validate"> <label
							for="addstr">门牌号详细地址</label>
					</div>
					<div class="col s2">
						<button style="margin-top: 15%"
							class="btn waves-effect waves-light" type="button">
							Submit <i class="material-icons right">send</i>
						</button>
					</div>
				</div>
			</form>
			</p>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="amber-text modal-action modal-close waves-effect waves-red btn-flat">取消修改</a>
		</div>
	</div>
	<!-- ------------------------------------------Modal Structure---------------------------------------- -->



</body>
</html>


