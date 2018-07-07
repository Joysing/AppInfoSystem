<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="common/header.jsp" %>
<div id="content">
	<div class="content-wrapper">
		<div class="row">
			<!-- Start .row -->
			<!-- Start .page-header -->
			<div class="col-lg-12 heading">
				<h1 class="page-header"><i class="im-paragraph-justify"></i> APP信息管理维护</h1>
				<!-- Start .bredcrumb -->
				<ul class="breadcrumb">
					<li><i class="im-home"></i><a href="${pageContext.request.contextPath}">后台首页</a>
						<i class="en-arrow-right7"></i></li>
					<li><i class="im-paragraph-justify"></i><a href="${pageContext.request.contextPath}/dev/appInfo/list">
						APP信息管理</a><i class="en-arrow-right7"></i></li>
					<li><i class="im-paragraph-justify"></i>查看APP信息</li>
				</ul>
				<!-- End .breadcrumb -->
			</div>
			<!-- End .page-header -->
		</div>
		<div class="outlet">
			<%--Start 软件查询--%>
			<div class="row">
				<!-- Start .row -->
				<div class="col-lg-12">
					<!-- Start col-lg-12 -->
					<div class="panel panel-default toggle" id="spr_0">
						<!-- Start .panel -->
						<div class="panel-heading">
							<h3 class="panel-title">App详细信息</h3>
							<div class="panel-controls panel-controls-hide" style="display: none;">
								<a href="#" class="toggle panel-minimize"><i class="im-minus"></i></a>
							</div>
						</div>

						<div class="panel-body" style="overflow: hidden; display: block;">
							<form class="form-horizontal group-border hover-stripped" id="search-form"
								  action="list" method="post">
								<input name="pageIndex" id="pageIndex" value="1" type="hidden">
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
										   for="apkName">APK名称 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="apkName" class="form-control col-md-7 col-xs-12"
											   data-validate-length-range="6" data-validate-words="2"
											   name="apkName" readonly="readonly" type="text"
											   value="${appInfo.apkName }">
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
										   for="categoryLevel1">一级分类 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="softwareName" class="form-control col-md-7 col-xs-12"
											   data-validate-length-range="6" data-validate-words="2"
											   name="softwareName" readonly="readonly" type="text"
											   value="${appInfo.categoryLevel1Name }">
									</div>
								</div>
								<div class="item form-group bad">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										   for="categoryLevel2">二级分类 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="softwareName" class="form-control col-md-7 col-xs-12"
											   data-validate-length-range="6" data-validate-words="2"
											   name="softwareName" readonly="readonly" type="text"
											   value="${appInfo.categoryLevel2Name }">
									</div>
								</div>
								<div class="item form-group bad">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										   for="categoryLevel3">三级分类 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="softwareName" class="form-control col-md-7 col-xs-12"
											   data-validate-length-range="6" data-validate-words="2"
											   name="softwareName" readonly="readonly" type="text"
											   value="${appInfo.categoryLevel3Name }">
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
												<img src="${pageContext.request.contextPath }/${appInfo.logoPicPath }?m=1" width="100px;" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>

							</form>
						</div>
					</div>
					<!-- End .panel -->
				</div>
				<!-- End col-lg-12 -->
			</div>
			<%--End  软件查询--%>

			<%--Start 软件列表--%>
			<div class="row">
				<div class="col-lg-12">
					<!-- col-lg-12 start here -->
					<div class="panel panel-default plain toggle panelClose panelRefresh" id="spr_1">
						<!-- Start .panel -->
						<div class="panel-heading white-bg">
							<h4 class="panel-title">历史版本列表</h4>
						</div>

						<div class="panel-body">
							<div class="slimScrollDiv"
								 style="position: relative; overflow: hidden; width: 100%; height: auto;">
								<div class="table-responsive" style="overflow: hidden; width: 100%; height: auto;">
									<div id="datatable_wrapper" class="dataTables_wrapper form-inline" role="grid">
										<div class="x_content">

											<table class="table">
												<thead>
												<tr>
													<th>软件名称</th>
													<th>版本号</th>
													<th>版本大小(单位:M)</th>
													<th>发布状态</th>
													<th>APK文件下载</th>
													<th>最新更新时间</th>
												</tr>
												</thead>
												<tbody>
												<c:forEach items="${appVersions }" var="appVersion">
													<tr>
														<th>${appInfo.softwareName }</th>
														<td>${appVersion.versionNo }</td>
														<td>${appVersion.versionSize }</td>
														<c:choose>
															<c:when test="${appVersion.publishStatus==1 }">
																<td>不发布</td>
															</c:when>
															<c:when test="${appVersion.publishStatus==2 }">
																<td>已发布</td>
															</c:when>
															<c:otherwise>
																<td>预发布</td>
															</c:otherwise>
														</c:choose>
														<td><a
																href="${pageContext.request.contextPath}/statics/updateFiles/${appVersion.apkFileName }">${appVersion.apkFileName }</a></td>
														<td><fmt:formatDate value="${appVersion.modifyDate }"
																			type="both" /></td>
													</tr>
												</c:forEach>
												</tbody>
											</table>

										</div>
									</div>

									<div class="form-group">
										<div class="col-md-6 col-md-offset-3">
											<a href="list" class="btn btn-primary">返回</a>
										</div>
									</div>

									</div>
								</div>

								<div class="slimScrollBar ui-draggable"
									 style="background: rgb(153, 153, 153); height: 5px; position: absolute; bottom: 3px; opacity: 0.4; display: none; border-radius: 5px; z-index: 99; width: 730px; left: 0px;"></div>
								<div class="slimScrollRail"
									 style="width: 100%; height: 5px; position: absolute; bottom: 3px; display: none; border-radius: 5px; background: rgb(51, 51, 51); opacity: 0.5; z-index: 90;"></div>

							</div>
						</div>
					</div>
					<!-- End .panel -->
				</div>
				<!-- col-lg-12 end here -->
			</div>
			<%--End 软件列表--%>
		</div>
	</div>
</div>
<%@include file="common/footer.jsp" %>
<script src="${pageContext.request.contextPath }/statics/json/appInfoList.js"></script>

<script src="${pageContext.request.contextPath }/assets/js/pages/data-tables.js"></script>