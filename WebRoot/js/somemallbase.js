  	$(function(){
  		
  		
  		$("#scroll_top").click(function(){$("html,body").animate({scrollTop: '0px'}, 800);}); 
  		$("#scroll_top_min").click(function(){$("html,body").animate({scrollTop: '0px'}, 800);});
    	$("#updateusernamebtn")	.click(function(){
    		if($("#newname").val()==""){
    			Materialize.toast('输入不能为空',1500,'rounded') // int是Toast持续时间
    		}else{
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
				    	$("#newname").val("");
				    	Materialize.toast('修改成功',1500,'rounded') // int是Toast持续时间
				    }
    			});
    		}
    		
    	});
    	
    	
    	$("#updateemailbtn").click(
    		function(){
    			if($("#email").val()==""){
    				Materialize.toast('输入不能为空',1500,'rounded') // int是Toast持续时间
    			}else{
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
    					    	$("#email").val("");
    					    	Materialize.toast('修改成功',1500,'rounded') // int是Toast持续时间
    	    		}
    	    		});
    			}

    	});
  		
  		
  		$("#updatepwdbtn").click(
  			function(){
  				if($("#oldPwd").val()==""||$("#newPwd").val()==""){
  					Materialize.toast('输入不能为空',1500,'rounded') // int是Toast持续时间
  				}else if($("#oldPwd").val()==$("#newPwd").val()){
  					Materialize.toast('新旧密码不能相同',1500,'rounded') // int是Toast持续时间
  				}else{
  	  				$.ajax({
  	  					url : "user/pwdupdate.do",
  			    		type : "POST",
  			    		data : $("#pwdform").serialize(),
  			    		dataType : "text",
  			    		success:function(data){
  			    			if(data=='1'){
  			    				$("#oldPwd").val("");
  			    				$("#newPwd").val("");
  			    				Materialize.toast('修改成功',1500,'rounded') // int是Toast持续时间
  			    				
  			    			}else{
  			    				Materialize.toast('密码错误',1500,'rounded') // int是Toast持续时间
  			    			}
  			    		}
  	  				});
  					
  				}

  			}
  		);
  		
	});