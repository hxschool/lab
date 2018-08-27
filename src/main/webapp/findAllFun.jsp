<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html id="htmlId">
<head lang="en">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/Jquery-1.9.js"></script>
<script type="text/javascript" src="js/indexJs.js"></script>
<meta charset="UTF-8">
<title></title>
<style>
* {
	margin: 0px;
	padding: 0px;
	width: 100%;
	text-align: left;
	font-size: 15px;
}

.table2 {
	margin-left: 2%;
	margin-right: 2%;
	width: 96%;
	height: auto;
	border-collapse: collapse;
}

.div3 {
	float: left;
	width: 98%;
	height: 750px;
	background-color: white;
	border-radius: 5px;
	float: left;
}

.table2 .table2Tr:hover {
	background-color: #f3f5f7;
}

.table2 tr:nth-child(odd) { /*基数行颜色*/
	background-color: white;
}

.table2 tr:nth-child(even) { /*偶数行颜色*/
	background-color: #f3f5f7;
}

.buttonImg {
	height: 25.9px;
	width: 110px;
	float: left;
	margin-left: 1px;
	text-align: center;
	background-color: rgb(153, 153, 153);
	line-height: 25.9px;
	font-size: 14px;
	color: white;
}

.bottom2 {
	background-color: white;
}

.fenPage {
	height: 30px;
	font-size: 14px;
	background-color: rgb(153, 153, 153);
	line-height: 30px;
	width: 50px;
	color: white;
	float: right;
	margin-right: 10px;
	text-align: center;
}

a {
	text-decoration: none;
	color: white;
	font-weight: 500;
}
</style>
</head>
<body id="body1">
	<div class="div3">

		<div
			style="font-size: 17px; color: #ff8052; border-bottom: 1px solid #f1f2f3; margin-left: 2%; margin-right: 2%; height: 50px; line-height: 50px; width: 96%; font-weight: 900">
			<img src="img/xiaofuhao.png"
				style="width: 22px; height: 22px; margin-bottom: -5px">实验室家具总览表
		</div>
		<table class="table2">
			<tr style="border-bottom: 1px solid #dedede;">
				<td
					style="width: 15%; height: 40px; color: #000000; font-weight: 700">实验室编号</td>
				<td
					style="width: 20%; height: 40px; color: #000000; font-weight: 700">实验室名称</td>
				<td
					style="width: 15%; height: 40px; color: #000000; font-weight: 700">实验室房间</td>
				<td
					style="width: 15%; height: 40px; color: #000000; font-weight: 700">家具类型数</td>
				<td
					style="width: 15%; height: 40px; color: #000000; font-weight: 700">家具总数</td>		
				<td
					style="width: 20%; height: 40px; color: #000000; font-weight: 700">实验室操作</td>
			</tr>
			<c:forEach items="${laborAndEqurments }" var="laborAndEqurment" varStatus="status">
				<tr class="table2Tr" style="border-bottom: 1px solid #dedede;">
					<td style="width: 15%; height: 40px; color: #000000;">${status.count+(page.currentPage*15)}</td>
					<td style="width: 20%; height: 40px; color: #318dcf;">${laborAndEqurment.labName}</td>
					<td style="width: 15%; height: 40px; color: #318dcf;">${laborAndEqurment.labRoom}</td>
					<td style="width: 15%; height: 40px; color: red;">${laborAndEqurment.count}</td>
					<td style="width: 15%; height: 40px; color: red;">${laborAndEqurment.typeCount }</td>
					<td
						style="width: 20%; height: 40px; color: #000000; font-weight: 700;">
						<a href="javascript:void(0)" onclick="information(${laborAndEqurment.labId})"><div
							class="buttonImg">详细信息/修改</div></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
     <!-- 分页 -->
	<div class="bottom2"
		style="float: left; background-color: white; height: 40px; width: 98%;">
		<label style="width: 100px; margin-left: 2%">总记录${page.totalCounts }条，当前是${page.currentPage+1 }/${page.totalPages}页</label>
		<div
			style="float: right; width: 200px; height: 30px; margin-right: 44%; margin-bottom: 5px; position: relative;">
			<a href="javascript:void(0)" onclick="fenpage(${page.currentPage+1},${page.totalPages})"><div class="fenPage" >下一页</div></a>
			<a href="javascript:void(0)" onclick="fenpage(0,1)"><div class="fenPage" >首页</div></a>
			<a href="javascript:void(0)" onclick="fenpage(${page.currentPage-1},${page.totalPages})"><div class="fenPage" >上一页</div></a>
		</div>
	</div>
	<script type="text/javascript">
function information(labId){
	$.ajax({
		cache:  false,
		data : 'labId='+labId,
		success :  function(json){
			 $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllFunByLabId.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="LaborAndFunServlet/findAllFunByLabId" />'  
	});
}
function fenpage(currentPage,totalPages) {
	if(currentPage<0){
		alert("已经是第一页了!");
		return;
	}else if(currentPage+1>totalPages){
		alert("已经数最后一页了!");
		return;
	}else{
	$.ajax({
		cache:  false,
		data : 'currentPage='+currentPage,
		success :  function(json){
			 $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllFun.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="LaborAndFunServlet/findAllFun" />'  
	});
	}
}
</script>
</body>
</html>