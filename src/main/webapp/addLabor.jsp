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
<div class="div3">

    <div  style="font-size: 17px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;font-weight:900" >
        <img  src="img/xiaofuhao.png" style="width: 22px;height: 22px;margin-bottom: -5px">添加实验室
    </div>
    <form action="laborServlet" method="post" id="form1">
    <table class="table2">
        <tr>
            <td class="tdTop">序号 / number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="labId"></td>
        </tr>   
        <tr>
            <td class="tdTop">房间号 / room&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="labRoom"></td>
        </tr>   
        <tr>
            <td class="tdTop">实验室名称 / name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="labName"></td>
        </tr>   
        <tr>
            <td class="tdTop">实验室功能 / use&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="labUse"></td>
        </tr>   
        <tr>
            <td class="tdTop">负责人 / user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="tdBottom"><select name="labUser" class="input1">
						<c:forEach items="${customers}" var="customer">
						<option value="${customer.custId}">${customer.custName}</option>
						</c:forEach>
				</select></td>
			</tr>   
        <tr>
            <td class="tdTop">院系 / department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><select name="labDepart" class="input1">
						<c:forEach items="${departs}" var="depart">
						<option value="${depart.departId}">${depart.departName}</option>
						</c:forEach>
				</select></td>
        </tr>                        
    </table>
    </form>
</div>
    <div class="bottom2" style="float:left;background-color:white;height:40px;width: 98%;">
          <div style="float: right;width:200px;height: 40px;margin-right: 50%;margin-bottom: 5px;position: relative;" >
          <div class="fenPage"><a href="#" onclick="insertLabor()">提交</a></div>
          <div class="fenPage"><a href="javascript:void(0);" onclick="goBack()">返回</a></div>
          </div>
    </div>
<script type="text/javascript">

function insertLabor(){
	var str;
    $.ajax({
		cache:  false,
		//contentType :  "application/json;charset=utf-8",	
		//dataType　: "json",
		data : $('#form1').serialize(),
		success :  function(json){	
			if(json){
				alert("插入成功");
				$.ajax({
					cache:  false,
					success :  function(json){
					      $.ajax({
					    	    cache:  false,
					            type : "post",
					            url : "findAllLaber.jsp",
					            async : false,
					            success : function(data) {
					                $("#htmlId").html(data);
					            }
					        });
					},
					type : "get",
					url : '<c:url value="LaborServlet/findAllLaber" />'  
				});
			}else{
				alert("插入失败,请检查房间号码是否重复！");
			}
		},
		type : "post",
		url : '<c:url value="LaborServlet/insertLabor" />'  
	}); 
}
function goBack(){
	$.ajax({
		cache:  false,
		success :  function(json){
		      $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllLaber.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="LaborServlet/findAllLaber" />'  
	});
}
	
</script>
</body>
</html>