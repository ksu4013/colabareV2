<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>




<!-- Page content -->
<div id="page-content">
    <!-- Forum Header -->
    <div class="content-header">
        <div class="row">
            <div class="col-sm-6">
                <div class="header-section">
                    <h1>결재목록</h1>
                </div>
            </div>
            <!-- <div class="col-sm-6 hidden-xs">
                <div class="header-section">
                    <ul class="breadcrumb breadcrumb-top">
                        <li>Extra Pages</li>
                        <li><a href="">Forum</a></li>
                    </ul>
                </div>
            </div> -->
        </div>
    </div>
    <!-- END Forum Header -->

    <!-- Forum Block -->
    <div class="block">
        <!-- Forum Tabs Title -->
        <div class="block-title">
            <ul class="nav nav-tabs" data-toggle="tabs">
                <li class="active"><a href="#approval1">기안문서</a></li>
                <li><a href="#forum-topics">Topics</a></li>
                <li><a href="#forum-discussion">Discussion</a></li>
                <li><a href="#forum-more">더있어</a></li>
            </ul>
        </div>
        <!-- END Forum Tabs -->

        <!-- Tab Content -->
        <div class="tab-content">
            <!-- Forum -->
            <div class="tab-pane active" id="#approval1">
                <!-- Intro Category -->
                <table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">작성한 기안 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">Topics</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">Posts</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">작성 날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var = "approval" items="${list }">
                        <tr>
                            <td class="text-center" style="width: 75px;"><i class="gi gi-globe fa-2x text-muted text-muted"></i></td>
                            <td>
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>${approval.title }</strong></a>
                                </h4>
                                <div class="text-muted">${approval.dtitle }</div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>205</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>1265</strong></a></td>
                            <td class="hidden-xs hidden-sm">${approval.write_date }</td>
                            <!-- <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Sandra Gilbert</a><br><small>February 30, 2015</small></td> -->
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- END Intro Category -->
				<div class="text-center">
                    <ul class="pagination">
                        <li class="disabled"><a href="javascript:void(0)">Prev</a></li>
                        <li class="active"><a href="javascript:void(0)">1</a></li>
                        <li><a href="javascript:void(0)">2</a></li>
                        <li><a href="javascript:void(0)">3</a></li>
                        <li><a href="javascript:void(0)">...</a></li>
                        <li><a href="javascript:void(0)">10</a></li>
                        <li><a href="javascript:void(0)">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- END Forum -->

            <!-- Topics -->
            <div class="tab-pane" id="forum-topics">
                <table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">Getting Started</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">Replies</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">Views</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">Last Post</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center" style="width: 75px;"><i class="gi gi-pin_flag fa-2x text-danger"></i></td>
                            <td>
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>Welcome to our Getting Started category</strong></a>
                                </h4>
                                <div class="text-muted"><a href="page_ready_profile.html">Hannah Bates</a> on <em>January 1, 2015</em></div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>456</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>6598</strong></a></td>
                            <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Maria Young</a><br><small>June 25, 2015</small></td>
                        </tr>
                        <tr>
                            <td class="text-center"><i class="gi gi-pin_flag fa-2x text-danger"></i></td>
                            <td>
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>A big upgrade is coming to our app</strong></a>
                                </h4>
                                <div class="text-muted"><a href="page_ready_profile.html">Anna Matthews</a> on <em>February 2, 2015</em></div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>277</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>1254</strong></a></td>
                            <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Jacob Matthews</a><br><small>June 28, 2015</small></td>
                        </tr>
                        <tr>
                            <td class="text-center"><i class="gi gi-pin_flag fa-2x text-danger"></i></td>
                            <td>
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>Tips &amp; tricks for staying motivated</strong></a>
                                </h4>
                                <div class="text-muted"><a href="page_ready_profile.html">Jeremy Davis</a> on <em>February 5, 2015</em></div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>248</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>7548</strong></a></td>
                            <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Catherine Carr</a><br><small>June 30, 2015</small></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>2015, all the new features!</strong></a>
                                </h4>
                                <div class="text-muted"><a href="page_ready_profile.html">Anthony Carroll</a> on <em>January 3, 2015</em></div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>247</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>6325</strong></a></td>
                            <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Mary Fields</a><br><small>July 10, 2015</small></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h4>
                                    <a href="javascript:void(0)" class="text-dark"><strong>Your app saved me tons of time</strong></a>
                                </h4>
                                <div class="text-muted"><a href="page_ready_profile.html">Albert Barnes</a> on <em>February 10, 2015</em>text</div>
                            </td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>247</strong></a></td>
                            <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>2589</strong></a></td>
                            <td class="hidden-xs hidden-sm">by <a href="page_ready_profile.html">Roy Moreno</a><br><small>March 13, 2015</small></td>
                        </tr>
                        
                        
                    </tbody>
                </table>
                <div class="text-center">
                    <ul class="pagination">
                        <li class="disabled"><a href="javascript:void(0)">Prev</a></li>
                        <li class="active"><a href="javascript:void(0)">1</a></li>
                        <li><a href="javascript:void(0)">2</a></li>
                        <li><a href="javascript:void(0)">3</a></li>
                        <li><a href="javascript:void(0)">...</a></li>
                        <li><a href="javascript:void(0)">999</a></li>
                        <li><a href="javascript:void(0)">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- END Topics -->

            <!-- Discussion -->
            <div class="tab-pane" id="forum-discussion">
              
                <div class="text-center">
                    <ul class="pagination">
                        <li class="disabled"><a href="javascript:void(0)">Prev</a></li>
                        <li class="active"><a href="javascript:void(0)">1</a></li>
                        <li><a href="javascript:void(0)">2</a></li>
                        <li><a href="javascript:void(0)">3</a></li>
                        <li><a href="javascript:void(0)">...</a></li>
                        <li><a href="javascript:void(0)">10</a></li>
                        <li><a href="javascript:void(0)">Next</a></li>
                    </ul>
                </div>
            </div>
            <!-- END Discussion -->
            <div class="tab-pane" id="forum-more">
                하하
                <div class="text-center">
                    <ul class="pagination">
                        <li class="disabled"><a href="javascript:void(0)">Prev</a></li>
                        <li class="active"><a href="javascript:void(0)">1</a></li>
                        <li><a href="javascript:void(0)">2</a></li>
                        <li><a href="javascript:void(0)">3</a></li>
                        <li><a href="javascript:void(0)">...</a></li>
                        <li><a href="javascript:void(0)">10</a></li>
                        <li><a href="javascript:void(0)">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- END Tab Content -->
    </div>
    <!-- END Forum Block -->
</div>
<!-- END Page Content -->
<script>
$(document).ready(function(e){
	
	
	


	
	
	

	

	

	
});





</script>
</body>
</html>