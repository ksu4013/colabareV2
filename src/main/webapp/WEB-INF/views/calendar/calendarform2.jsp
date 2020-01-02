<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp"%>



                    <!-- Page content -->
                    <div id="page-content">
                        <!-- Calendar Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>캘린더</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li>개인업무</li>
                                            <li><a href="">캘린더</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END Calendar Header -->

                        <!-- FullCalendar Block -->
                        <div class="block full">
                            <div class="row">
                                <div class="col-md-3 col-md-push-9 col-lg-2 col-lg-push-10">
                                    <div class="block-section">
                                        <!-- Add event functionality (initialized in js/pages/compCalendar.js) -->
                                        <form>
                                            <div class="input-group">

                                                <input type="text" id="add-event" name="add-event" class="form-control" placeholder="스케줄을 입력하세요.">

                                                <div class="input-group-btn">
                                                    <button type="submit" id="add-event-btn" class="btn btn-effect-ripple btn-primary">일정 추가</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="block-section">
                                        <ul class="calendar-events">
                                            <li class="themed-background-warning"><i class="fa fa-calendar"></i> 휴가</li>
                                            <li class="themed-background-dark"><i class="fa fa-calendar"></i> 소연이랑 점심먹기</li>
                                            <li class="themed-background-info"><i class="fa fa-calendar"></i> 치과 진료 예약</li>
                                            <li class="themed-background-danger"><i class="fa fa-calendar"></i> 동아리 모임</li>
                                            <li><i class="fa fa-calendar"></i> 코뜨랑 회의</li>
                                            <li class="themed-background-info"><i class="fa fa-calendar"></i> 미국 여행</li>
                                            <li class="themed-background-success"><i class="fa fa-calendar"></i> 등산가기</li>
                                        </ul>
                                        <div class="block-section text-center text-muted">
                                            <small><i class="fa fa-arrows"></i> 드래그해서 옮기세요</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9 col-md-pull-3 col-lg-10 col-lg-pull-2">
                                    <!-- FullCalendar (initialized in js/pages/compCalendar.js), for more info and examples you can check out http://arshaw.com/fullcalendar/ -->
                                    <div id="calendar"></div>
                                </div>
                            </div>
                        </div>
                        <!-- END FullCalendar Block -->
                    </div>
                    <!-- END Page Content -->
                </div>
                <!-- END Main Container -->
            </div>
            <!-- END Page Container -->
        </div>
        <!-- END Page Wrapper -->

        <!-- Load and execute javascript code used only in this page -->
        <script src="/resources/js/pages/compCalendar.js"></script>
        <script>$(function(){ CompCalendar.init(); });</script>
    </body>
</html>