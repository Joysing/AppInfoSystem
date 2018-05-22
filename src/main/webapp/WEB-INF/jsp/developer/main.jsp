<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-screen"></i>欢迎你! ${devUserSession.devCode }（${devUserSession.devName }）</h1>
                    </div>
                    <!-- End .page-header -->
                </div>
            </div>
        </div>
<%@include file="common/footer.jsp"%>