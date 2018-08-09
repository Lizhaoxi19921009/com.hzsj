<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="jsp/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="jsp/css/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="jsp/css/style.css" />
<link rel="stylesheet" href="jsp/css/Pager.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>站点信息</title>
</head>
<body>
	<!-- main content -->
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a class="btn btn-primary radius"
				href="javascript:;">车辆类型：${type } </a>
			</span>

		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table_info">
				<thead>
					<tr class="text-c">
						<th width="30">车辆ID</th>
						<th width="100">目标类型</th>
						<th width="130">品牌</th>
						<th width="100">子品牌</th>
						<th width="100">年款</th>
						<th width="100">吨位，排放</th>
						<th width="100">车牌号</th>
						<th width="100">车牌类别</th>
						<th width="100">置信度</th>
						<th width="100">源图数据来源设备的编码</th>
						<th width="100">源图位置</th>
						<th width="100">目标图片保存位置</th>
						<th width="100">车辆特征值</th>
						<th width="500">图片显示</th>
						<th width="50">操作</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${infos }" var="vehicle">
						<tr class="text-c" style="height:300px">
							<td>${vehicle.id}</td>
							<td>${vehicle.picType}</td>
							<td>${vehicle.vehicleBrand}</td>
							<td>${vehicle.vehicleSubBrand}</td>
							<td>${vehicle.vehicleIssueYear}</td>
							<td>${vehicle.freightTon}</td>
							<td>${vehicle.plate}</td>
							<td>${vehicle.plateType}</td>
							<td>${vehicle.confidence}</td>
							<td>${vehicle.sourcePicDeviceCode}</td>
							<td>${vehicle.sourcePicPath}</td>
							<td>${vehicle.outputPicPath}</td>
							<td>${vehicle.feature}</td>
							<td></td>
							<td class="td-manage"><a style="text-decoration: none"
								onClick="" href="javascript:;" title="删除"><i
									class="Hui-iconfont">&#xe609;</i></a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<div id="pager"></div>
			<div id="page">
				<button class="btn btn-primary-outline radius" onclick="pageChange(${pageNumber-1 })">上一页</button>
				<button class="btn btn-primary-outline radius" id="numberButton">${pageNumber }</button>
				<button class="btn btn-primary-outline radius" onclick="pageChange(${pageNumber+1 })">下一页</button>
				


			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript">
	function pageChange(pageNum){
		alert(pageNum);
		window.location.href = "./pageChange?pageNumber="+pageNum;
	}
	</script>
</body>
</html>