<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="js/jquery.min.js"></script>

	<style>
		#head,#pagination,#list{width:97%;margin:10px auto;}
		#head>div{min-height:35px;border-bottom:1px solid #eee;margin-top:10px;}
		#head>div>div{margin-left:30px;}
		.active{background:#8c45c6;color:#fff!important;}
		#head strong{display:block;float:left;}
		#head a{
			display: block;
   			float: left;
   			padding: 5px;
   		}
   		#list ul li{
   			float:left;
   			margin:15px;
   			width:280px;
   			border:1px solid #eee;
   			padding:20px;
   		}
   		#list ul li img{
   			display: block;
		    margin: 0 auto;
   		}
   		#list ul li b{
   			display: block;
		    font-size: 20px;
		    margin-top: 10px;
		    margin-bottom: 20px;
   		}
   		#list ul li span{
   			display: block;
   			text-align: center;
   		}
   		#pagination{margin-top:15px;margin-bottom:15px;}
		.page1{float:left;line-height:30px;margin-left:55%;margin-right:50px;}
		select{height:30px;}
		.first{margin-right:10px;float:left;width:66px;height:30px;text-align:center;line-height:30px;border:1px solid #efefef;}
		.last{margin-right:10px;float:left;width:66px;height:30px;text-align:center;line-height:30px;border:1px solid #efefef;}
		.left{margin-right:10px;float:left;width:66px;height:30px;text-align:center;line-height:30px;border:1px solid #efefef;}
		.right{margin-right:10px;float:left;width:66px;height:30px;text-align:center;line-height:30px;border:1px solid #efefef;}
		.currPage{background:#F0F8FF;margin-right:10px;float:left;width:66px;height:30px;text-align:center;line-height:30px;border:1px solid #efefef;}
		#pagination input[type="text"]{
			width:66px;
			height:30px;
			text-align:center;
			line-height:30px;
		}
		#pagination input[type="button"]{
			width:36px;
			height:30px;
		}
	</style>
</head>
<body>
	<button id="search">查询</button>
	<div id="head">
			<div class="year clear">
				<strong>年份：</strong>
				<div class="con">
					<!-- <a href="#" class="active">2017年</a>
					<a href="#">2016年</a> -->
					 
				</div>		
			</div>
			<div class="platform clear">
				<strong>平台：</strong>
				<div class="con">
					<!-- <a href="#" class="active">全部</a> -->
					<!-- <a href="#">天猫</a>
					<a href="#">飞猪</a> -->
				</div>
			</div>
			<div class="date clear">
				<strong>日期：</strong>
				<div class="con">
					<!-- <a href="#" class="active">全部</a>
					<a href="#">06月18日</a>
					<a href="#">11月10日</a>
					<a href="#">11月11日</a>  -->
				</div>				
			</div>
			<div class="category clear">
				<strong>类目：</strong>
				<div class="con">
					<!-- <a href="#" class="active">全部</a>
					<a href="#">主会场</a>
					<a href="#">必抢</a>	 -->	 		
				</div>				
			</div>
			<div class="type clear">
				<strong>类型：</strong>
				<div class="con">
					<!-- <a href="#" class="active">全部</a>
					<a href="#">官方会场</a>
					<a href="#">单品</a>
					<a href="#">承接页</a>  -->
				</div>				
			</div>
		</div>
		<div id="pagination">
			<div class="page1">
	  			<span>共有<i></i>条，</span>
	  			<span>每页显示
	  				<select id="selectValue">
	  					<option id="pageCount" selected="selected">3</option>
	  					<option>5</option>
	  					<option>10</option>
	  				</select>
	  				条数据
	  			</span>
	  		</div>
	  		<div class="first">首页</div>			  		
	  		<div class="left">上一页</div>
	  		<div class="currPage">1</div>
	  		<div class="right">下一页</div>
	  		<div class="last">尾页</div>
	  		<input type="text" id="goPage">
	  		<input type="button" value="GO" id="goBtn">
		</div>
		<div id="list">
			<ul class="clear" id="ul1">
				<!-- <li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510399904269915.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li>
				<li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510397231144759.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li>
				<li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510399904269915.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li>
				<li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510397823338804.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li>
				<li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510397231144759.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li>
				<li>
					<a href="#">
						<img src="https://image.abujlb.com/slt/2017/11/11/1510397231144759.jpg"/>
						<b>理想天猫生活</b>
						<span>采集时间：2017-11-11 19:32:31</span>
					</a>					
				</li> -->
			</ul>
		</div>
		
</body>
</html>
<script>

var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

req1();
//req2();

function req1(){
	var url_b = basePath+"/ActMapController/ajax_1";
    $.ajax({
		type:"post",
		url:url_b,
		dataType:'json',
		data:{},
		success:function(res){
			//console.log(res.datas);
			var html = "";
			var html1 = '<a href="#" class="active">全部</a>';
			var html2 = '<a href="#" class="active">全部</a>';
			var html3 = '<a href="#" class="active">全部</a>';
			var html4 = '<a href="#" class="active">全部</a>';
			for(var i = 0;i < res.datas.year.length;i ++){
				html += '<a href="#">'+res.datas.year[i]+'</a>';				
			}
			$(".year div").html(html);
			$(".year a:first").addClass("active");			
			year_ini = $(".year a:first").text();
			for(var i = 0;i < res.datas.plat.length;i ++){
				html1 += '<a href="#">'+res.datas.plat[i]+'</a>';				
			}
			$(".platform div").html(html1);
			$(".platform a:first").addClass("active");
			for(var i = 0;i < res.datas.type.length;i ++){
				html2 += '<a href="#">'+res.datas.type[i]+'</a>';				
			}
			$(".type div").html(html2);
			$(".type a:first").addClass("active");
			for(var i = 0;i < res.datas.date.length;i ++){
				html3 += '<a href="#">'+res.datas.date[i]+'</a>';				
			}
			$(".date div").html(html3);
			$(".date a:first").addClass("active");
			for(var i = 0;i < res.datas.category.length;i ++){
				html4 += '<a href="#">'+res.datas.category[i]+'</a>';				
			}
			$(".category div").html(html4);
			$(".category a:first").addClass("active");
			req2();
		} 
	}) 
}

function req2(){
	//console.log($(".year a:first").text());
	var url_b = basePath+"/ActMapController/ajax_2";
    $.ajax({
		type:"post",
		url:url_b,
		dataType:'json',
		data:{"year":$(".year a:first").text()},
		success:function(res){
			/* var liHtml = '';
			for(var i = 0;i < res.length;i++){
				liHtml += '<li>'+
							'<a href="#">'+
							'<img src='+res[i].img+'>'+
							'<b>'+res[i].shop_name+'</b>'+
							'<span>采集时间：'+res[i].collect_time+'</span>'+
						'</a>'+			
					'</li>'
			}			
			$("#ul1").html(liHtml);  */
			$(".page1>span>i").text(res.length);
			//每页多少条
			var pageNum = $("#selectValue option:selected").val();	
			//总页数 ： 
			var lastPage =Math.ceil( res.length / pageNum ) ;
			//console.log(lastPage);
			//当前页
			var currPageNum = $(".currPage").text();
			
			//显示第一页的数据				
	        getData(res);
	        $(".right").click(function(){
				//下一页
				if( currPageNum >= lastPage ){
					alert("已经是最后一页");
					return;
				}else{
					currPageNum = Number(currPageNum) + 1;
					$(".currPage").text(currPageNum);
				}
				getData(res);
			})
	        
	        $(".left").click(function(){
				//上一页
				if( currPageNum <= 1){
					alert("已经是第一页");
					return;
				}else{
					currPageNum = Number(currPageNum) - 1;
					console.log(currPageNum);
					$(".currPage").text(currPageNum);
				}				
				getData(res);
			})
	        
	        $('#goPage').on('blur',function(){
				var goPage = $(this).val();
				$('#goBtn').click(function(){
					if(goPage>lastPage || goPage < 0){
						alert("没有更多数据了");
						$('#goPage').val("");
						return ;
					}
					currPageNum = goPage;
					getData(res);
					$(".currPage").text(currPageNum);
				})
			})
	        
	        
	        $(".last").click(function(){
				currPageNum = lastPage;
				getData(res);
				$(".currPage").text(currPageNum);
			})
	        
	        $(".first").click(function(){
				currPageNum = 1;
				getData(res);
				$(".currPage").text(currPageNum);
			})
		 	
			$("#selectValue").change(function(){
				$(".currPage").text(1);
				pageNum = $("#selectValue option:selected").val();
				//每页多少条
	            lastPage =  Math.ceil( res.length / pageNum ) ;
	            //console.log(lastPage);
	            currPageNum = $(".currPage").text();
	            getData(res);
	        });
			
	        
	        function getData(res){
	    		var liHtml = '';
	    		index = currPageNum;
	            for( var i = (index-1)*pageNum ; i < index*pageNum ; i++ ){
	            	if( i < res.length ){
	            		liHtml += '<li>'+
	    								'<a href="#">'+
	    								'<img src='+res[i].img+'>'+
	    								'<b>'+res[i].shop_name+'</b>'+
	    								'<span>采集时间：'+res[i].collect_time+'</span>'+
	    							'</a>'+			
	    						'</li>'
	            	}
	            }
	    		
	    		$("#ul1").html(liHtml);
	    	}
						
		} 
	}) 
}

	
	var data = [];
	$(".con").on("click","a",function(event){
		var target = $(event.target);
		target.addClass("active").siblings().removeClass("active");
        var url_b = basePath+"/ActMapController/ajax_2";
        
        /* console.log($(".year .active").text());
		console.log($(".platform .active").text());
		console.log($(".date .active").text());
		console.log($(".category .active").text());
		console.log($(".type .active").text()); */
		$.ajax({
			url:url_b,
			type:"post",
			dataType:"json",
			data:{"year":$(".year .active").text(),"platform":$(".platform .active").text(),"date":$(".date .active").text(),"category":$(".category .active").text(),"type":$(".type .active").text()}, 
			success:function(res){
				//console.log(res);
				$(".page1>span>i").text(res.length);
				//每页多少条
				var pageNum = $("#selectValue option:selected").val();	
				//总页数 ： 
				var lastPage =Math.ceil( res.length / pageNum ) ;
				//console.log(lastPage);
				//当前页
				var currPageNum = $(".currPage").text();
				
				//显示第一页的数据				
		        getData(res);
		        $(".right").click(function(){
					//下一页
					if( currPageNum >= lastPage ){
						alert("已经是最后一页");
						return;
					}else{
						currPageNum = Number(currPageNum) + 1;
						$(".currPage").text(currPageNum);
					}
					getData(res);
				})
		        
		        $(".left").click(function(){
					//上一页
					if( currPageNum <= 1){
						alert("已经是第一页");
						return;
					}else{
						currPageNum = Number(currPageNum) - 1;
						console.log(currPageNum);
						$(".currPage").text(currPageNum);
					}				
					getData(res);
				})
		        
		        $('#goPage').on('blur',function(){
					var goPage = $(this).val();
					$('#goBtn').click(function(){
						if(goPage>lastPage || goPage < 0){
							alert("没有更多数据了");
							$('#goPage').val("");
							return ;
						}
						currPageNum = goPage;
						getData(res);
						$(".currPage").text(currPageNum);
					})
				})
		        
		        
		        $(".last").click(function(){
					currPageNum = lastPage;
					getData(res);
					$(".currPage").text(currPageNum);
				})
		        
		        $(".first").click(function(){
					currPageNum = 1;
					getData(res);
					$(".currPage").text(currPageNum);
				})
			 	
				$("#selectValue").change(function(){
					$(".currPage").text(1);
					pageNum = $("#selectValue option:selected").val();
					//每页多少条
		            lastPage =  Math.ceil( res.length / pageNum ) ;
		            //console.log(lastPage);
		            currPageNum = $(".currPage").text();
		            getData(res);
		        });
				
		        
		        function getData(res){
		    		var liHtml = '';
		    		index = currPageNum;
		            for( var i = (index-1)*pageNum ; i < index*pageNum ; i++ ){
		            	if( i < res.length ){
		            		liHtml += '<li>'+
		    								'<a href="#">'+
		    								'<img src='+res[i].img+'>'+
		    								'<b>'+res[i].shop_name+'</b>'+
		    								'<span>采集时间：'+res[i].collect_time+'</span>'+
		    							'</a>'+			
		    						'</li>'
		            	}
		            }
		    		
		    		$("#ul1").html(liHtml);
		    	}
		        
		        
			}
		})
		
	})
	
	
	
	
</script>