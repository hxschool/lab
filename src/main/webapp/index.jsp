<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html  id="htmlId">
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="css/indexStyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"  src="js/jquery.js"></script>
    <script type="text/javascript" src="js/Jquery-1.9.js"></script>
    <script type="text/javascript" src="js/indexJs.js"></script>
    <style type="text/css">
      .fristDiv{
       
            margin: 0px;
            padding: 0px;
            width: 100%;
            height:650px;
            text-align: left;
            font-size: 15px;
      }
      .fristDiv .fristdiv1{
            float: left;
            width: 48%;
            height: 45%;
            background-color: white;
            border-radius: 3px;
        }
        .fristDiv .fristtable1{
            margin-left: 2%;
            margin-right: 2%;
            width: 96%;
            height: auto;
            border-bottom: 0px;
        }
        .fristDiv .fristtable2{
            margin-left: 2%;
            margin-right: 2%;
            width: 96%;
            height: auto;
            border-collapse:collapse;
        }
        .fristDiv .fristspan1{
            width: 10%;
            color: red;
        }
        .fristDiv .fristdiv2{
               float: left;
               margin-left: 2%;
               width: 48%;
               height: 45%;
               background-color: white;
               border-radius: 5px;
               float: left;
           }
        .fristDiv .fristdiv3{
            float: left;
            width: 98%;
            height: 75%;
            margin-top: 1%;
            background-color: white;
            border-radius: 5px;
            float: left;

        }
        .fristDiv .fristtable1 tr:hover {
            background-color: #f3f5f7;
        }
        .fristDiv .fristtable2 .fristtable2Tr:hover {
            background-color: #f3f5f7;
        }
        .fristDiv .fristtable2 tr:nth-child(odd){/*基数行颜色*/
                background-color:white;
            }
        .fristDiv .fristtable2 tr:nth-child(even){/*偶数行颜色*/
            background-color:#f3f5f7;
        }
    </style>
</head>
<body onload="firstUrl()">
<div class="top1">
    <span class="span1">实验室管理系统</span>
    <span class="span2"  style="margin-left: 10px;margin-right: 40px"><a class="a1" href="javascript:void(0)" onclick="exitMethod()"><img class="img1" src="img/exit2.png"></a></span>
    <img class="head1" src="${loginCustomer.custImg }">
    <span class="span2" style="margin-left: 30px;margin-right: 5px"><a class="a1" href="#">${loginCustomer.custName }</a></span>
    <span class="span2"><a class="a1" href="javascript:void(0)" onclick="">系统说明</a></span>
    <img class="img2" src="img/top.png">
</div>
<div class="center1">
    <span class="spanUl">功能列表</span>
    <ul class="ul1" style="margin-top: 4px">
        <a  href="javascript:void(0)" onclick="firstUrl()"><li><img  src="img/home.png"><span>首页</span></li></a>
        <a href="#" onclick="divBlock()"> <li><img  src="img/sheZhi.png" ><span>实验室管理<img class="imgXz" src="img/xz.png" id="imgS1"></span></li></a>
        <div class="liDiv" style="display: none" id="liDiv1" >
            <ul class="liDivUl">
                <a href="javascript:void(0)" onclick="findAllLaber()" ><li class="nbLi" style="height: 40px;"><img  src="img/xs.png" style="margin-left: 30px"><span style="color: #000000;line-height: 40px">所有实验室</span></li></a>
                <a href="javascript:void(0)" onclick="findAllEqu()"><li class="nbLi" style="height: 40px;"><img  src="img/xs.png" style="margin-left: 30px"><span style="color: #000000;line-height: 40px">实验室设备管理</span></li></a>
                <a href="javascript:void(0)" onclick="findAllFurn()"><li class="nbLi" style="height: 40px;"><img  src="img/xs.png" style="margin-left: 30px"><span style="color: #000000;line-height: 40px">实验室家具管理</span></li></a>
                
            </ul>
        </div>
        <a href="#" onclick="divBlock2()"><li><img  src="img/sheZhi.png" ><span>实验室卫生管理<img class="imgXz" src="img/xz.png" id="imgS2"></span></li></a>
        <div class="liDiv" style="display: none" id="liDiv2" >
            <ul class="liDivUl">
					<a href="javascript:void(0)" onclick="addSan(${loginCustomer.custRoot})"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">实验室卫生评分</span></li></a>
					<a href="javascript:void(0)" onclick="findAllSan()"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">实验室卫生总览</span></li></a>
				</ul>
        </div>
        <a href="#" onclick="divBlock3()"><li><img  src="img/sheZhi.png"><span>系统设置<img class="imgXz"  src="img/xz.png" id="imgS3"></span></li></a>
        <div class="liDiv" style="display: none" id="liDiv3" >
            <ul class="liDivUl">
					<a href="javascript:void(0)" onclick="findAllCust(${loginCustomer.custRoot})"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">人员管理</span></li></a>
					<a href="javascript:void(0)" onclick="findAllDepart()"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">学院管理</span></li></a>
					<a href="javascript:void(0)" onclick="findAllEqui_type()"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">设备类别管理</span></li></a>
					<a href="javascript:void(0)" onclick="findAllFun_type()"><li
						class="nbLi" style="height: 40px;"><img src="img/xs.png"
							style="margin-left: 30px"><span
							style="color: #000000; line-height: 40px">家具类别管理</span></li></a>

				</ul>
        </div>
        <a href="javascript:void(0)" onclick="exitMethod()"><li><img  src="img/exit.png"><span>退出</span></li></a>
        <br>
    </ul>
