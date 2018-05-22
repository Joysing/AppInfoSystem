<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					APP 审核列表 <i class="fa fa-user"></i><small>${userSession.userName}
						- 您可以通过搜索或者其他的筛选项对APP的信息进行审核操作</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" class="form-horizontal form-label-left"
					action="appList" method="post">
					<input name="pageIndex" value="1" type="hidden">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="first-name">软件名称 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="first-name"
								class="form-control col-md-7 col-xs-12" name="querySoftwareName"
								value="${querySoftwareName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">所属平台 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="queryFlatformId" class="form-control">
								<c:if test="${!empty flatFormList }">
									<option value="">请选择</option>
									<c:forEach items="${flatFormList }" var="flatForm">
										<option
											<c:if test="${queryFlatformId==flatForm.valueId}">selected="selected"</c:if>
											value="${flatForm.valueId }">${flatForm.valueName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">一级分类</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="queryCategoryLevel1" class="form-control"
								id="queryCategoryLevel1">
								<c:if test="${!empty categoryLevel1List }">
									<option value="">请选择</option>
									<c:forEach items="${categoryLevel1List }" var="categoryLevel1">
										<option
											<c:if test="${queryCategoryLevel1==categoryLevel1.id }">selected="selected"</c:if>
											value="${categoryLevel1.id }">${categoryLevel1.categoryName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">二级分类 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="queryCategoryLevel2" class="form-control"
								id="queryCategoryLevel2">
								<c:if test="${!empty categoryLevel2List }">
									<option value="">请选择</option>
									<c:forEach items="${categoryLevel2List }" var="categoryLevel2">
										<option
											<c:if test="${queryCategoryLevel2==categoryLevel2.id }">selected="selected"</c:if>
											value="${categoryLevel2.id }">${categoryLevel2.categoryName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">三级分类 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="queryCategoryLevel3" class="form-control"
								id="queryCategoryLevel3">
								<c:if test="${!empty categoryLevel3List }">
									<option value="">请选择</option>
									<c:forEach items="${categoryLevel3List }" var="categoryLevel3">
										<option
											<c:if test="${queryCategoryLevel3==categoryLevel3.id }">selected="selected"</c:if>
											value="${categoryLevel3.id }">${categoryLevel3.categoryName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="reset">重置</button>
							<button type="submit" class="btn btn-success">查询</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="row">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						<a href="${pageContext.request.contextPath }/dev/appInfo/add"
							class="btn btn-info btn-sm">新增APP基础信息</a>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<table
						class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed">
						<thead>
							<tr>
								<th>软件名称</th>
								<th>APK名称</th>
								<th>软件大小(单位:M)</th>
								<th>所属平台</th>
								<th>所属分类(一级分类、二级分类、三级分类)</th>
								<th>状态</th>
								<th>下载次数</th>
								<th>最新版本号</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${appInfos}" var="appInfo">
								<tr>
									<td tabindex="0" class="sorting_1">${appInfo.softwareName}</td>
									<td>${appInfo.APKName }</td>
									<td>${appInfo.softwareSize }</td>
									<td>${appInfo.flatformName }</td>
									<td>${appInfo.categoryLevel1Name }->
										${appInfo.categoryLevel2Name } -> ${appInfo.categoryLevel3Name }</td>
									<td><span id="appInfoStatus${appInfo.id}">${appInfo.statusName }</span></td>
									<td>${appInfo.downloads }</td>
									<td>${appInfo.versionNo }</td>
									<td>
										<button type="button"
											class="btn btn-round btn-success appCheck"
											appinfoid="${appInfo.id }" versionid="${appInfo.versionId}"
											status="${appInfo.status }"
											statusname="${appInfo.statusName }">审核</button>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-sm-5">
			<div class="dataTables_info" id="datatable-responsive_info"
				role="status" aria-live="polite">共${pages.totalCount }条记录
				${pages.currentPageNo }/${pages.totalPageCount }页</div>
		</div>
		<div class="col-sm-7">
			<div class="dataTables_paginate paging_simple_numbers"
				id="datatable-responsive_paginate">
				<ul class="pagination">
					<c:if test="${pages.currentPageNo > 1}">
						<li class="paginate_button previous"><a
							href="javascript:page_nav(document.forms[0],1);"
							aria-controls="datatable-responsive" data-dt-idx="0" tabindex="0">首页</a></li>
						<li class="paginate_button "><a
							href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
							aria-controls="datatable-responsive" data-dt-idx="1" tabindex="0">上一页</a></li>
					</c:if>
					<c:if test="${pages.currentPageNo < pages.totalPageCount }">
						<li class="paginate_button "><a
							href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
							aria-controls="datatable-responsive" data-dt-idx="1" tabindex="0">下一页</a></li>
						<li class="paginate_button next"><a
							href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
							aria-controls="datatable-responsive" data-dt-idx="7" tabindex="0">最后一页</a></li>
					</c:if>
				</ul>
			</div>
			<script type="text/javascript">
				function page_nav(form, num) {
					form.pageIndex.value = num;
					form.submit();
				}
			</script>
		</div>
	</div>

</div>
<div class="clearfix"></div>

<%@include file="common/footer.jsp"%>

<script
	src="${pageContext.request.contextPath }/statics/localjs/appList.js"></script>

