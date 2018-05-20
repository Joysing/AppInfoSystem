<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/header.jsp" %>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <!-- Start .row -->
            <!-- Start .page-header -->
            <div class="col-lg-12 heading">
                <h1 class="page-header"><i class="im-paragraph-justify"></i> APP 信息管理维护</h1>
                <!-- Start .bredcrumb -->
                <ul class="breadcrumb">
                    <li><i class="im-home"></i>
                        <a href="${pageContext.request.contextPath}">后台首页</a>
                        <i class="en-arrow-right7"></i>
                    </li>
                    <li><i class="im-paragraph-justify"></i>
                        <a href="${pageContext.request.contextPath}/dev/appInfo/list">APP信息管理</a>
                        <i class="en-arrow-right7"></i>
                    </li>
                    <li><i class="ec-pencil2"></i>新增版本信息</li>
                </ul>
                <!-- End .breadcrumb -->
            </div>
            <!-- End .page-header -->
        </div>
        <div class="outlet">
            <%--Start 版本信息--%>
            <div class="row">
                <!-- Start .row -->
                <div class="col-lg-12">
                    <!-- Start col-lg-12 -->
                    <div class="panel panel-default toggle" id="spr_0">
                        <!-- Start .panel -->
                        <div class="panel-heading">
                            <h2 class="panel-title">历史版本列表</h2>
                            <div class="panel-controls panel-controls-hide" style="display: none;">
                                <a href="#" class="toggle panel-minimize"><i class="im-minus"></i></a></div>
                        </div>
                        <div class="panel-body" style="overflow: hidden; display: block;">
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
                                    <c:forEach items="${appVersions}" var="appVersion">
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
                                            <td><a href="${pageContext.request.contextPath}/statics/updateFiles/${appVersion.apkFileName }">${appVersion.apkFileName }</a>
                                            </td>
                                            <td><fmt:formatDate value="${appVersion.modifyDate }"  type="both"/></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- End .panel -->
                </div>
                <!-- End col-lg-12 -->
            </div>
            <%--End  版本信息--%>
            <div class="row">
                <!-- Start .row -->
                <div class="col-lg-12">
                    <!-- Start col-lg-12 -->
                    <div class="panel panel-default toggle" id="spr_1">
                        <!-- Start .panel -->
                        <div class="panel-heading">
                            <h2 class="panel-title">添加APP版本信息</h2>
                            <div class="panel-controls panel-controls-hide" style="display: none;"><a href="#" class="toggle panel-minimize"><i
                                    class="im-minus"></i></a></div>
                        </div>
                        <div class="panel-body" style="overflow: hidden; display: block;">
                            <form class="form-horizontal form-label-left" action="doVersion"
                                  enctype="multipart/form-data" method="post" name="appVersion">
                                <input type="hidden" name="appId" value="${appInfo.id }">
                                <input type="hidden" name="createdBy" value="${devUserSession.id }">
                                <input type="hidden" name="APKName" value="${appInfo.APKName }">
                                <div class="item form-group bad">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="versionNo">版本号<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="versionNo" class="form-control col-md-7 col-xs-12"
                                               data-validate-length-range="6" data-validate-words="2"
                                               name="versionNo" placeholder="请输入版本号" required="required"
                                               type="text">
                                    </div>
                                </div>

                                <div class="item form-group bad">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="versionSize">版本大小 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" id="versionSize" name="versionSize"
                                               required="required" data-validate-minmax="10,100"
                                               placeholder="请输入软件大小，单位为Mb" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="item form-group bad">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="publishStatus">发布状态 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="hidden" id="publishStatus" name="publishStatus"
                                               value="3">预发布
                                    </div>
                                </div>
                                <div class="item form-group bad">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                           for="versionInfo">版本简介 <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
				<textarea id="versionInfo" required="required" name="versionInfo"
                          class="form-control col-md-7 col-xs-12"
                          placeholder="本信息作为软件的详细信息进行软件的介绍"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-12 control-label" for="apkFile">
                                        apk文件 <span class="required">*</span></label>
                                    <div class="col-lg-6 col-md-6">
                                        <input type="file" id="apkFile" name="apkFile" class="form-control">
                                    </div>
                                    <div class="alert">${fileUploadError }</div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="list" class="btn btn-primary">返回</a>
                                        <button id="send" type="submit" class="btn btn-success">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- End .panel -->
            </div>
            <!-- End col-lg-12 -->
        </div>
    </div>

    <div class="clearfix"></div>
    <%@include file="common/footer.jsp" %>