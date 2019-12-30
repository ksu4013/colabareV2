<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file = "../common/header.jsp" %>
<script type="text/javascript" src="/resources/js/pages/modifymem.js"></script>
</head>
<body>
<!-- Page content -->
                    <div id="page-content">
                        <!-- Tickets Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>Tickets</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li>Extra Pages</li>
                                            <li><a href="">Tickets</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END Tickets Header -->

                        <!-- Tickets Content -->
                        <div class="row">
                            <div class="col-md-4 col-lg-3">
                                <!-- Menu Block -->
                                <div class="block full">
                                    <!-- Menu Title -->
                                    <div class="block-title clearfix">
                                        <div class="block-options pull-right">
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-default" data-toggle="tooltip" title="Settings"><i class="fa fa-cog"></i></a>
                                        </div>
                                        <h2>Manage Tickets</h2>
                                    </div>
                                    <!-- END Menu Title -->

                                    <!-- Menu Content -->
                                    <ul class="nav nav-pills nav-stacked">
                                        <li class="active">
                                            <a href="page_app_email.html">
                                                <span class="badge pull-right">350</span>
                                                <i class="fa fa-fw fa-ticket icon-push"></i> <strong>All</strong>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <span class="badge pull-right">5</span>
                                                <i class="fa fa-fw fa-exclamation-triangle icon-push"></i> <strong>Urgent</strong>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <span class="badge pull-right">10</span>
                                                <i class="fa fa-fw fa-folder-open-o icon-push"></i> <strong>Open</strong>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <span class="badge pull-right">50</span>
                                                <i class="fa fa-fw fa-folder-o icon-push"></i> <strong>Closed</strong>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0)">
                                                <span class="badge pull-right">8</span>
                                                <i class="fa fa-fw fa-ban icon-push"></i> <strong>Invalid</strong>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- END Menu Content -->
                                </div>
                                <!-- END Menu Block -->

                                <!-- Quick Month Stats Block -->
                                <div class="block">
                                    <!-- Quick Month Stats Title -->
                                    <div class="block-title">
                                        <div class="block-options pull-right">
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-default" data-toggle="tooltip" title="Settings"><i class="fa fa-cog"></i></a>
                                        </div>
                                        <h2>Quick Stats</h2>
                                    </div>
                                    <!-- END Quick Month Stats Title -->

                                    <!-- Quick Month Stats Content -->
                                    <table class="table table-striped table-borderless table-vcenter">
                                        <tbody>
                                            <tr>
                                                <td style="width: 60%;">
                                                    <strong>Total Tickets</strong>
                                                </td>
                                                <td>1500</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Total Responses</strong>
                                                </td>
                                                <td>2590</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Forum Tickets</strong>
                                                </td>
                                                <td>320</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Email Tickets</strong>
                                                </td>
                                                <td>200</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Contact Form Tickets</strong>
                                                </td>
                                                <td>70</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <strong>Avg Response Time</strong>
                                                </td>
                                                <td>2 hrs</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- END Quick Month Stats Content -->
                                </div>
                                <!-- END Quick Month Stats Block -->
                            </div>
                            <div class="col-md-8 col-lg-9">
                                <!-- Tickets Block -->
                                <div class="block">
                                    <!-- Tickets Title -->
                                    <div class="block-title">
                                        <div class="block-options pull-right">
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-default" data-toggle="tooltip" title="Settings"><i class="fa fa-cog"></i></a>
                                        </div>
                                        <ul class="nav nav-tabs" data-toggle="tabs">
                                            <li class="active"><a href="#tickets-list">Ticket List</a></li>
                                            <li><a href="#tickets-single">#TCK500</a></li>
                                        </ul>
                                    </div>
                                    <!-- END Tickets Title -->

                                    <!-- Tabs Content -->
                                    <div class="tab-content">
                                        <!-- Tickets List -->
                                        <div class="tab-pane active" id="tickets-list">
                                            <div class="block-content-full">
                                                <div class="table-responsive remove-margin-bottom">
                                                    <table class="table table-striped table-vcenter remove-margin-bottom">
                                                        <thead>
                                                            <tr>
                                                                <th class="text-center">사원번호</th>
                                                                <th>이름</th>
                                                                <th>부서명</th>
                                                                <th>직급명</th>
                                                                <th>이메일</th>
                                                                <th>관리자</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id=employeelist>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div id=employeepage class="text-center">
                                                    <%-- <ul class="pagination">
                                                    
                                                    	<c:if test="${pageMaker.prev}">
															<li class="paginate_button previous">
																<a>Previous</a></li>
														</c:if>

														<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
															<li class="paginate_button  ${pageMaker.cri.pageNum == num ?" "active":""} ">
																<a>${num}</a>
															</li>
														</c:forEach>

														<c:if test="${pageMaker.next}">
															<li class="paginate_button next">
																<a>Next</a></li>
														</c:if>
                                                    </ul> --%>
                                                </div>
                                                <form id='actionForm' method='post'>
													<input type='hidden' id='pageNum' name='pageNum' value='${pageMaker.cri.pageNum}'>
													
												</form>
                                            </div>
                                        </div>
                                        <!-- END Tickets List -->

                                        <!-- Ticket View -->
                                        <div class="tab-pane" id="tickets-single">
                                            <div class="alert alert-success animation-fadeInQuick">Current Status: <strong>OPEN</strong></div>
                                            <a href="javascript:void(0)" class="btn btn-xs btn-default pull-right"><i class="fa fa-check"></i> Flag as Closed</a>
                                            <a href="javascript:void(0)" class="btn btn-xs btn-danger"><i class="fa fa-flag"></i> Flag as Urgent</a>
                                            <a href="javascript:void(0)" class="btn btn-xs btn-warning"><i class="fa fa-flag"></i> Flag as Invalid</a>
                                            <hr>
                                            <ul class="media-list media-feed push" id="requestlist">
                                                <!-- Ticket -->
                                                
                                                <!-- END Replies -->
                                            </ul>
                                        </div>
                                        <!-- END Ticket View -->
                                    </div>
                                    <!-- END Tabs Content -->
                                </div>
                                <!-- END Tickets Block -->
                            </div>
                        </div>
                        <!-- END Tickets Content -->
                    </div>
                    <!-- END Page Content -->
<table border="1" id="employeelist"></table>
<br><hr><br>
<table border="1" id="requestlist">	</table>

<br><br>
<a href="/colabare/master/master.do"><button>이전으로</button></a>
</body>

</html>