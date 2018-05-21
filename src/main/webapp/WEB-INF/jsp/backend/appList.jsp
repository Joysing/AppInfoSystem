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
				<h1 class="page-header"><i class="im-paragraph-justify"></i> APP 信息审核管理</h1>
				<!-- Start .bredcrumb -->
				<ul class="breadcrumb">
					<li><i class="im-home"></i><a href="${pageContext.request.contextPath}">后台首页</a><i
							class="en-arrow-right7"></i></li>
					<li><i class="im-paragraph-justify"></i>APP 信息审核</li>
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
							<h3 class="panel-title">查找软件</h3>
							<div class="panel-controls panel-controls-hide" style="display: none;"><a href="#" class="toggle panel-minimize">
								<i class="im-minus"></i></a></div>
						</div>
						<div class="panel-body" style="overflow: hidden; display: block;">
							<form class="form-horizontal group-border hover-stripped" id="search-form"
								  action="appList" method="post">
								<input name="pageIndex" id="pageIndex" value="1" type="hidden">
								<div class="form-group">
									<%--<label class="col-lg-2 col-md-2 col-sm-12 control-label">软件名称</label>--%>
									<div class="col-lg-3 col-md-3">
										<input type="text" class="form-control" placeholder="软件名称"
											   name="querySoftwareName" autofocus="autofocus">
									</div>

									<div class="col-lg-3 col-md-3">
										<select name="queryFlatformId" class="form-control">

											<c:if test="${!empty flatFormList }">
												<option value="">所属平台</option>
												<c:forEach items="${flatFormList }" var="flatForm">
													<option
															<c:if test="${queryFlatformId==flatForm.valueId}">selected="selected"</c:if>
															value="${flatForm.valueId }">${flatForm.valueName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="col-lg-2 col-md-2">
										<select name="queryCategoryLevel1" id="queryCategoryLevel1"
												class="form-control">

											<c:if test="${!empty categoryLevel1List }">
												<option value="">一级分类</option>
												<c:forEach items="${categoryLevel1List }" var="categoryLevel1">
													<option
															<c:if test="${queryCategoryLevel1==categoryLevel1.id }">selected="selected"</c:if>
															value="${categoryLevel1.id }">${categoryLevel1.categoryName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="col-lg-2 col-md-2">
										<select name="queryCategoryLevel2" id="queryCategoryLevel2"
												class="form-control">

											<c:if test="${!empty categoryLevel2List }">
												<option value="">二级分类</option>
												<c:forEach items="${categoryLevel2List }" var="categoryLevel2">
													<option
															<c:if test="${queryCategoryLevel2==categoryLevel2.id }">selected="selected"</c:if>
															value="${categoryLevel2.id }">${categoryLevel2.categoryName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="col-lg-2 col-md-2">
										<select name="queryCategoryLevel3" id="queryCategoryLevel3"
												class="form-control">

											<c:if test="${!empty categoryLevel3List }">
												<option value="">三级分类</option>
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
									<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-5">
										<button class="btn btn-primary" type="reset">重置</button>
										<button type="submit" class="btn btn-success">查询</button>
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
							<h4 class="panel-title">软件列表</h4>
							<div class="panel-controls panel-controls-hide" style="display: none;"><a href="#"
																									  class="panel-refresh"><i
									class="im-spinner6"></i></a><a href="#" class="toggle panel-minimize"><i
									class="im-minus"></i></a><a href="#" class="panel-close"><i
									class="im-close"></i></a></div>
						</div>
						<div class="panel-body">
							<div class="slimScrollDiv"
								 style="position: relative; overflow: hidden; width: 100%; height: auto;">
								<div class="table-responsive" style="overflow: hidden; width: 100%; height: auto;">
									<div id="datatable_wrapper" class="dataTables_wrapper form-inline" role="grid">
										<table class="table display dataTable" id="datatable"
											   aria-describedby="datatable_info">
											<thead>
											<tr role="row">
												<th rowspan="1" colspan="1">
													软件名称
												</th>
												<th rowspan="1" colspan="1">
													APK名称
												</th>
												<th rowspan="1" colspan="1">
													软件大小(单位:M)
												</th>
												<th rowspan="1" colspan="1">
													所属平台
												</th>
												<th rowspan="1" colspan="1">
													所属分类(一级分类、二级分类、三级分类)
												</th>
												<th rowspan="1" colspan="1">
													状态
												</th>
												<th rowspan="1" colspan="1">
													下载次数
												</th>
												<th rowspan="1" colspan="1">
													最新版本号
												</th>
												<th rowspan="1" colspan="1">
													操作
												</th>
											</tr>
											</thead>
											<tbody role="alert" aria-live="polite" aria-relevant="all">
											<c:forEach items="${ appInfos}" var="appInfo">
												<tr class="gradeA even">
													<td class=" sorting_1">${appInfo.softwareName}</td>
													<td class=" ">${appInfo.APKName }</td>
													<td class=" ">${appInfo.softwareSize }</td>
													<td class="center ">${appInfo.flatformName }</td>
													<td class="center ">${appInfo.categoryLevel1Name }->
															${appInfo.categoryLevel2Name } -> ${appInfo.categoryLevel3Name }</td>
													<td class="center ">${appInfo.statusName }</td>
													<td class="center ">${appInfo.downloads }</td>
													<td class="center ">${appInfo.versionNo }</td>
													<td class="center ">
														<div class="input-group-btn">
															<button type="button" class="btn btn-default dropdown-toggle appCheck" data-toggle="dropdown"
																appinfoid="${appInfo.id }" versionid="${appInfo.versionId}"
																status="${appInfo.status }" statusname="${appInfo.statusName }">
																审核</button>

														</div>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<div class="row-">
											<div class="col-lg-6 col-md-6 col-sm-12">
												<div class="dataTables_info" id="datatable_info">当前显示第 ${pages.currentPageNo }/${pages.totalPageCount }页，共有${pages.totalCount }
													条
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-12">
												<div class="dataTables_paginate paging_bs_full" id="datatable_paginate">
													<ul class="pagination">
														<c:if test="${pages.currentPageNo > 1}">
															<li><a tabindex="0"
																   href="javascript:page_nav(document.forms[0],1);"
																   class="paginate_button first"
															>第一页</a></li>
															<li><a tabindex="0"
																   href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
																   class="paginate_button previous"
															>上一页</a>
															</li>
														</c:if>
														<c:if test="${pages.currentPageNo < pages.totalPageCount }">
															<li><a tabindex="0" class="paginate_button next"
																   href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
															>下一页</a></li>
															<li><a tabindex="0" class="paginate_button last"
																   href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
															>最后一页</a></li>
														</c:if>
													</ul>
												</div>
												<script type="text/javascript">
                                                    function page_nav(form, num) {
                                                        form=document.getElementById("search-form");
                                                        document.getElementById("pageIndex").value=num;
                                                        form.submit();
                                                    }
												</script>
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
<script src="${pageContext.request.contextPath }/statics/localjs/appList.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/pages/data-tables.js"></script>