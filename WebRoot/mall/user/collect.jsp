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
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    
    <title>SomeMall-Collect</title>

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
							<li class="center hide-on-med-and-down"><p style="color: black;font-size:18px;"> 我 的 收 藏 夹 </p></li> 
							
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
                 <h1 class="header center white-text  text-darken-4">我 的 收 藏 夹</h1>
                
                <div class="row center">
                </div>
            </div>
        </div>
    <div class="parallax"><img src="images/collect.png" alt="Unsplashed background img 1"></div>
</div>



  <div class="row">
  <br><br>
			<form>
				<div class="col offset-m1 m7  offset-s1 s9">
					<div class="input-field" >
	                    <i class="material-icons prefix">search_circle</i>
	                    <input id="searchContext" type="text" class="validate">
	                    <label for="searchContext">&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</label>
	                </div>
				</div>
				
				<div class="col m3 s12 center" style="margin-top: 25px">
					<a href="javascript:searchCollectByNameAndPage()" style="border:1px solid black" class="waves-effect waves-black btn-flat"><i class="material-icons left"><i class="material-icons">search</i></i>click to search</a>
				</div>
			</form>
		<form id="useridinfo" style="display: none;visibility: hidden;">
		<input id="userid"  name="userid" value="${user.userid}">
		<input name="currentPage" id="currentPage" />
		</form>
		<span id="userinfo"  style="display: none;visibility: hidden;">${user.username}</span>
        <br><br>
   </div>
   
    <div class="section"  style="background-image:url(images/rr06.jpg);background-size:cover;">
        <div class="row">
            <div class="col m9 offset-m1">
                <div class="row" id="showlist">
                
              <c:choose>
							<c:when test="${page.totalCount eq 0}">  
								<br>
								<h3 class="center" style="color: grey;">There's no collection～</h3>
								<br>
							</c:when>
							<c:otherwise>
							        <!--收藏卡片 start -->
					                <c:forEach items="${page.data}" var="collect">
					                     <div class="col s12 m6 l4">
					                        <div class="card small hoverable sticky-action" style="overflow: hidden;">
					                            <div class="card-image waves-effect waves-block waves-light">
					                                <img class="activator" src="${collect.image}" alt="${collect.itemname}">
					                                 
					                            </div>
					                            <div class="card-content">
					                                <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i></span>
					
					                                <p><a  href="item/toItem.do?itemid=${collect.itemid}">${collect.displayname}</a></p>
					                            </div>
					
					                            <div class="card-action">
					                                <a  class="waves-effect" href="javascript:addItemToCart(${collect.userid},${collect.itemid})"> <i class="material-icons left">add_shopping_cart</i>购物车  </a>
					                                <a  class="waves-effect" href="javascript:deleteCollect(${collect.collectid})"> <i class="material-icons left">delete</i>删除收藏 </a>
					                            </div>
					                            
					
					                            <div class="card-reveal" style="display: none; transform: translateY(0px);">
					                                <span class="card-title grey-text text-darken-4">${collect.displayname}<i class="material-icons right">close</i></span>
					                                <p>${collect.itemname}</p>
					                            </div>
					                        </div>
					                    </div>
					                  </c:forEach> 
					                <!--收藏卡片 end -->
							</c:otherwise>
							   </c:choose>
        
                </div>
                
            </div>
            
        </div>

        
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





</main>



	
<jsp:include page="../basic/button.jsp"></jsp:include>
<jsp:include page="../basic/modal.jsp"></jsp:include>
<jsp:include page="../basic/footer.jsp"></jsp:include>

  <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script>if (!window.jQuery) {
        document.write('<script src="js/jquery-2.2.0.min.js"><\/script>');
    }
    </script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
    <script src="js/somemallbase.js"></script>
	<script  language="javascript"  type="text/javascript">
		$(function() {
		})
	</script>
	<script language="javascript" type="text/javascript">
		function addItemToCart(itemid,userid) {
			Materialize.toast('添加购物车成功',500,'rounded') // int是Toast持续时间
			var param = "itemid="+itemid+"&userid="+userid;
			$.post("user/addItemToCart.do",param);//
		}
		function deleteCollect(collectid){
			var  r = window.confirm("确定要删除此收藏吗？");
			if(r){
				var param = "collectid="+collectid;
				$.post("user/delectCollect.do",param);
				searchCollectByNameAndPage();
			}
		}
	</script>
	<script type="text/javascript">
	//分页查询
	function toPage(currentPage) {
		sessionStorage.setItem("currentPage", currentPage);
		$("#currentPage").val(currentPage);
		searchCollectByPage();
	}
	function searchCollectByNameAndPage(){
		sessionStorage.setItem("currentPage","1");
		$("#currentPage").val("1");
		searchCollectByPage();
	}
	function searchCollectByPage(){
		sessionStorage.setItem("searchContext", $("#searchContext").val());
		var param = "userid="+$("#userid").val()+"&searchContext="+$("#searchContext").val()+"&currentPage="+$("#currentPage").val();
		$.ajax({
		    url : "user/findCollect.do",  
		    type : "POST",  
		    data : param,
		    dataType: 'json',
		    success : function(page,status) { 
		    	if(page.totalCount==0){
	    			$("#showlist").html("<br><h3 class='center' style='color:grey;'>No such collection～ T_T</h3><br>");
		    		return;
		    	}
		    	var list =page.data;
		    	$("#showlist").html("");
		    	$.each(list, function(i,collect){ 
		    		
		    		
			    	$("#showlist").append("<div class='col s12 m6 l4'><div class='card small hoverable sticky-action' style='overflow: hidden;'><div class='card-image waves-effect waves-block waves-light'><img class='activator' src='"+collect.image+"' alt='"+collect.itemname+"'></div><div class='card-content'><span class='card-title activator grey-text text-darken-4'><i class='material-icons right'>more_vert</i></span><p><a  href='item/toItem.do?itemid="+collect.itemid+"'>"+collect.displayname+"</a></p></div><div class='card-action'><a class='waves-effect' href='javascript:addItemToCart("+collect.userid+","+collect.itemid+")'> <i class='material-icons left'>add_shopping_cart</i>购物车</a><a class='waves-effect' href='javascript:deleteCollect("+collect.collectid+")'> <i class='material-icons left'>delete</i>删除收藏  </a></div><div class='card-reveal' style='display: none; transform: translateY(0px);'><span class='card-title grey-text text-darken-4'>"+collect.displayname+"<i class='material-icons right'>close</i></span><p>"+collect.itemname+"</p></div></div></div>");
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
	}
	</script>
	<script type="text/javascript">
	$(function(){
		if($("#userid").val()==""){
			$("#userinfo").text("请登录");
		}
	});
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
	