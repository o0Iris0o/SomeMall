$(function(){
  		$("#mostsold").click(
		function(){
			$.post(
			"home/findmostsold.do",
			function(data){
				$("#brdiv").remove();
				$("#hottab").animate({
  					left:'450px',
  					opacity:'0.1',
					},"slow",function (){$(this).remove();});
				var result="<div id='brdiv' style='position: relative;'><br></div><div id='hottab' style='position: relative;'>";
				$.each(data,function(n,value){
					result=result+"<div class='col s12 m4 l4'>"+
                "<div class='card small sticky-action z-depth-0 hoverable' style='overflow: hidden;'>"+
                    "<div class='card-image waves-effect waves-block waves-light'>"+
                        "<img class='activator' src='"+value.image+"'>"+
                    "</div>"+
                    "<div class='card-content'>"+
                        "<span class='card-title activator grey-text text-darken-4'><i class='material-icons right'>more_vert</i></span>"+
                        "<p><a href='item/toItem.do?itemid="+value.itemid+"'>"+value.itemname+"</a></p>"+
                    "</div>"+
                    "<div class='card-action'>"+
                        "<a href='javascript:addItemToCart("+value.itemid+")' class='waves-effect'><i class='material-icons left'>add_shopping_cart</i> 购物车</a>"+
                        "<a href='javascript:addToCollect("+value.itemid+")' class='waves-effect'><i class='material-icons left'>star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>"+
                    "</div>"+
                    "<div class='card-reveal' style='display: none; transform: translateY(0px);'>"+
                        "<span class='card-title grey-text text-darken-4'>"+value.displayname+"<i class='material-icons right'>close</i></span>"+
                        "<p>"+value.itemname+"</p>"+
                    "</div>"+
                "</div>"+
            	"</div>";
				})
				result=result+"</div>";
				$("#hotlist").append(result);
			},
			"json"
			);
		}
	);	

	$("#hotcollect").click(
		function(){
			$.post(
			"home/findhotcollect.do",
			function(data){
				$("#brdiv").remove();
				$("#hottab").animate({
  					left:'450px',
  					opacity:'0.1',
					},"slow",function (){$(this).remove();})
				var result="<div id='brdiv' style='position: relative;'><br></div><div id='hottab' style='position: relative;'>";
				$.each(data,function(n,value){
					result=result+"<div class='col s12 m4 l4'>"+
                "<div class='card small sticky-action z-depth-0 hoverable' style='overflow: hidden;'>"+
                    "<div class='card-image waves-effect waves-block waves-light'>"+
                        "<img class='activator' src='"+value.image+"'>"+
                    "</div>"+
                    "<div class='card-content'>"+
                        "<span class='card-title activator grey-text text-darken-4'><i class='material-icons right'>more_vert</i></span>"+
                        "<p><a href='item/toItem.do?itemid="+value.itemid+"'>"+value.itemname+"</a></p>"+
                    "</div>"+
                    "<div class='card-action'>"+
                        "<a href='javascript:addItemToCart("+value.itemid+")' class='waves-effect'><i class='material-icons left'>add_shopping_cart</i> 购物车</a>"+
                        "<a href='javascript:addToCollect("+value.itemid+")' class='waves-effect'><i class='material-icons left'>star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>"+
                    "</div>"+
                    "<div class='card-reveal' style='display: none; transform: translateY(0px);'>"+
                        "<span class='card-title grey-text text-darken-4'>"+value.displayname+"<i class='material-icons right'>close</i></span>"+
                        "<p>"+value.itemname+"</p>"+
                    "</div>"+
                "</div>"+
            	"</div>";
				})
				result=result+"</div>";
				$("#hotlist").append(result);
			},
			"json"
			);
		}
	);	
	
	$("#hotcomment").click(
			
		function(){
			$.post(
			"home/findhotcomment.do",
			function(data){
				$("#brdiv").remove();
				$("#hottab").animate({
  					left:'450px',
  					opacity:'0.1',
					},"slow",function (){$(this).remove();});
				var result="<div id='brdiv' style='position: relative;'><br></div><div id='hottab' style='position: relative;'></div>";
				$("#hotlist").append(result);
			},
			"json"
			);
		}
	);
	
	$("#newitem").click(
		function(){
			$.post(
			"home/findnewitem.do",
			function(data){
				$("#brdiv").remove();
				$("#hottab").animate({
  					left:'450px',
  					opacity:'0.1',
					},"slow",function (){$(this).remove();});
				var result="<div id='brdiv' style='position: relative;'><br></div><div id='hottab' style='position: relative;'>";
				$.each(data,function(n,value){
					result=result+"<div class='col s12 m4 l4'>"+
                "<div class='card small sticky-action z-depth-0 hoverable' style='overflow: hidden;'>"+
                    "<div class='card-image waves-effect waves-block waves-light'>"+
                        "<img class='activator' src='"+value.image+"'>"+
                    "</div>"+
                    "<div class='card-content'>"+
                        "<span class='card-title activator grey-text text-darken-4'><i class='material-icons right'>more_vert</i></span>"+
                        "<p><a href='item/toItem.do?itemid="+value.itemid+"'>"+value.itemname+"</a></p>"+
                    "</div>"+
                    "<div class='card-action'>"+
                        "<a href='javascript:addItemToCart("+value.itemid+")' class='waves-effect'><i class='material-icons left'>add_shopping_cart</i> 购物车</a>"+
                        "<a href='javascript:addToCollect("+value.itemid+")' class='waves-effect'><i class='material-icons left'>star</i>收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>"+
                    "</div>"+
                    "<div class='card-reveal' style='display: none; transform: translateY(0px);'>"+
                        "<span class='card-title grey-text text-darken-4'>"+value.displayname+"<i class='material-icons right'>close</i></span>"+
                        "<p>"+value.itemname+"</p>"+
                    "</div>"+
                "</div>"+
            	"</div>";
				})
				result=result+"</div>";
				$("#hotlist").append(result);
			},
			"json"
			);
		});
  		$("#search").click(function() {
  			if($("#searchContext").val()==""||$("#searchContext").val()==" "||$("#searchContext").val()=="  "){
  				Materialize.toast('请输入搜索内容',400,'rounded') // int是Toast持续时间
  			}else{
  				sessionStorage.setItem("searchContext", $("#searchContext").val());
  				$("#searchForm").submit();
  			}
		});
  		$('.tooltipped').tooltip({delay: 50});
  		 
  		$("#checkrec").click(function(){$("html,body").animate({scrollTop: '1600px'}, 800);});
});

