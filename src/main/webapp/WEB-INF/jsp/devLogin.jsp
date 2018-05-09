<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>G开发者平台 入口</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/statics/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="${pageContext.request.contextPath}/statics/nprogress.css"
	rel="stylesheet">
<!-- Animate.css -->
<link
	href="${pageContext.request.contextPath}/statics/css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/statics/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form action="${pageContext.request.contextPath}/dev/doLogin"
						method="post">
						<h1>APP开发者平台登录</h1>
						<div>
							<input type="text" class="form-control" name="devCode"
								placeholder="请输入用户名" required="" />
						</div>
						<div>
							<input type="password" class="form-control" name="devPassword"
								placeholder="请输入密码" required="" />
						</div>
						<span>${error }</span>
						<div>
							<input type="submit" value="登录" class="btn btn-default submit">
							<input type="reset" value="重填" class="btn btn-default submit">
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								 <a href="${pageContext.request.contextPath}" class="to_register">返回入口 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<p>©2017 All Rights Reserved.</p>
							</div>
						</div>
					</form>
				</section>
			</div>

		</div>
	</div>
</body>
</html>


