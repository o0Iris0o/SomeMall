<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
	<meta charset="UTF-8">
  </head>
  <body>
    <div  class="fixed-action-btn hide-on-med-and-down" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large waves-effect waves-light red lighten-1 z-depth-5">
        <i class="large material-icons">games</i>
    </a>
    <ul>
        <li>
        	<a href="user/toCollect.do" class="btn-floating tooltipped waves-effect waves-light red  z-depth-5" data-position="left" data-delay="50" data-tooltip="我的收藏">
        		<i class="material-icons">star</i>
        	</a>
        </li>
        <li>
        	<a href="user/tocart.do" class="btn-floating tooltipped waves-effect waves-light orange z-depth-5" data-position="left" data-delay="50" data-tooltip="购物车">
        		<i class="material-icons">shopping_cart</i>
        	</a>
        </li>
        <li>
        	<a href="user/toorder.do" class="btn-floating tooltipped waves-effect waves-light yellow darken-1 z-depth-5" data-position="left" data-delay="50" data-tooltip="我的订单">
        		<i class="material-icons">assignment</i>
        	</a>
        </li>
        <li>
            <a data-activates="slide-out" class="button-collapse btn-floating tooltipped waves-effect waves-light green z-depth-5" data-position="left" data-delay="50" data-tooltip="个人信息">
                <i class="material-icons">perm_identity</i>
            </a>
        </li>
        <li>
        	<a id="scroll_top" class="btn-floating tooltipped waves-effect waves-light blue z-depth-5" data-position="left" data-delay="50" data-tooltip="回到顶部">
        		<i class="material-icons">publish</i>
        	</a>
        </li>
    </ul>
    
    
</div>
	<div id="scroll_top_min" class="fixed-action-btn hide-on-large-only" style="bottom:5px; right: 5px;">
	    <a class="btn-floating btn-large waves-effect waves-light red lighten-2 z-depth-5">
	        <i class="large material-icons">publish</i>
	    </a>
	    <!-- <li><a href="#top" class="btn-floating tooltipped waves-effect waves-light blue z-depth-5" data-position="left" data-delay="50" data-tooltip="回到顶部"><i class="material-icons">publish</i></a></li> -->
	   
	    
	</div>

  </body>
</html>


