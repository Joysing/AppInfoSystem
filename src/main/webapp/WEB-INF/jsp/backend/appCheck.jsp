<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>

<div id="content">
	<div class="content-wrapper">
		<div class="row">
			<!-- Start .row -->
			<!-- Start .page-header -->
			<div class="col-lg-12 heading">
				<h1 class="page-header"><i class="im-paragraph-justify"></i> APP信息管理维护</h1>
				<!-- Start .bredcrumb -->
				<ul class="breadcrumb">
					<li><i class="im-home"></i><a href="${pageContext.request.contextPath}/user/main">后台首页</a><i
							class="en-arrow-right7"></i></li>
					<li><i class="im-paragraph-justify"></i>
						<a href="${pageContext.request.contextPath}/backend/appInfo/appList">APP列表</a><i
							class="en-arrow-right7"></i></li>
					<li><i class="im-paragraph-justify"></i>
						审核APP信息</li>
				</ul>
				<!-- End .breadcrumb -->
			</div>
			<!-- End .page-header -->
		</div>
		<div class="outlet">
			<div class="row">
				<!-- Start .row -->
				<div class="col-lg-12">
					<!-- Start col-lg-12 -->
					<div class="panel panel-default toggle" id="spr_0">
						<!-- Start .panel -->
						<div class="panel-heading">
							<h3 class="panel-title">审核APP信息</h3>
							<div class="panel-controls panel-controls-hide" style="display: none;"><a href="#"
																									  class="toggle panel-minimize"><i
									class="im-minus"></i></a></div>
						</div>
						<div class="panel-body" style="overflow: hidden; display: block;">

	<form class="form-horizontal form-label-left">
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="softwareName">软件名称 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="softwareName" class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="softwareName" readonly="readonly" type="text"
					value="${appInfo.softwareName }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="APKName">APK名称 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="APKName" class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="APKName" readonly="readonly" type="text"
					value="${appInfo.APKName }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="supportROM">支持ROM <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="supportROM" class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="supportROM" readonly="readonly" type="text"
					value="${appInfo.supportROM }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="interfaceLanguage">界面语言 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="interfaceLanguage"
					class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="interfaceLanguage" readonly="readonly" type="text"
					value="${appInfo.interfaceLanguage }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="softwareSize">软件大小 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" id="softwareSize" name="softwareSize"
					readonly="readonly" class="form-control col-md-7 col-xs-12"
					value="${appInfo.softwareSize }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="downloads">下载次数 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" id="downloads" name="downloads"
					readonly="readonly" class="form-control col-md-7 col-xs-12"
					value="${appInfo.downloads }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="flatformId">所属平台 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="softwareName" class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="softwareName" readonly="readonly" type="text"
					value="${appInfo.flatformId }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="categoryLevel1">所属分类<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="softwareName" class="form-control col-md-7 col-xs-12"
					data-validate-length-range="6" data-validate-words="2"
					name="softwareName" readonly="readonly" type="text"
					value="${appInfo.categoryLevel1Name }-->>${appInfo.categoryLevel2Name }-->>${appInfo.categoryLevel3Name }">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">APP状态
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" class="form-control col-md-7 col-xs-12"
					value="${appInfo.statusName}" readonly="readonly">
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="appInfo">应用简介 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<textarea id="appInfo" name="appInfo"
					class="form-control col-md-7 col-xs-12" readonly="readonly">${appInfo.appInfo }</textarea>
			</div>
		</div>
		<div class="item form-group bad">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="_logoPicPath">LOGO图片 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<c:choose>
					<c:when
						test="${appInfo.logoPicPath == null || appInfo.logoPicPath == ''}">   
				    	暂无
				  </c:when>
					<c:otherwise>
						<img src="${appInfo.logoPicPath }?m=1" width="100px;" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-6 col-md-offset-3">
				<button type="button" class="btn btn-success check"
					appInfoId="${appInfo.id }" status="2">审核通过</button>
				<button type="button" class="btn btn-danger check"
					appInfoId="${appInfo.id }" status="3">审核不通过</button>
				<a href="appList" class="btn btn-primary">返回</a>
			</div>
		</div>

		<div class="ln_solid"></div>
		<!-- 版本信息 -->
		<div class="x_panel">
			<div class="x_title">
				<h2>最新版本信息</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="item form-group bad">
					<label class="control-label col-md-3 col-sm-3 col-xs-12"
						for="versionNo">版本号 <span class="required">*</span>
					</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="text" id="versionNo" name="versionNo"
							readonly="readonly" class="form-control col-md-7 col-xs-12"
							value="${appVersion.versionNo}">
					</div>
				</div>
				<div class="item form-group bad">
					<label class="control-label col-md-3 col-sm-3 col-xs-12"
						for="versionSize">版本大小 <span class="required">*</span>
					</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="number" id="versionSize" name="versionSize"
							readonly="readonly" class="form-control col-md-7 col-xs-12"
							value="${appVersion.versionSize}">
					</div>
				</div>
				<div class="item form-group bad">
					<label class="control-label col-md-3 col-sm-3 col-xs-12"
						for="publishStatus">发布状态 <span class="required">*</span>
					</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="text" id="publishStatus" name="publishStatus"
							readonly="readonly" class="form-control col-md-7 col-xs-12"
							value="${appVersion.publishStatus}">
					</div>
				</div>
				<div class="item form-group bad">
					<label class="control-label col-md-3 col-sm-3 col-xs-12"
						for="versionInfo">版本简介 <span class="required">*</span>
					</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="text" id="versionInfo" name="versionInfo"
							readonly="readonly" class="form-control col-md-7 col-xs-12"
							value="${appVersion.versionInfo}">
					</div>
				</div>
				<div class="item form-group bad">
					<label class="control-label col-md-3 col-sm-3 col-xs-12"
						for="versionNo">apk文件 <span class="required">*</span>
					</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						${appVersion.downloadLink }<a href="#">下载</a>
					</div>
				</div>

			</div>
		</div>
	</form>
			</div>
		</div>
	</div>
			</div>
		</div>
</div>
<%@include file="common/footer.jsp"%>
<script type="text/javascript">
//审核通过
$(".check").on("click", function() {
	window.location.href = "doCheck?appInfoId=" + $(this).attr("appInfoId") + "&status=" + $(this).attr("status")
})
</script>