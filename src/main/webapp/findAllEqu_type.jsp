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
	width: 58.8px;
	background-color: #d5e3e6;
	float: left;
	margin-left: 1px;
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
				style="width: 22px; height: 22px; margin-bottom: -5px">所有设备种类信息
			<label
				style="font-size: 14px; float: right; border: 1px solid #f3f5f7; width: 85px; height: 35px; line-height: 35px; margin-top: 10px; color: white; text-align: center; background-color: rgb(153, 153, 153);">
				<a href="javascript:void(0)" onclick="addEqutype()">添加种类</a>
			</label>
		</div>
		<table class="table2">
			<tr style="border-bottom: 1px solid #dedede;">
				<td
					style="width: 25%; height: 40px; color: #000000; font-weight: 700">种类编号</td>
				<td
					style="width: 25%; height: 40px; color: #000000; font-weight: 700">种类图片</td>
				<td
					style="width: 25%; height: 40px; color: #000000; font-weight: 700">种类名称</td>
				<td
					style="width: 25%; height: 40px; color: #000000; font-weight: 700">实验室操作</td>
			</tr>
			<c:forEach items="${Equipment_types }" var="equipment_type">
				<tr class="table2Tr" style="border-bottom: 1px solid #dedede;">
					<td style="width: 25%; height: 40px; color: #000000;">${equipment_type.equtypeId}</td>
					<td style="width: 25%; height: 40px; color: #318dcf;"><img alt="" src="${equipment_type.equtypeImg}" style="width: 35px;height: 35px;border-radius: 50%;margin-top: 2.5px"></td>
					<td style="width: 25%; height: 40px; color: #318dcf;">${equipment_type.equtypeName }</td>
					<td
						style="width: 25%; height: 40px; color: #000000; font-weight: 700;">
						<a href="javascript:void(0)" onclick="updateEqui(${equipment_type.equtypeId})"><img
							class="buttonImg" src="img/update.png"></a> <a
						href="javascript:void(0)" onclick="deleteEqui(${equipment_type.equtypeId})"><img
							class="buttonImg" src="img/delete.png"></a>
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
function addEqutype(){
	$.ajax({
		cache:  false,
		async : false,
		success :  function(data){
			$("#htmlId").html(data);
		},
		type : "post",
		url : "addEquType.jsp"  
	});
}
function deleteEqui(equtypeId){
	$.ajax({
		cache:  false,
		data : 'equtypeId='+equtypeId,
		success :  function(json){
			if(json){
		      $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : '<c:url value="Equi_typeServlet/findAllEqu" />' ,
		            async : false,
		            success : function(data) {
		            	 $.ajax({
		 		    	    cache:  false,
		 		            type : "post",
		 		            url : "findAllEqu_type.jsp",
		 		            async : false,
		 		            success : function(data) {
		 		                $("#htmlId").html(data);
		 		                alert("删除成功！");
		 		            }
		 		        });
		            }
		        });
			}else{
				alert("删除失败！");
			}
		},
		type : "get",
		url : '<c:url value="Equi_typeServlet/deleteEqu_type" />'  
	});
}
function updateEqui(equtypeId){
	$.ajax({
		cache:  false,
		data : 'equtypeId='+equtypeId,
		success :  function(json){
			 $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "updateEquType.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="Equi_typeServlet/updateEqu_typeBeforeSelect" />'  
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
		            url : "findAllEqu_type.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="LaborAndEquServlet/findAllEqu" />'  
	});
	}
}
</script>
</body>
</html>