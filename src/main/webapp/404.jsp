<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Error 404</title>
  <!-- Mobile specific metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- Force IE9 to render in normal mode -->
  <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
  <meta name="author" content="SuggeElson" />
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <meta name="application-name" content="sprFlat admin template" />
  <!-- Import google fonts - Heading first/ text second -->
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
  <meta name="msapplication-TileColor" content="#3399cc" />
</head>
<body class="error-page">
<div class="container animated fadeInDown">
  <h1 class="error-number">404</h1>
  <h1 class="text-center mb25">找不到页面</h1>
  <p class="text-center s24">程序员还没写这个页面</p>
  <div class="text-center mt25">
    <div class="btn-group">
      <a href="javascript: history.go(-1)" class="btn btn-default btn-lg"><i class="en-arrow-left8"></i>  返回</a>
      <a href="${pageContext.request.contextPath }" class="btn btn-default btn-lg"><i class="im-home"></i> 首页</a>
    </div>
  </div>
</div>
<!-- Javascripts -->
<!-- Load pace first -->
<script src="${pageContext.request.contextPath}/assets/plugins/core/pace/pace.min.js"></script>
<!-- Important javascript libs(put in all pages) -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.3.min.js"></script>
<script>
    window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-2.1.1.min.js">\x3C/script>')
</script>
<script>
    window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/libs/excanvas.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/libs/respond.min.js"></script>
<![endif]-->
<!-- Bootstrap plugins -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.js"></script>
</body>
</html>