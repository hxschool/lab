<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
            width: 100%;
            height:90%;
            text-align: left;
            font-size: 15px;
        }
        .div1{
            float: left;
            width: 48%;
            height: 45%;
            background-color: white;
            border-radius: 3px;
        }
        .table1{
            margin-left: 2%;
            margin-right: 2%;
            width: 96%;
            height: auto;
            border-bottom: 0px;
        }
        .table2{
            margin-left: 2%;
            margin-right: 2%;
            width: 96%;
            height: auto;
            border-collapse:collapse;
        }
        .span1{
            width: 10%;
            color: red;
        }
        .div2{
               float: left;
               margin-left: 2%;
               width: 48%;
               height: 45%;
               background-color: white;
               border-radius: 5px;
               float: left;
           }
        .div3{
            float: left;
            width: 98%;
            height: 75%;
            margin-top: 1%;
            background-color: white;
            border-radius: 5px;
            float: left;

        }
        .table1 tr:hover {
            background-color: #f3f5f7;
        }
        .table2 .table2Tr:hover {
            background-color: #f3f5f7;
        }
        .table2 tr:nth-child(odd){/*基数行颜色*/
                background-color:white;
            }
        .table2 tr:nth-child(even){/*偶数行颜色*/
            background-color:#f3f5f7;
        }
    </style>
</head>
<body>
<div class="div1">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
            欢迎【软件学院】&nbsp;&nbsp; ${loginCustomer.custName}&nbsp;&nbsp;老师进入系统
    </div>
    <table class="table1" cellspacing="0">
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
<!--     <tr>
        <td style="width: 40%;height: 40px;color: #318dcf">卫生检查次数</td>
        <td>【<span class="span1">1</span>】次</td>
    </tr>
    <tr>
        <td style="width: 40%;height: 40px;color: #318dcf">卫生检查分数排名</td>
        <td>【<span class="span1">1</span>】名</td>
    </tr> -->
</table>
</div>
<div class="div2">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
        常用文件
    </div>
    <table class="table1" cellspacing="0">
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
<div class="div3">

    <div  style="font-size: 15px;color:#ff8052;border-bottom: 1px solid #f1f2f3;margin-left: 2%;
            margin-right: 2%;height: 50px;line-height: 50px; width: 96%;" >
        <img  src="img/xiaofuhao.png" style="width: 20px;height: 20px;margin-bottom: -5px">我管理的实验室卫生情况
    </div>
    <table class="table2" cellspacing="0">
        <tr style="border-bottom: 1px solid #dedede;" >
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700;">序号</td>
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700">房间号</td>
            <td style="width: 20%;height: 40px;color: #000000;font-weight: 700">实验室名称</td>
            <td style="width: 15%;height: 40px;color: #000000;font-weight: 700">房间功能</td>
            <td style="width: 15%;height: 40px;color: #000000;font-weight: 700">负责人</td>
            <td style="width: 10%;height: 40px;color: #000000;font-weight: 700">院系</td>
        </tr>
        <c:forEach items="${loginLaboratorys }" var="laboratory" varStatus="status">
        <tr class="table2Tr" style="border-bottom: 1px solid #dedede;">
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
</body>
</html>