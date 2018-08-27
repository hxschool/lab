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
.submit1{
background-color: rgb(153, 153, 153);border:0px;height: 30px;color: white;font-size: 15px;line-height: 30px;text-align: center;font-weight: 500;
}
</style>
</head>
<body>  
<form action="javascript:void(0)" method="post" id="form1" enctype="multipart/form-data">
<div class="div3">

    <div  style="font-size: 17px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;font-weight:900" >
        <img  src="img/xiaofuhao.png" style="width: 22px;height: 22px;margin-bottom: -5px">添加用户
    </div>

    <table class="table2">
        <tr>
            <td class="tdTop">用户序号 / Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="number" class="input1" name="custId" required="required"></td>
        </tr>   
        <tr>
            <td class="tdTop">用户头像 / headImg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="file" class="input1" name="file" style="border:1px solid rgb(169, 169, 169);"></td>
        </tr>   
        <tr>
            <td class="tdTop">用户姓名 / Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="custName" required="required"></td>
        </tr>   
        <tr>
            <td class="tdTop">用户密码 / user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="custPasswd" required="required"></td>
        </tr>   
         <tr>
            <td class="tdTop">用户电话  / Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="custPhone"></td>
        </tr>   
         <tr>
            <td class="tdTop">用户QQ / Tencent qq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="custQq"></td>
        </tr>   
        <tr>
            <td class="tdTop">用户介绍 / desc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="custDesc"></td>
        </tr>   
        <tr>
            <td class="tdTop">用户权限 / user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		    <td class="tdBottom">
			   <select name="custRoot" class="input1">
				    <option value="1" class="tdBottom">用户</option>
				    <option value="2" class="tdBottom">管理员</option>
			   </select>
			</td>
		</tr>   
    </table>
    
</div>
    <div class="bottom2" style="float:left;background-color:white;height:40px;width: 98%;">
          <div style="float: right;width:200px;height: 40px;margin-right: 50%;margin-bottom: 5px;position: relative;" >
          <div class="fenPage"><input type="submit" value="提交" class="submit1"></div>
          <div class="fenPage"><a href="javascript:void(0);" onclick="goBack()">返回</a></div>
          </div>
    </div>
</form>
<script type="text/javascript">

$("#form1").submit(function(e){
	var formData = new FormData($("#form1")[0]);  
    $.ajax({
		cache:  false,
		data : formData,
		dataType : 'json', 
		contentType: false,   
        processData: false,   
		success :  function(json){	
			if(json){
				alert("插入成功");
				$.ajax({
					cache:  false,
					success :  function(json){
					      $.ajax({
					    	    cache:  false,
					            type : "post",
					            url : "findAllCust.jsp",
					            async : false,
					            success : function(data) {
					                $("#htmlId").html(data);
					            }
					        });
					},
					type : "get",
					url : '<c:url value="CustomerServlet/findAllCust" />'  
				});
			}else{
				alert("插入失败,请检查用户编号是否重复！");
			}
		},
		type : "post",
		url : '<c:url value="CustomerServlet/addCustomer" />'  
	}); 
});
function goBack(){
	$.ajax({
		cache:  false,
		success :  function(json){
		      $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllCust.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="CustomerServlet/findAllCust" />'  
	});
}
	
</script>
</body>
</html>