</div>
<div class="bottom1" id="bottom1">
<!-- 
           暂时留着以防之后的错误
<div class="fristDiv">
<div class="fristdiv1">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
            欢迎【软件学院】&nbsp;&nbsp; ${loginCustomer.custName}&nbsp;&nbsp;老师进入系统
    </div>
    <table class="fristtable1" cellspacing="0">
    <tr>
        <td style="width: 40%;height: 40px;color: #318dcf">使用者身份</td>
        <td style="color: red">
        <c:if test="${loginCustomer.custRoot eq 1}">
        用户
        </c:if>
        <c:if test="${loginCustomer.custRoot eq 2}">
   实验室管理员
        </c:if>
        </td>
    </tr>
      <tr>
        <td style="width: 40%;height: 40px;color: #318dcf">用户电话</td>
        <td>${loginCustomer.custPhone}</td>
    </tr>
    <tr>
        <td style="width: 40%;height: 40px;color: #318dcf">用户</td>
        <td>${loginCustomer.custQq}</td>
    </tr>
</table>
</div>
<div class="fristdiv2">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
        常用文件
    </div>
    <table class="fristtable1" cellspacing="0">
        <tr>
            <td style="width: 40%;height: 40px;color: #318dcf">实验室卫生管理评分准则(暂不支持)</td>
            <td style="color: #000000;text-align: right">2018-4-7</td>
        </tr>
        <tr>
            <td style="width: 40%;height: 40px;color: #318dcf">实验室系统说明(暂不支持)</td>
            <td style="color: #000000;text-align: right">2018-4-7</td>
        </tr>
        <tr>
            <td style="width: 40%;height: 40px;color: #318dcf">帮助文档(暂不支持)</td>
            <td style="color: #000000;text-align: right">2018-4-7</td>
        </tr>
    </table>
</div>
<div class="fristdiv3">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
        <img  src="img/xiaofuhao.png" style="width: 20px;height: 20px;margin-bottom: -5px">我管理的实验室卫生情况
    </div>
    <table class="fristtable2" cellspacing="0">
        <tr style="border-bottom: 1px solid #dedede;" >
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700;">序号</td>
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700">房间号ASD</td>
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700">实验室名称</td>
            <td style="width: 15%;height: 40px;color: #000000;font-weight: 700">房间功能</td>
            <td style="width: 15%;height: 40px;color: #000000;font-weight: 700">负责人</td>
            <td style="width: 10%;height: 40px;color: #000000;font-weight: 700">院系</td>
        </tr>
        <c:forEach items="${loginLaboratorys }" var="laboratory" varStatus="status">
        <tr class="fristtable2Tr" style="border-bottom: 1px solid #dedede;">
					<td style="width: 10%; height: 40px; color: #000000;">${status.count}</td>
					<td style="width: 15%; height: 40px; color: #318dcf;">${laboratory.labRoom}</td>
					<td style="width: 15%; height: 40px; color: #318dcf;">${laboratory.labName }</td>
					<td style="width: 15%; height: 40px; color: #000000;">${laboratory.labUse }</td>
					<td style="width: 15%; height: 40px; color: #000000;">${laboratory.labUser }</td>
					<td style="width: 10%; height: 40px; color: #000000;">软件学院</td>
        </tr>
        </c:forEach>
    </table>
</div>
</div>
 -->
</div>
<script type="text/javascript">
function explain(){
}
function  findAllLaber(){			
	$.ajax({
		cache:  false,
		data : 'currentPage='+0,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllLaber.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="LaborServlet/findAllLaber" />'  
	});
}
function  findAllCust(custRoot){
	if(custRoot=="1"){
		alert("对不起,您的权限不够！");
	}else {
		$.ajax({
			cache:  false,
			success :  function(json){
				document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllCust.jsp" width="100%" height="100%"></object>';
			},
			type : "get",
			url : '<c:url value="CustomerServlet/findAllCust" />'  
		});	
	}	
}
function findAllDepart(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllDepart.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="DepartServlet/findAllDepart" />'  
	});
}
function findAllEqu(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllEqu.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="LaborAndEquServlet/findAllEqu" />'  
	});
}
function findAllFurn(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllFun.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="LaborAndFunServlet/findAllFun" />'  
	});
}

function findAllEqui_type(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllEqu_type.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="Equi_typeServlet/findAllEqu" />'  
	});
}
function findAllFun_type(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllFun_type.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="Furn_typeServlet/findAllfun" />'  
	});
}
function addSan(custRoot){
	if(custRoot=="1"){
		alert("对不起,您的权限不够！");
	}else {
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="addSan.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="SanitationServlet/addSanBeforeSelect" />'  
	});
	}
}
function findAllSan(){
	$.ajax({
		cache:  false,
		success :  function(json){
			document.getElementById("bottom1").innerHTML = '<object type="text/html" data="findAllSan.jsp" width="100%" height="100%"></object>';
		},
		type : "get",
		url : '<c:url value="SanitationServlet/findAllSan" />'  
	});
}
function exitMethod(){
	$.ajax({
		cache:  false,
		success :  function(json){
			window.location.href="login.jsp";
		},
		type : "get",
		url : '<c:url value="loginServlet/exitMethod" />'  
	});
}
</script>
</body>
</html>