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
    <form action="javascript:void(0)" method="post" id="form1" >
<div class="div3">

    <div  style="font-size: 17px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;font-weight:900" >
        <img  src="img/xiaofuhao.png" style="width: 22px;height: 22px;margin-bottom: -5px">添加实验室设备
    </div>

    <table class="table2">
        <tr>
            <td class="tdTop">设备编号 / number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="equId" required="required"></td>
        </tr> 
         <tr>
            <td class="tdTop">设备数量 / EquipmentImg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" class="input1" name="equCount" style="border:1px solid rgb(169, 169, 169);" required="required"></td>
        </tr>     
        <tr>
            <td class="tdTop">设备所属实验室 / EquipmentLabor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom"><input type="text" readonly="readonly" class="input1" name="laborId" value="${laboratory.labId}" required="required"></td>
        </tr>   
         <tr>
            <td class="tdTop">设备所属类别 / EquipmentType&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="tdBottom">
                <select name="etypeId" class="input1">
						<c:forEach items="${Funtypes}" var="Funtype">
						<option value="${Funtype.equtypeId}">编号:${Funtype.equtypeId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设备名:${Funtype.equtypeName}</option>
						</c:forEach>
				</select>
            </td>
        </tr>              
    </table>

</div>
    <div class="bottom2" style="float:left;background-color:white;height:40px;width: 98%;">
          <div style="float: right;width:200px;height: 40px;margin-right: 50%;margin-bottom: 5px;position: relative;" >
          <div class="fenPage"><input type="submit" value="提交" class="submit1"></div>
          <div class="fenPage"><a href="javascript:void(0);" onclick="goBack(${laboratory.labId})">返回</a></div>
          </div>
    </div>
        </form>
<script type="text/javascript">
$("#form1").submit(function(e){
	var labId="${laboratory.labId}";
	 $.ajax({
			cache:  false,
			data : $('#form1').serialize(),
			success :  function(json){	
				if(json){
					alert("插入成功");
					$.ajax({
						cache:  false,
						data : "labId="+labId,
						success :  function(json){
						      $.ajax({
						    	    cache:  false,
						            type : "post",
						            url : "findAllEquByLabId.jsp",
						            async : false,
						            success : function(data) {
						                $("#htmlId").html(data);
						            }
						        });
						},
						type : "get",
						url : '<c:url value="LaborAndEquServlet/findAllEquByLabId" />'  
					});
				}else{
					alert("插入失败,请检查院系编号是否重复！");
				}
			},
			type : "post",
			url : '<c:url value="LaborAndEquServlet/addEqu" />'  
		}); 
});
function goBack(labId){
	$.ajax({
		cache:  false,
		data : "labId="+labId,
		success :  function(json){
		      $.ajax({
		    	    cache:  false,
		            type : "post",
		            url : "findAllEquByLabId.jsp",
		            async : false,
		            success : function(data) {
		                $("#htmlId").html(data);
		            }
		        });
		},
		type : "get",
		url : '<c:url value="LaborAndEquServlet/findAllEquByLabId" />'  
	});
}
	
</script>
</body>
</html>