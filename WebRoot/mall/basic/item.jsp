<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    
    <title>SomeMall-Item</title>

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
</head>
<body>
<header id="top">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a href="home/toMallHome.do" class="brand-logo left" style="width: 60%">
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
	    <div class="section linen" style="background-image:url(images/rr06.jpg);background-size:cover;">
	
	        <div class="row container" >
	            <div class="row">
	                <form id="searchForm" action="item/toSearch.do">
	               <div class="col m8 s10 offset-s1">
					<div class="input-field" >
	                    <i class="material-icons prefix">search_circle</i>
	                    <input id="searchContext" name="searchContext" type="text" class="validate">
	                    <label for="searchContext">&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</label>
	                </div>
				</div>
				
				<div class="col m4 s12 center" style="margin-top: 25px">
					<a href="javascript:search()" style="border:1px solid black" class="waves-effect waves-black btn-flat"><i class="material-icons left"><i class="material-icons">search</i></i>click to search</a>
				</div>
			</form>
	        
	        <form id="useridinfo" style="display: none;display: none;">
			<input id="userid"  name="userid" value="${user.userid}">
			<input name="currentPage" id="currentPage" />
			</form>
			<span id="userinfo" style="display: none;visibility: hidden;">${user.username}</span>
	        
	            </div>
	        </div>
	
	    </div>
	    
	   <!--  <div class="col m12">
	        <ul class="tabs tab-demo card ">
	            <li class="tab " style="background-color:#fcfcfc">商品详情</li>
	        </ul>
	    </div> -->
	    
<div class="section" style="padding: 0">
        <div class="row grey lighten-4" style="margin: 0">

            <div  class="col l4 m5 s12  grey lighten-3 " style="margin-left:auto;left:auto;right:auto;margin-bottom: 0">
            <br>
                <img class="materialboxed" data-caption="${item.itemname}" width="100%" src="${item.image}">
               <br>
			<a class="waves-effect waves-circle btn-flat" href=" javascript:addToCollect(${item.itemid}) " style="width: 100%" align-items: center;"><i class="material-icons left" style="margin-right: 0">star</i>Collect Item ！</a>
			<br><br><br><br>

            </div>
            <div class="col l7 m5 s12" style="margin: 0;margin-left: 1%">
                <br>
                <h5>${item.itemname}</h5>
                <!-- <br class="hide-on-med-and-down"> -->
                <table style="padding: 0;margin: 0">
				  <tr>
				    <td  class="col l6 m8 s12"><div class="file-field input-field">
				      <p class="range-field">请选择购买数量：
				     	 <input type="range" id="test5" min="0" max="10" />
					  </p>
				    </div></td>
				    
				    
				  </tr>
				  <!-- <tr class="hide-on-med-and-down"><td><br></td></tr> -->
				  <tr>
				  <td class="col l6 m8 s12"><div class="switch">
					    <label>
					      不延保
					      <input type="checkbox">
					      <span class="lever"></span>
					      延保一年
					    </label>
					  </div></td>
					  
				  </tr>
				  
				  <tr><td><br></td></tr>
				  
				  <tr class="hide-on-med-and-down">

				    <td class="col l4" ><a href="javascript:addItemToCart(${item.itemid})" class="btn-large waves-effect waves-red red lighten-2"><i class="material-icons left">redeem</i> 立即购买 </a></td>
				    <td class="col l4"><a href="javascript:addItemToCart(${item.itemid})" class="btn-large waves-effect waves-red red lighten-2"><i class="material-icons left">shopping_cart</i> 加购物车 </a></td>
				    
				  </tr>
				  <tr class="hide-on-large-only col m12 s12">

				    
				    <td class="col m6 s6"><a href="javascript:addItemToCart(${item.itemid})" class="btn waves-effect waves-red red lighten-2"><i class="material-icons left">redeem</i>BUY</a></td>
				    <td class="col m6 s6"><a href="javascript:addItemToCart(${item.itemid})" class="btn waves-effect waves-red red lighten-2"><i class="material-icons left">shopping_cart</i>CART</a>
				    </td>
				    
				  </tr>
				  
				  
				</table>
                <br>
				  </div>
	 </div> 
	 
	 
	 
	    <div class="col l12 m12 s12">
	        <ul class="tabs tab-demo card ">
	            <li id="ItemDescription" class="tab col s3"><a href="javascript:;">商品介绍</a></li>
	            <li id="BaseInfo" class="tab col s3"><a href="javascript:;">基本参数</a></li>
	            <li id="CustomReview" class="tab col s3"><a href="javascript:;">买家评价</a></li>
	            <li id="ReletiveItem" class="tab col s3"><a href="javascript:;">相关商品</a></li>
	        </ul>
	    </div>
	
	<div id="BaseInfoDisplay">
	    <br><br>
		    <table>
		    <tr>
		    <td></td>
		    <td></td>
		    <td>商品名称</td>
		    <td></td>
		    <td>${item.itemname}</td>
		    </tr>
		    
		    <tr>
		    <td></td>
		    <td></td>
		    <td>商品类别</td>
		    <td></td>
		    <td>${item.catname}</td>
		    </tr>
		    <tr>
		    <td></td>
		    <td></td>
		    <td>商品价格</td>
		    <td></td>
		    <td>${item.price} （元）</td>
		    </tr>
		    <tr>
		    <td></td>
		    <td></td>
		    <td>剩余库存</td>
		    <td></td>
		    <td>${item.num} （个）</td>
		    </tr>
		    </table>
		    
			<br><br><br>
	    </div>
	
	
	

	<div id="ItemDescriptionDisplay">
		${item.itemdescrip}
	</div>
	<div id="CustomReviewDisplay">
	<img width="100%" src="images/item/item10/review.png">
	<img width="100%" src="images/item/item13/review.png">
	
		
		<br><br><br><br>
	</div>
	<div id="ReletiveItemDisplay">
	<br><br>
	<img width="100%" src="images/item/item10/about.png">
	
	<br><br><br><br>
	</div>

