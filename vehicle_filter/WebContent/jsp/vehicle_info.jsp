<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="javax.servlet.*,javax.servlet.http.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="jsp/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="jsp/css/style.css" />
<link rel="stylesheet" href="jsp/css/Pager.css" />

<title>站点信息</title>

<style>
#face {
	width: 1800px;
	height: 900px;
	margin: 20px 0 0 50px;
	background: #ffffff;
}

#faceul {
	margin: 0 0 0 2px;
	width: 1800px;
}

#faceul li {
	list-style: none;
	float: left;
	border: 1px solid #b4b4b4;
	margin: 5px 10px 5px 20px;
	height: 17%;
	width: 18%;
}

#faceul li b {
	display: block;
	margin: 10px 0 0 6px;
	height: 10%;
	width: 97%;;
}

#faceul li button {
	margin: -5px 0 0 5px;
	height: 5%;
	width: 97%;;
}

#faceul img {
	margin: 5px 0 0 5px;
	border: none;
	height: 200px;
	width: 315px;
}

.cl span a {
	margin: 0 0 0 80px;
	width: 500px;
	height: 40px;
	padding-top: 8px;
}

.cl .left {
	margin: 0 0 0 40%;
	width: 200px;
	height: 40px;
	padding-top: 8px;
}

.cl .right {
	width: 200px;
	height: 40px;
	padding-top: 8px;
}
</style>
</head>
<body>
	<input id="total" value=${totalPage } type="hidden" />
	<input id="current" value=${pageNumber } type="hidden" />
	<!-- main content -->
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l"> <a class="btn btn-primary radius"
			href="javascript:;" onclick="javascript:modaldemo()">车辆类型：${type }
		</a>
		</span>
		<button class="btn btn-primary-outline radius left" id="leftbutton"
			onclick="pageChange(${pageNumber-1 })">上一页</button>
		<button class="btn btn-primary-outline radius right" id="rightbutton"
			onclick="pageChange(${pageNumber+1 })">下一页</button>
	</div>
	<div id="face">

		<ul id="faceul">
			<c:forEach items="${infos}" var="item">
				<!--/photo/${item.outputPicPath } -->
				<li><img src="/images/${item.outputPicPath } " class="img"
					id="img" title="G:\VEHICLE\ ${item.outputPicPath }"
					onerror="this.src='jsp/img/bg.jpg'" onclick="imageOnclick(this.src)"></img><b>
						车牌号:${item.plate }</b> <input id="outputPicPath${item.id }"
					value="${item.outputPicPath }" type="hidden" />
					<button onclick="deleteVehicle(${item.id })">删除</button></li>
			</c:forEach>
		</ul>
	</div>
	<!-- 打开查找条件页面 -->
	<div id="modal-demo" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content radius">
				<div class="modal-header">
					<h3 class="modal-title">请选择对应品牌</h3>
					<a class="close" data-dismiss="modal" aria-hidden="true"
						href="javascript:void();">×</a>
				</div>
				<div class="modal-body">
					<select id="brand" onchange="querySubBrand()">
						<option value="">--请选择--</option>
						
					</select> <select id="subbrand" onchange="queryIssueYear()">
						<option value="">--请选择--</option>
						
					</select> <select id="issueyear">
						<option value="">--请选择--</option>
						
					</select>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" onclick = "search()">确定</button>
					<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 放大图片 -->
	<div id="modal-scale" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"  >
		<div class="modal-dialog " style="width:1000px;">
			<div class="modal-content radius">
				<div class="modal-header">
					<h3 class="modal-title">查看大图</h3>
					<a class="close" data-dismiss="modal" aria-hidden="true"
						href="javascript:void();">×</a>
				</div>
				<div class="modal-body">
					<img  class="img" style="border:none;height:750px;width:965px" 
					id="big_img" title="" data-dismiss="modal" aria-hidden="true"
					 ></img>
				</div>
				<div class="modal-footer">
					
					<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="jsp/js/jquery.min.js"></script>
	<script type="text/javascript" src="jsp/js/H-ui.min.js"></script>
	<script type="text/javascript">
	window.onload = function(){
		//上一页下一页按钮变灰
        var current = $("#current").val();
        var total = $("#total").val();
        if(current == 1){
        	$("#leftbutton").addClass("disabled");
        }
        
        if(current == total){
        	$("#rightbutton").addClass("disabled");
        }  
        
    };
    //根据具体品牌子品牌和年款查询
    function search(){
    	
    	var select_subbrand = $("#subbrand");
    	var select_brand = $("#brand");
    	var select_issueyear = $("#issueyear");
    	
    	var vehicleBrand = select_brand.val();
    	var vehicleSubBrand = select_subbrand.val();
    	var vehicleIssueyear = select_issueyear.val();
    	
    	if(vehicleBrand == ""||vehicleSubBrand==""||vehicleIssueyear==""){
    		alert("请选择具体车型!");
    		return;
    	}
    	
    	$.ajax({
			type: 'POST',
			url: './queryByVehicleBrandAndVehicleSubBrandAndVehicleIssueyear',	
			data:{
				vehicleBrand:vehicleBrand,
				vehicleSubBrand:vehicleSubBrand,
				vehicleIssueyear:vehicleIssueyear
			},
			success: function(data){
				var data2 =eval("("+data+")");
				var pageNumber =parseInt(data2["pageNumber"]);
				window.location.href = "./pageChange?pageNumber=" + pageNumber;
			},
			error:function(data) {
				alert("加载错误");
			},
		});
    	
    };
    //查找子品牌
    function querySubBrand(){
    	var select_subbrand = $("#subbrand");
    	var select_brand = $("#brand");
    	var vehicleBrand = select_brand.val();
    	$.ajax({
			type: 'POST',
			url: './queryVehicleSubBrand',	
			data:{
				vehicleBrand:vehicleBrand
			},
			success: function(data){
				if(data != null && data != ""){
					select_subbrand.empty();
					var data2 =eval("("+data+")");
					var list = data2["vehicleSubBrandList"];
					select_subbrand.append("<option value=''>--请选择--</option>");
					for(var temp in list){
						select_subbrand.append("<option value='"+list[temp]+"'>"+list[temp]+"</option>");  //为Select追加一个Option(下拉项) 
					}
					
				}
				else{
					alert("车品牌加载失败");
				}
				
			},
			error:function(data) {
				alert("加载错误");
			},
		});
    };
    //查找子品牌下的年款
    function queryIssueYear(){
    	var select_subbrand = $("#subbrand");
    	var select_brand = $("#brand");
    	var select_issueyear = $("#issueyear");
    	var vehicleBrand = select_brand.val();
    	var vehicleSubBrand = select_subbrand.val();
    	$.ajax({
			type: 'POST',
			url: './queryVehicleIssueYear',	
			data:{
				vehicleBrand:vehicleBrand,
				vehicleSubBrand:vehicleSubBrand
			},
			success: function(data){
				if(data != null && data != ""){
					select_issueyear.empty();
					var data2 =eval("("+data+")");
					var list = data2["vehicleIssueYearList"];
					select_issueyear.append("<option value=''>--请选择--</option>");
					for(var temp in list){
						select_issueyear.append("<option value='"+list[temp]+"'>"+list[temp]+"</option>");  //为Select追加一个Option(下拉项) 
					}
					
				}
				else{
					alert("车品牌加载失败");
				}
				
			},
			error:function(data) {
				alert("加载错误");
			},
		});
    };
    //点开查询的modal
    function modaldemo(){
    	var select_brand = $("#brand");
    	$.ajax({
			type: 'POST',
			url: './queryVehicleBrand',	
			
			success: function(data){
				if(data != null && data != ""){
					select_brand.empty();
					var data2 =eval("("+data+")");
					var list = data2["vehicleBrandList"];
					
					select_brand.append("<option value=''>--请选择--</option>");
					for(var temp in list){
						select_brand.append("<option value='"+list[temp]+"'>"+list[temp]+"</option>");  
					}
					
				}
				else{
					alert("车品牌加载失败");
				}
				
			},
			error:function(data) {
				alert("加载错误");
			},
		});
    	$("#modal-demo").modal("show")};
    	
	
    
    
    //翻页
		function pageChange(pageNum) {
			
			window.location.href = "./pageChange?pageNumber=" + pageNum;
		};
		//等待更改的函数
		function imageOnclick(src){
			
			
			$("#modal-scale").modal("show");
			$("#big_img").attr('src',src);
		};
		
		//删除一个具体的车的图片以及在数据库的存储
		function deleteVehicle(id){
			if(!window.confirm('你确定删除该车吗？')){
				return;
			};
			alert("该车的id为："+id);
			var path = $("#outputPicPath"+id).val();
			alert("图片路径为："+path);

			$.ajax({
				type: 'POST',
				url: './deleteVehicleById',	
				data:{
					id:id,
			        path:path,
				},
				success: function(data){
					if(data == "success"){
						alert("删除文件和数据库成功");
						location.reload();
					}
					else{
						alert("删除文件失败");
					}
					
				},
				error:function(data) {
					alert("加载错误");
				},
			});
		};
	</script>
	
</body>
</html>