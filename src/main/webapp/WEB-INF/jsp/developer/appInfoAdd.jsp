<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/5/20
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="common/header.jsp"%>

<!-- Start #content -->
<div id="content">

    <form class="form-horizontal form-label-left" action="doAdd"
          enctype="multipart/form-data" method="post">

        <span class="section">添加APP信息</span>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="softwareName">软件名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="softwareName" class="form-control col-md-7 col-xs-12"
                       data-validate-length-range="6" data-validate-words="2"
                       name="softwareName" placeholder="请输入软件名称" required="required"
                       type="text">
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="APKName">APK名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="APKName" class="form-control col-md-7 col-xs-12"
                       data-validate-length-range="6" data-validate-words="2"
                       name="APKName" placeholder="请输入APK名称" required="required"
                       type="text">
            </div>
            <div class="alert" id="APKNameMessage"></div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="supportROM">支持ROM <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="supportROM" class="form-control col-md-7 col-xs-12"
                       data-validate-length-range="6" data-validate-words="2"
                       name="supportROM" placeholder="请输入支持ROM" required="required"
                       type="text">
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
                       name="interfaceLanguage" placeholder="请输入界面语言" required="required"
                       type="text">
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="softwareSize">软件大小 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="number" id="softwareSize" name="softwareSize"
                       required="required" data-validate-minmax="10,100"
                       placeholder="请输入软件大小，单位为Mb" class="form-control col-md-7 col-xs-12">
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="downloads">下载次数 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="number" id="downloads" name="downloads"
                       required="required" data-validate-minmax="10,100"
                       placeholder="请输入下载次数" class="form-control col-md-7 col-xs-12">
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="flatformId">所属平台 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="flatformId" name="flatformId"
                        class="form-control col-md-7 col-xs-12">

                </select>
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="categoryLevel1">一级分类 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="categoryLevel1" name="categoryLevel1"
                        class="form-control col-md-7 col-xs-12">

                </select>
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="categoryLevel2">二级分类 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="categoryLevel2" name="categoryLevel2"
                        class="form-control col-md-7 col-xs-12">

                </select>
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="categoryLevel3">三级分类 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="categoryLevel3" name="categoryLevel3"
                        class="form-control col-md-7 col-xs-12">

                </select>
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">APP状态
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="hidden" name="status" id="status" value="1">待审核
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="appInfo">应用简介 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
				<textarea id="appInfo" required="required" name="appInfo"
                          class="form-control col-md-7 col-xs-12"
                          placeholder="本信息作为软件的详细信息进行软件的介绍"></textarea>
            </div>
        </div>

        <div class="item form-group bad">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="_logoPicPath">LOGO图片 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="file" class="form-control col-md-7 col-xs-12"
                       name="_logoPicPath" id="_logoPicPath">
            </div>
            <div class="alert">${fileUploadError }</div>
        </div>

        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">

                <button id="send" type="submit" class="btn btn-success">保存</button>
                <a href="list" class="btn btn-primary">返回</a>
            </div>
        </div>
    </form>


</div>
<!-- End #content -->

<%@include file="common/footer.jsp"%>
<script
        src="${pageContext.request.contextPath }/statics/json/appInfoAdd.js">
</script>