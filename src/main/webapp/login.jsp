<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="no-js" id="htmlId">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<script src="script/jquery.easyui.min.js"></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
    <script type="text/javascript"  src="js/jquery.js"></script>
    <script type="text/javascript" src="js/Jquery-1.9.js"></script>
    <script type="text/javascript" src="js/indexJs.js"></script>
</head>
<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
				<img alt="" src="img/logo1.png" >
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>欢迎你</h3>
						<form action="javascript:void(0)" name="f" method="post" id="form1">
							<div class="input_outer">
								<span class="u_user"></span>
								<input autocomplete="off" id="custId" name="custId" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户" required="required">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input required="required" id="custPass" name="custPasswd" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2"><input type="submit" class="act-but submit" style="color: #FFFFFF;border:0px;width:330px;" value="提交" id="submit1"></input></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/TweenLite.min.js"></script>
		<script src="js/EasePack.min.js"></script>
		<script src="js/rAF.js"></script>
		<script src="js/demo-1.js"></script>
	<script type="text/javascript">
			$("#form1").submit(function(e){
			  $.ajax({
				cache : false,
				data : $('#form1').serialize(),
				success : function(json) {
					if (json) {
						location.href="index.jsp";
					} else {
						alert("登陆失败,请检查用户名密码是否错误！");
					}
				},
				type : "post",
				url : '<c:url value="loginServlet/login" />'
			});
		}); 
	</script>
</body>
</html>