</div>


 <div class="col l12 m12 s12">
	        <ul class="tabs tab-demo card ">
	            <li class="tab " style="background-color:#fcfcfc">Thank you for your patronage</li>
	        </ul>
 </div>
	</main>
<jsp:include page="../basic/button.jsp"></jsp:include>
<jsp:include page="../basic/modal.jsp"></jsp:include>
<jsp:include page="../basic/footer.jsp"></jsp:include>
	
	



  <!--  Scripts   -->
    <!-- <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
    <script src="js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript">
    	if (!window.jQuery) {
        	document.write('<script src="js/jquery-2.2.0.min.js">'+'<'+'/script>');
    	}
    </script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
    <script src="js/somemallbase.js"></script>
	<script type="text/javascript">
	function searchItem(){
		var param = "searchContext="+$("#searchContext").val()+"&currentPage="+$("#currentPage").val();
		$("#searchForm").submit();
	}
	function search(){
		if($("#searchContext").val()==""||$("#searchContext").val()==" "||$("#searchContext").val()=="  "){
				Materialize.toast('请输入搜索内容',500,'rounded') // int是Toast持续时间
		}else{
			sessionStorage.setItem("searchContext", $("#searchContext").val());
			sessionStorage.setItem("currentPage", 1);
			$("#currentPage").val("1");
			searchItem();
		}
		
	}
	
	</script>
	
	<script language="javascript" type="text/javascript">
	$(function(){
		$("#ItemDescription").click(function(){
			$("#ItemDescriptionDisplay").show();
			$("#BaseInfoDisplay").hide();
			$("#CustomReviewDisplay").hide();
			$("#ReletiveItemDisplay").hide();
		});
		$("#BaseInfo").click(function(){
			$("#ItemDescriptionDisplay").hide();
			$("#BaseInfoDisplay").show();
			$("#CustomReviewDisplay").hide();
			$("#ReletiveItemDisplay").hide();
		});
		$("#CustomReview").click(function(){
			$("#ItemDescriptionDisplay").hide();
			$("#BaseInfoDisplay").hide();
			$("#CustomReviewDisplay").show();
			$("#ReletiveItemDisplay").hide();
		});
		$("#ReletiveItem").click(function(){
			$("#ItemDescriptionDisplay").hide();
			$("#BaseInfoDisplay").hide();
			$("#CustomReviewDisplay").hide();
			$("#ReletiveItemDisplay").show();
		});
	})
		
	</script>
	
	<script language="javascript" type="text/javascript">
	
		function addItemToCart(itemid) {
			var userid =${user.userid};
			Materialize.toast('添加购物车成功',500,'rounded') // int是Toast持续时间
			var param = "itemid="+itemid+"&userid="+userid;
			$.post("user/addItemToCart.do",param);//
	
		}
		function addToCollect(itemid) {
			var userid =${user.userid};
			var param = "itemid="+itemid+"&userid="+userid;
			$.post("user/addToCollect.do",param,function(data){
				var result = data;
				if(result=="0"){
					Materialize.toast('商品已收藏',500,'rounded') // int是Toast持续时间
				}else if(result=="1"){
					Materialize.toast('收藏成功',500,'rounded') // int是Toast持续时间
				}
			},"text");
		}
	
	</script>
	<script type="text/javascript">
		$(function() {
			$("#BaseInfoDisplay").hide();
			$("#ItemDescriptionDisplay").show();
			$("#CustomReviewDisplay").hide();
			$("#ReletiveItemDisplay").hide();
			if($("#userid").val()==""){
				$("#userCenter").hide();
				$("#userCart").hide();
				$("#userOrder").hide();
				$("#userCollect").hide();
				$("#toLogout").hide();
				$("#toLogin").show();
				$("#toRegist").show();
			}else{
				$("#userCenter").show();
				$("#userCart").show();
				$("#userOrder").show();
				$("#userCollect").show();
				$("#toLogout").show();
				$("#toLogin").hide();
				$("#toRegist").hide();
			}
			
			$("#searchContext").val(sessionStorage.getItem("searchContext").toString());
			$("#currentPage").val(sessionStorage.getItem("currentPage").toString()); 
		})
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
	