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
					<li class="dropdown">
						<a href="#" data-toggle="dropdown"><i class="ec-cog"></i><span class="notification">10</span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><i class="en-database"></i> Database <span class="notification">3</span></a>
							</li>
							<li><a href="#"><i class="st-cube"></i> Packages <span class="notification blue">17</span></a>
							</li>
							<li><a href="#"><i class="st-health"></i> Disconnects <span class="notification yellow">1</span></a>
							</li>
							<li><a href="#"><i class="im-images"></i> Images <span class="notification teal">320</span></a>
							</li>
							<li><a href="#"><i class="st-users"></i> Users <span class="notification orange">2k</span></a>
							</li>
							<li><a href="#"><i class="st-meter"></i> Traffic <span class="notification magenta">2tb</span></a>
							</li>
							<li><a href="#"><i class="im-coin"></i> Finances <span class="notification pink">+3k</span></a>
							</li>
							<li><a href="#"><i class="st-folder"></i> Directories <span class="notification green">17</span></a>
							</li>
							<li><a href="#"><i class="st-bag"></i> Orders <span class="notification purple">12</span></a>
							</li>
							<li><a href="#"><i class="ec-contract"></i> Contracts <span class="notification dark">7</span></a>
							</li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown"><i class="ec-mail"></i><span class="notification">4</span></a>
						<ul class="dropdown-menu email" role="menu">
							<li class="mail-head">
								<div class="clearfix">
									<div class="pull-left">
										<a href="email-inbox.html"><i class="ec-archive"></i></a>
									</div>
									<span>Inbox</span>
									<div class="pull-right">
										<a href="email-inbox.html"><i class="st-pencil"></i></a>
									</div>
								</div>
							</li>
							<li class="search-email">
								<form>
									<input type="text" name="search" placeholder="Search for emails">
									<button type="submit"><i class="ec-search"></i>
									</button>
								</form>
							</li>
							<li class="mail-list clearfix">
								<a href="#">
									<img src="${pageContext.request.contextPath}/assets/img/avatars/128.jpg" class="mail-avatar pull-left" alt="avatar">
									<p class="name">
										<span class="status"><i class="en-dot"></i></span> Jason Rivera
										<span class="notification">2</span>
										<span class="time">12:30 am</span>
									</p>
									<p class="msg">
										I contact you regarding my account please can you set up my pass ...
									</p>
								</a>
							</li>
							<li class="mail-list clearfix">
								<a href="#">
									<img src="${pageContext.request.contextPath}/assets/img/avatars/129.jpg" class="mail-avatar pull-left" alt="avatar">
									<p class="name">
										<span class="status off"><i class="en-dot"></i></span> Steeve Mclark
										<span class="notification">6</span>
										<span class="time">10:26 am</span>
									</p>
									<p class="msg">
										Good job dude awesome work here, please add theese features ...
									</p>
								</a>
							</li>
							<li class="mail-list clearfix">
								<a href="#">
									<img src="${pageContext.request.contextPath}/assets/img/avatars/130.jpg" class="mail-avatar pull-left" alt="avatar">
									<p class="name">
										<span class="status off"><i class="en-dot"></i></span> Fellix Jones
										<span class="notification">1</span>
										<span class="time">7:15 am</span>
									</p>
									<p class="msg">
										I have some issues when try to reach my product page can you ...
									</p>
								</a>
							</li>
							<li class="mail-list clearfix">
								<a href="#">
									<img src="${pageContext.request.contextPath}/assets/img/avatars/131.jpg" class="mail-avatar pull-left" alt="avatar">
									<p class="name">
										<span class="status"><i class="en-dot"></i></span> Tina Dowsen
										<span class="notification">5</span>
										<span class="time">03:46 am</span>
									</p>
									<p class="msg">
										Hello Sugge, i want to apply for your referal program , please ...
									</p>
								</a>
							</li>
							<li class="mail-more">
								<a href="email-inbox.html">View all <i class="en-arrow-right7"></i></a>
							</li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li>
						<a href="#" id="toggle-header-area"><i class="ec-download"></i></a>
					</li>
					<li class="dropdown">
						<a href="#" data-toggle="dropdown"><i class="br-alarm"></i> <span class="notification">5</span></a>
						<ul class="dropdown-menu notification-menu right" role="menu">
							<li class="clearfix">
								<i class="ec-chat"></i>
								<a href="#" class="notification-user"> Ric Jones </a>
								<span class="notification-action"> replied to your </span>
								<a href="#" class="notification-link"> comment</a>
							</li>
							<li class="clearfix">
								<i class="st-pencil"></i>
								<a href="#" class="notification-user"> SuggeElson </a>
								<span class="notification-action"> just write a </span>
								<a href="#" class="notification-link"> post</a>
							</li>
							<li class="clearfix">
								<i class="ec-trashcan"></i>
								<a href="#" class="notification-user"> SuperAdmin </a>
								<span class="notification-action"> just remove </span>
								<a href="#" class="notification-link"> 12 files</a>
							</li>
							<li class="clearfix">
								<i class="st-paperclip"></i>
								<a href="#" class="notification-user"> C. Wiilde </a>
								<span class="notification-action"> attach </span>
								<a href="#" class="notification-link"> 3 files</a>
							</li>
							<li class="clearfix">
								<i class="st-support"></i>
								<a href="#" class="notification-user"> John Simpson </a>
								<span class="notification-action"> add support </span>
								<a href="#" class="notification-link"> ticket</a>
							</li>
						</ul>
					</li>
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
		<!-- Start #header-area -->
		<div id="header-area" class="fadeInDown">
			<div class="header-area-inner">
				<ul class="list-unstyled list-inline">
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="im-pie"></i>
								<span>Earning Stats</span>
							</a>
						</div>
					</li>
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="ec-images color-dark"></i>
								<span>Gallery</span>
							</a>
						</div>
					</li>
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="en-light-bulb color-orange"></i>
								<span>Fresh ideas</span>
							</a>
						</div>
					</li>
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="ec-link color-blue"></i>
								<span>Links</span>
							</a>
						</div>
					</li>
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="ec-support color-red"></i>
								<span>Support</span>
							</a>
						</div>
					</li>
					<li>
						<div class="shortcut-button">
							<a href="#">
								<i class="st-lock color-teal"></i>
								<span>Lock area</span>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- End #header-area -->
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
			<li><a href="charts.html">Charts <i class="st-chart"></i></a>
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
			<li><a href="#"> Tables <i class="im-table2"></i></a>
				<ul class="nav sub">
					<li><a href="tables.html"><i class="en-arrow-right7"></i> Static tables</a>
					</li>
					<li><a href="data-tables.html"><i class="en-arrow-right7"></i> Data tables</a>
					</li>
				</ul>
			</li>
			<li><a href="#"> UI Elements <i class="st-lab"></i></a>
				<ul class="nav sub">
					<li><a href="notifications.html"><i class="fa-bell"></i> Notifications</a>
					</li>
					<li><a href="panels.html"><i class="br-window"></i> Panels</a>
					</li>
					<li><a href="tiles.html"><i class="im-windows8"></i> Tiles</a>
					</li>
					<li><a href="elements.html"><i class="st-cube"></i> Elements</a>
					</li>
					<li><a href="icons.html"><i class="im-stack"></i> Icons</a>
					</li>
					<li><a href="buttons.html"><i class="im-play2"></i> Buttons</a>
					</li>
					<li><a href="calendar.html"><i class="im-calendar2"></i> Calendar</a>
					</li>
					<li><a href="grid.html"><i class="st-grid"></i> Grid</a>
					</li>
					<li><a href="typo.html"><i class="im-font"></i> Typography</a>
					</li>
					<li><a href="list.html"><i class="fa-list"></i> Lists</a>
					</li>
				</ul>
			</li>
			<li><a href="#"><i class="ec-mail"></i> Email app</a>
				<ul class="nav sub">
					<li><a href="email-inbox.html"><i class="ec-archive"></i> Inbox</a>
					</li>
					<li><a href="email-read.html"><i class="br-eye"></i> Read email</a>
					</li>
					<li><a href="email-write.html"><i class="ec-pencil2"></i> Write email</a>
					</li>
				</ul>
			</li>
			<li><a href="file.html"><i class="en-upload"></i> File Manager</a>
			</li>
			<li><a href="gallery.html"><i class="im-images"></i> Gallery</a>
			</li>
			<li><a href="widgets.html"><i class="st-diamond"></i> Widgets </a>
			</li>
			<li><a href="#"><i class="ec-location"></i> Maps</a>
				<ul class="nav sub">
					<li><a href="maps-google.html"><i class="im-map2"></i> Google maps</a>
					</li>
					<li><a href="maps-vector.html"><i class="en-location2"></i> Vector maps</a>
					</li>
				</ul>
			</li>
			<li><a href="#">Pages <i class="st-files"></i></a>
				<ul class="nav sub">
					<li><a href="invoice.html"><i class="st-file"></i> Invoice</a>
					</li>
					<li><a href="profile.html"><i class="ec-user"></i> Profile page</a>
					</li>
					<li><a href="search.html"><i class="ec-search"></i> Search page</a>
					</li>
					<li><a href="blank.html"><i class="im-file4"></i> Blank page</a>
					</li>
					<li><a href="login.html"><i class="ec-locked"></i> Login page</a>
					</li>
					<li><a href="lockscreen.html"><i class="ec-locked"></i> Lock screen</a>
					</li>
					<li>
						<a href="#"><i class="st-files"></i> Error pages</a>
						<ul class="nav sub">
							<li><a href="400.html"><i class="st-file-broken"></i> Error 400</a>
							</li>
							<li><a href="401.html"><i class="st-file-broken"></i> Error 401</a>
							</li>
							<li><a href="403.html"><i class="st-file-broken"></i> Error 403</a>
							</li>
							<li><a href="404.html"><i class="st-file-broken"></i> Error 404</a>
							</li>
							<li><a href="405.html"><i class="st-file-broken"></i> Error 405</a>
							</li>
							<li><a href="500.html"><i class="st-file-broken"></i> Error 500</a>
							</li>
							<li><a href="503.html"><i class="st-file-broken"></i> Error 503</a>
							</li>
							<li><a href="offline.html"><i class="st-window"></i> Offline</a>
							</li>
						</ul>
					</li>
				</ul>
			</li>
			<li>
				<a href="#">Bonus <i class="im-gift"></i></a>
				<ul class="nav sub">
					<li><a href="landing.html"><i class="im-airplane"></i> Landing page</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- End #sideNav -->
	</div>
	<!-- End .sidebar-inner -->
</div>
<!-- End #sidebar -->