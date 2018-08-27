<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html id="htmlId">
<head lang="en">
    <script type="text/javascript"  src="js/jquery.js"></script>
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
}

.div3 {
	float: left;
	width: 98%;
	height: 700px;
	background-color: white;
	border-radius: 5px;
	float: left;
}

.table2 .table2Tr:hover {
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

.tdTop {
	width: 25%;
	height: 75px;
	color: rgb(153, 153, 153);
	font-weight: 400;
	text-align: right;
}

.tdBottom {
	width: 75%;
	height: 50px;
	font-weight: 400;
}

.input1 {
	height: 35px;
	width: 70%;
	color: rgb(85, 85, 85);
}
</style>
</head>
<body>
<div class="div3">

    <div  style="font-size: 17px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;font-weight:900" >
        <img  src="img/xiaofuhao.png" style="width: 22px;height: 22px;margin-bottom: -5px">修改设备信息
    </div>
    <form action="laborServlet" method="post" id="form1" enctype="multipart/form-data">
    <input type="hidden" name="funtypeOid" value="${ fun_type.funtypeOid }">
    <table class="table2">
        <tr>
            <td class="tdTop">设备编号 / Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="funtypeId" value="${fun_type.funtypeId}"></td>
        </tr>   
        <tr>
            <td class="tdTop">设备图片 / FurnntypeImg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom">
           <img alt="" src="${fun_type.funtypeImg}" style="width: 35px;height: 35px;border-radius: 50%;margin-top: 2.5px">
            <input type="hidden" name="funtypeImg" value="${fun_type.funtypeImg}">
            <input type="file" class="input1" name="file"  value="${fun_type.funtypeImg}">             
            </td>
        </tr>   
        <tr>
            <td class="tdTop">设备名称 / FurntypeName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="funtypeName" value="${fun_type.funtypeName }"></td>
        </tr>   
    </table>
    </form>
</div>
    <div class="bottom2" style="float:left;background-color:white;height:40px;width: 98%;">
          <div style="float: right;width:200px;height: 40px;margin-right: 50%;margin-bottom: 5px;position: relative;" >
          <div class="fenPage"><a href="#" onclick="updateFun_type()">提交</a></div>
          <div class="fenPage"><a href="javascript:void(0);" onclick="goBack()">返回</a></div>
          </div>
    </div>
<script type="text/javascript">

function updateFun_type(){
	var formData = new FormData($("#form1")[0]);  
    $.ajax({
    	cache:  false,
		data : formData,
		dataType : 'json', 
		contentType: false,   
        processData: false,   
		success :  function(json){	
			if(json){
				alert("修改成功");
				$.ajax({
					cache:  false,
					success :  function(json){
					      $.ajax({
					    	    cache:  false,
					            type : "post",
					            url : "findAllFun_type.jsp",
					            async : false,
					            success : function(data) {
					                $("#htmlId").html(data);
					            }
					        });
					},
					type : "get",
					url : '<c:url value="Furn_typeServlet/findAllfun" />'  
				});
			}else{
				alert("插入失败,请检查房间号码是否重复！");
			}
		},
		type : "post",
		url : '<c:url value="Furn_typeServlet/updatefun_type" />'  
	}); 
}
function goBack(){
	$.ajax({
		cache:  false,
		success :  function(json){
		      $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllFun_type.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="Furn_typeServlet/findAllfun" />'  
	});
}
	
</script>
</body>
</html>