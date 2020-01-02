<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../common/header.jsp" %>

<!-- Page content -->
                    <div id="page-content">
                        <!-- Table Styles Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>설문 조사</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li><a href="/poll/pollinsertform">설문 작성</a></li>
											<li><a href="/poll/polllistform">작성된 설문</a></li>
											<li><a href="">지난 설문</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                
                            <div class="col-lg-6">
                                <!-- Row Styles Block -->
                                <div class="block">
                                    <!-- Row Styles Title -->
                                    <div class="block-title">
                                        <h2>설문 자료들</h2>
                                        <a href="/poll/pollinsertform"><button data-oper="createrupdate" class="insertgo buttonclass btn btn-effect-ripple btn-warning" type="submit">글 쓰기</button></a>
                                        
                                    </div>
                                    <!-- END Row Styles Title -->

                                    <!-- Row Styles Content -->
                                    <div class="table-responsive">
                                        <table class="table table-borderless table-vcenter">
                                            <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>작성자</th>
                                                    <th>정보</th>
                                                    <th>마감시간</th>
                                                    <th>참여여부</th>
                                                </tr>
                                           </thead>
                                            	
                                           <c:choose>
		 										<c:when test="${empty PollList }">
		 											<tbody><th><label>등록된 설문이 없습니다.</label></th></tbody>
		 										</c:when>
			 									<c:when test="${!empty PollList }"> 
					 								<c:forEach var="poll" items="${PollList}">
                                           				<tbody>
                                           				<!-- success warning info danger-->
                                                		<tr class="active">
                                                    		<td><strong>${poll.poll_num}번 설문</strong></td>
                                                    		<td><a href="polluserinsertform?poll_num=${poll.poll_num}">${poll.poll_title}</a></td>
		                                                   	<td>${poll.name}</td>
		                                                    <td>
        	                                            		<c:choose>
																	<c:when test='${poll.poll_type eq "1".charAt(0) }'>비공개</c:when>
																	<c:when test='${poll.poll_type eq "0".charAt(0) }'>공개</c:when>
																</c:choose>
															</td>
															<td>${poll.poll_etime}</td>
															<td>미참여</td>
															<%-- <td>
																<c:choose>
																	<c:when test="${employee.employee_no }">
																		
																	</c:when>
																	<c:when test="">
																	
																	</c:when>
																</c:choose>
															</td> --%>
                                                   			
                                               			</tr>
                                            			</tbody>
													</c:forEach>
													<tr>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														
														<th>
                                                    	 <div class="pageline pull-right">
					                                        <ul class="pagination pagination-sm">
					                                        	<c:if test="${pageMaker.prev }">
																	<li class="paginate_button previous fa fa-chevron-left">
																		<a href="${pageMaker.startPage -1 }"></a>
																	</li>														
																</c:if>
					                                            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
																	<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' }">
																		<a href="${num }">${num }</a>
																	</li>															
																</c:forEach>
					                                            <c:if test="${pageMaker.next }">
					                                            	<li class="paginate_button next">
					                                            		<a href="${pageMaker.endPage +1 }"><i class="paginate_button next fa fa-chevron-right"></i></a>
					                                            	</li>
					                                            </c:if>
					                                        </ul>
					                                    </div>
					                                    </th>
                                                    </tr>
                                                    <form id="actionForm" action="/poll/polllistform" method="get">
                                                    	<input type="hidden" id="pagenum" name="pageNum" value="${pageMaker.cri.pageNum }">
                                                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                                                    </form>	
												</c:when> 
											</c:choose>
											
                                        </table>
                                    </div>
                                    <!-- END Row Styles Content -->
                                </div>
                                <!-- END Row Styles Block -->
                            </div>
                        </div>
                        <!-- END Tables Row -->

            
            
<script>
$(document).ready(function() {
	/* var result = '<c:out value="${result}"/>';
	checkModal(result);
	history.replaceStat({},null,null);
	function checkModal(result){
		if (result === '' || history.state) {
			return;
		}
		if (parseInt(result)>0) {
			$(".modal-body").html(
				"게시글"+parseInt(result)+"번이 등록되었습니다.");
		}
		$("#myModel").modal("show");
	}
	$("#regBtn").on('click',function(){
		self.location = "/poll/pollinsertform";
	}); */
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
 		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		$('#pagenum').val($(this).attr("href"));
		actionForm.submit();
	});
});


</script>
                        
                        
<style>
.insertgo {
	float: right;
	height: 30px;
	margin: 5px 5px 5px 5px;
}
.pageline {
	float: right;
}

</style>