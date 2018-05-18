<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>后台管理系统</title>
  <!-- Mobile specific metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- Force IE9 to render in normal mode -->
  <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
  <meta name="author" content="SuggeElson" />
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <meta name="application-name" content="sprFlat admin template" />
  <!-- Import google fonts - Heading first/ text second -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
  <!--[if lt IE 9]>
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
  <link href="http://fonts.googleapis.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
  <link href="http://fonts.googleapis.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
  <![endif]-->
  <!-- Css files -->
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/css/icons.css" rel="stylesheet" />
  <!-- jQueryUI -->
  <link href="${pageContext.request.contextPath}/assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
  <!-- Bootstrap stylesheets (included template modifications) -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
  <!-- Plugins stylesheets (all plugin custom css) -->
  <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" />
  <!-- Main stylesheets (template main css file) -->
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" />
  <!-- Custom stylesheets ( Put your own changes here ) -->
  <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-57-precomposed.png">
  <link rel="icon" href="${pageContext.request.contextPath}/assets/img/ico/favicon.ico" type="image/png">
  <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
  <meta name="msapplication-TileColor" content="#3399cc" />
</head>
<body class="login-page">
<!-- Start #login -->
<div id="login" class="animated bounceIn">
  <h1>APP信息管理平台</h1>
  <!-- Start .login-wrapper -->
  <div class="login-wrapper">
    <ul id="myTab" class="nav nav-tabs nav-justified bn">
      <li>
        <a href="#log-in" data-toggle="tab">开发者登录</a>
      </li>
      <li class="">
        <a href="#register" data-toggle="tab">后台管理登录</a>
      </li>
    </ul>
    <div id="myTabContent" class="tab-content bn">
      <div class="tab-pane fade active in" id="log-in">
        <form class="form-horizontal mt10" action="${pageContext.request.contextPath}/dev/doLogin" method="post" id="login-form" role="form">
          <div class="form-group">
            <div class="col-lg-12">
              <input type="text" name="devCode" class="form-control left-icon" value="test001" placeholder="开发者账号">
              <i class="ec-user s16 left-input-icon"></i>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-12">
              <input type="password" name="devPassword" class="form-control left-icon" value="123456" placeholder="开发者密码">
              <i class="ec-locked s16 left-input-icon"></i>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-12">
              <!-- col-lg-12 start here -->
              <button class="btn btn-success btn-block" type="submit">登录</button>
            </div>
            <!-- col-lg-12 end here -->
          </div>
        </form>
      </div>
      <div class="tab-pane fade" id="register">
        <form class="form-horizontal mt20" action="${pageContext.request.contextPath}/user/doLogin" method="post" role="form">
          <div class="form-group">
            <div class="col-lg-12">
              <input type="text" name="userCode" class="form-control left-icon" value="admin" placeholder="管理员账号">
              <i class="ec-user s16 left-input-icon"></i>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-12">
              <input type="password" name="userPassword" class="form-control left-icon" value="123456" placeholder="管理员密码">
              <i class="ec-locked s16 left-input-icon"></i>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-12">
              <!-- col-lg-12 start here -->
              <button class="btn btn-success btn-block" type="submit">登录</button>
            </div>
            <!-- col-lg-12 end here -->
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- End #.login-wrapper -->
</div>
<!-- End #login -->
<!-- Javascripts -->
<!-- Load pace first -->
<script src="${pageContext.request.contextPath}/assets/plugins/core/pace/pace.min.js"></script>
<!-- Important javascript libs(put in all pages) -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.3.min.js"></script>
<script>
    window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-2.1.1.min.js">\x3C/script>')
</script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
    window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/libs/excanvas.min.js"></script>
<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/libs/respond.min.js"></script>
<![endif]-->
<!-- Bootstrap plugins -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.js"></script>
<!-- Form plugins -->
<script src="${pageContext.request.contextPath}/assets/plugins/forms/icheck/jquery.icheck.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/forms/validation/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/forms/validation/additional-methods.min.js"></script>
<!-- Init plugins olny for this page -->
<script src="${pageContext.request.contextPath}/assets/js/pages/login.js"></script>
</body>
</html>