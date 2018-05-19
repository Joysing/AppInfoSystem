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
                <!-- End .row -->
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <!-- Start .row -->
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="carousel-tile carousel vertical slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="tile red">
                                            <div class="tile-icon">
                                                <i class="br-cart s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">107</div>
                                                <h3>Orders</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="tile orange">
                                            <!-- tile start here -->
                                            <div class="tile-icon">
                                                <i class="ec-cog s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">5</div>
                                                <h3>Settings changed</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Carousel -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="carousel-tile carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="tile blue">
                                            <div class="tile-icon">
                                                <i class="st-chat s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">24</div>
                                                <h3>New Comments</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="tile brown">
                                            <!-- tile start here -->
                                            <div class="tile-icon">
                                                <i class="ec-mail s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">17</div>
                                                <h3>New emails</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Carousel -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="carousel-tile carousel vertical slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="tile green">
                                            <div class="tile-icon">
                                                <i class="ec-users s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">325</div>
                                                <h3>New users</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="tile purple">
                                            <!-- tile start here -->
                                            <div class="tile-icon">
                                                <i class="ec-search s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">2540</div>
                                                <h3>Searches</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Carousel -->
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="carousel-tile carousel slide">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="tile teal">
                                            <!-- tile start here -->
                                            <div class="tile-icon">
                                                <i class="ec-images s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">45</div>
                                                <h3>New images</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="tile magenta">
                                            <!-- tile start here -->
                                            <div class="tile-icon">
                                                <i class="ec-share s64"></i>
                                            </div>
                                            <div class="tile-content">
                                                <div class="number">3548</div>
                                                <h3>Posts shared</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Carousel -->
                        </div>
                    </div>
                    <!-- End .row -->
                    <div class="row">
                        <!-- Start .row -->

                        <!-- End col-lg-6 -->
                        <div class="col-lg-6 col-md-6 sortable-layout">
                            <!-- Start col-lg-6 -->


                            <div class="panel panel-default toggle panelMove panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="fa-list"></i> ToDo</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="todo-widget">
                                        <div class="todo-header">
                                            <div class="todo-search">
                                                <form>
                                                    <input type="text" class="form-control" name="search" placeholder="Search for todo ...">
                                                </form>
                                            </div>
                                            <div class="todo-add">
                                                <a href="#" class="btn btn-primary tip" title="Add new todo"><i class="im-plus"></i></a>
                                            </div>
                                        </div>
                                        <h4 class="todo-period">Today</h4>
                                        <ul class="todo-list" id="today">
                                            <li class="todo-task-item">
                                                <label class="checkbox">
                                                    <input type="checkbox">
                                                </label>
                                                <div class="todo-priority normal tip" title="Normal priority">
                                                    <i class="im-radio-checked"></i>
                                                </div>
                                                <span class="todo-category label label-primary"> javascript </span>
                                                <div class="todo-task-text">Add scroll function to template</div>
                                                <button type="button" class="close todo-close">&times;</button>
                                            </li>
                                            <li class="todo-task-item">
                                                <label class="checkbox">
                                                    <input type="checkbox">
                                                </label>
                                                <div class="todo-priority high tip" title="High priority">
                                                    <i class="im-radio-checked"></i>
                                                </div>
                                                <span class="todo-category label label-brown"> less </span>
                                                <div class="todo-task-text">Fix main less file</div>
                                                <button type="button" class="close todo-close">&times;</button>
                                            </li>
                                            <li class="todo-task-item task-done">
                                                <label class="checkbox">
                                                    <input type="checkbox" checked>
                                                </label>
                                                <div class="todo-priority high tip" title="High priority">
                                                    <i class="im-radio-checked"></i>
                                                </div>
                                                <span class="todo-category label label-info"> html </span>
                                                <div class="todo-task-text">Change navigation structure</div>
                                                <button type="button" class="close todo-close">&times;</button>
                                            </li>
                                        </ul>
                                        <h4 class="todo-period">Tomorrow</h4>
                                        <ul class="todo-list" id="tomorrow">
                                            <li class="todo-task-item">
                                                <label class="checkbox">
                                                    <input type="checkbox">
                                                </label>
                                                <div class="todo-priority tip" title="Low priority">
                                                    <i class="im-radio-checked"></i>
                                                </div>
                                                <span class="todo-category label label-dark"> css </span>
                                                <div class="todo-task-text">Create slide panel widget</div>
                                                <button type="button" class="close todo-close">&times;</button>
                                            </li>
                                            <li class="todo-task-item">
                                                <label class="checkbox">
                                                    <input type="checkbox">
                                                </label>
                                                <div class="todo-priority medium tip" title="Medium priority">
                                                    <i class="im-radio-checked"></i>
                                                </div>
                                                <span class="todo-category label label-danger"> php </span>
                                                <div class="todo-task-text">Edit the main controller</div>
                                                <button type="button" class="close todo-close">&times;</button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- End col-lg-6 -->
                    </div>
                    <!-- End .row -->
                    <!-- Page End here -->
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
        </div>
        <!-- End #content -->
<%@include file="common/footer.jsp"%>