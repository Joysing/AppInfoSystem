<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>开发者平台</title>
	<!-- Mobile specific metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Force IE9 to render in normal mode -->
	<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
	<meta name="author" content="SuggeElson" />
	<meta name="description" content=""
	/>
	<meta name="keywords" content=""
	/>
	<meta name="application-name" content="sprFlat admin template" />
	<!-- Import google fonts - Heading first/ text second -->
	<link rel='stylesheet' type='text/css'>
	<!--[if lt IE 9]>

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
<body>
<!-- Start #header -->
<div id="header">
	<div class="container-fluid">
		<div class="navbar">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">
					<i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo">开发者平台</span>
					<span class="text-slogan"></span>
				</a>
			</div>
			<nav class="top-nav" role="navigation">
				<ul class="nav navbar-nav pull-left">
					<li id="toggle-sidebar-li">
						<a href="#" id="toggle-sidebar"><i class="en-arrow-left2"></i>
						</a>
					</li>
					<li>
						<a href="#" class="full-screen"><i class="fa-fullscreen"></i></a>
					</li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown">
						<a href="#" data-toggle="dropdown">
							<img class="user-avatar" src="${pageContext.request.contextPath}/assets/img/avatars/48.jpg" alt="SuggeElson">${devUserSession.devName }<strong> | 角色：开发者账户</strong></a>
						<ul class="dropdown-menu right" role="menu">
							<li><a href="profile.html"><i class="st-user"></i> Profile</a>
							</li>
							<li><a href="file.html"><i class="st-cloud"></i> Files</a>
							</li>
							<li><a href="#"><i class="st-settings"></i> Settings</a>
							</li>
							<li><a href="${pageContext.request.contextPath }/dev/doLogout"><i class="im-exit"></i>注销登录</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- Start .header-inner -->
</div>
<!-- End #header -->
<!-- Start #sidebar -->
<div id="sidebar">
	<!-- Start .sidebar-inner -->
	<div class="sidebar-inner">
		<!-- Start #sideNav -->
		<ul id="sideNav" class="nav nav-pills nav-stacked">
			<li class="top-search">
				<form>
					<input type="text" name="search" placeholder="Search ...">
					<button type="submit"><i class="ec-search s20"></i>
					</button>
				</form>
			</li>
			<li><a href="${pageContext.request.contextPath }/dev/main">后台首页 <i class="im-screen"></i></a>
			</li>
			<li>
				<a href="#">应用管理<i class="im-paragraph-justify"></i></a>
				<ul class="nav sub">
					<li><a href="${pageContext.request.contextPath }/dev/appInfo/list"><i class="ec-pencil2"></i> APP维护</a>
					</li>
					<li><a href="form-validation.html"><i class="im-checkbox-checked"></i> Form Validation</a>
					</li>
					<li><a href="form-wizard.html"><i class="im-wand"></i> Form Wizard</a>
					</li>
					<li><a href="wysiwyg.html"><i class="fa-pencil"></i> WYSIWYG editor</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- End #sideNav -->
	</div>
	<!-- End .sidebar-inner -->
</div>
<!-- End #sidebar -->