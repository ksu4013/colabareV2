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
                        <!-- Buttons - Dropdowns Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>설문조사</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li><a href="/poll/pollinsertform">설문 작성</a></li>
											<li><a href="/poll/polllistform">작성된 설문</a></li>
											<li><a href="/poll/polllistform">지난 설문</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END Buttons - Dropdowns Header -->

                        <!-- Buttons Row -->
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- Button Styles Block -->
                                <div class="block">
                                    <!-- Button Styles Title -->
                                    <div class="block-title">
                                        <!-- <div class="block-options pull-right">
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-default" data-toggle="tooltip" title="Info"><i class="fa fa-info-circle"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-success" data-toggle="tooltip" title="Success"><i class="fa fa-check"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-info" data-toggle="tooltip" title="Share on Facebook"><i class="fa fa-facebook"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-warning" data-toggle="tooltip" title="Warning"><i class="fa fa-exclamation-circle"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-effect-ripple btn-danger" data-toggle="tooltip" title="Delete"><i class="fa fa-trash-o"></i></a>
                                            <div class="btn-group">
                                                <a href="javascript:void(0)" class="btn btn-effect-ripple btn-primary dropdown-toggle enable-tooltip" data-toggle="dropdown" title="Extras"><i class="fa fa-chevron-down"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-right">
                                                    <li>
                                                        <a href="javascript:void(0)">
                                                            <i class="gi gi-cloud-download pull-right"></i>
                                                            Download
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0)">
                                                            <i class="gi gi-video_hd pull-right"></i>
                                                            HD Videos
                                                        </a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li>
                                                        <a href="javascript:void(0)">
                                                            <i class="gi gi-wifi fa-fw pull-right"></i>
                                                            Wifi
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div> -->
                                        <h2>${poll.pollVO.poll_num }번. &nbsp; ${poll.pollVO.poll_title}</h2>
                                    </div>
                                    <!-- END Button Styles Title -->

                                    <!-- Button Styles Content -->
                                    <div class="block-section">
                                        <h4 class="sub-header">${poll.pollVO.poll_contents }</h4>
                                        	<%-- <c:choose>
												<c:when test="${employee.employee_no eq poll.answer[0].employee_no }"> --%>
													<form role="form" action="/poll" name="form" method="post">
												<%-- </c:when>
												<c:when test="${employee.employee_no ne poll.answer[0].employee_no }">
													<form action="polluserinsertform" name="form" method="post">
												</c:when>
											</c:choose> --%>
										
										<%-- <fmt:parseDate var="bdate" value="${poll.pollVO.poll_etime }" pattern="yyyyMMddHHmm" />
										<fmt:formatDate var="bdate" value="${bdate}" pattern="yyyyMMddHHmm" />
										<div>1${bdate}</div> --%>
										
										<input type="hidden" name="poll_num" value="${poll.pollVO.poll_num }">
										<input type="hidden" name="employee_no" value="${employee.employee_no }">
										<input type="hidden" name="poll_joiner_num" value="${poll.answer[0].poll_joiner_num }">
										
										
										
										
										<c:forEach var="answer" items="${poll.answer }" varStatus="ansnum">
											<input type="hidden" name="poll_answer_num" value="${answer.poll_answer_num}">
											<input type="hidden" id="getanswerI_${ansnum.count }" class="getanswerC" value="${answer.poll_select_num }">
										</c:forEach>
										<c:forEach var="qilist" items="${poll.qilist }" varStatus="qnum">
			 								<div class="questionTab">
												<div id="q_text_${qnum.count }"	>
													<br><strong>${qilist.question.poll_question_text }</strong>
												</div>
												<div id="q_multiple_${qnum.count }" class="multiple">
													<input type="hidden" id="qm_${qilist.question.poll_num_question_num }" value="${qilist.question.poll_multiple}">
													
													<div id="q_multiple_${qnum.count }" class="multiple">다중선택 : <label>
														<c:choose>
															<c:when test='${qilist.question.poll_multiple eq "1".charAt(0)}'>불허</c:when>
															<c:when test='${qilist.question.poll_multiple eq "2".charAt(0)}'>허용</c:when>
														</c:choose>
													</label>
													</div>
													<br>
												</div>
												<!-- 단일 다중 판단 -->
												<div class="itemList" id="Ilist_${qnum.count }">
													<c:forEach var="items" items="${qilist.item }" varStatus="inum">
														
														<input type="hidden" id="itemNum_${qilist.question.poll_num_question_num}_${inum.count}" 
															name="poll_item_num_${qilist.question.poll_num_question_num -1}" class="itemidc_${qilist.question.poll_num_question_num}" 
															value="${items.poll_item_num }">
															
														<%-- <button type="button" class="itemButton itemButton_${qilist.question.poll_num_question_num} button_${items.poll_item_num} btn" 
														id="itemLS_${qilist.question.poll_num_question_num}_${inum.count}">${items.poll_item_text }</button> --%>
														<div class="itemButton itemButton_${qilist.question.poll_num_question_num} button_${items.poll_item_num} btn" 
															id="itemLS_${qilist.question.poll_num_question_num}_${inum.count}" >${inum.count}번. ${items.poll_item_text }</div>
														<br>
													</c:forEach>
													
													<c:forEach var="itemnum" items="${qilist.item }" varStatus="selectnum">
													
													<input type="hidden" class="userselectI_${qilist.question.poll_num_question_num}" 
													id="userinput_${qnum.count }_${selectnum.count}" name="poll_select_num_${qilist.question.poll_num_question_num -1}" value="0"><br>
													<input type="hidden" class="userselectQ" id="userinputQnum_${qnum.count }" 
													name="poll_question_num_${qilist.question.poll_num_question_num -1}" value="${qilist.question.poll_question_num }"><br>
													</c:forEach>
													<br>
													<div class="qtag_${qilist.question.poll_num_question_num }">
													<%-- <c:choose>
													<c:when test='${qilist.question.poll_multiple eq "1".charAt(0)}'> --%>
													
													<%-- </c:when>
													<c:when test='${qilist.question.poll_multiple eq "2".charAt(0)}'> --%>
													<%-- qID값 전달값[questionNum]<input type="text" class="userselectQ" id="Qnum_${qnum.count }" name="" value="${qilist.question.poll_question_num }">
													</c:when>
													</c:choose> --%>
													</div>
												</div>
											</div>
											<input type="hidden" name="question_size" value="0">
										</c:forEach>
										<div class="tail active">
											<div class="subutton">
												<%-- <c:if test=""> --%>
													<c:choose>
														<c:when test="${employee.employee_no eq poll.answer[0].employee_no }">
															<button data-oper="update" class="buttonclass submitButton btn btn-effect-ripple btn-success" type="submit">설문 수정</button>
														</c:when>
														<c:when test="${employee.employee_no ne poll.answer[0].employee_no }">
															<button data-oper="userinput" class="buttonclass submitButton btn btn-effect-ripple btn-success" type="submit">설문 제출</button>
														</c:when>
													</c:choose>
												<%-- </c:if> --%>
												<button data-oper="list" class="buttonclass submitButton btn btn-effect-ripple btn-success" type="submit">목 록</button>
											</div>
											<c:if test="${employee.employee_no eq  poll.pollVO.poll_writer}">
												<div id="formdeletebutton">
													<button data-oper="remove" class="buttonclass btn btn-effect-ripple btn-danger" type="submit">설문 삭제</button>
												</div>
												<div id="formupdatebutton">
													<a href="pollupdateform?poll_num=${poll.pollVO.poll_num}"><button data-oper="createrupdate" class="buttonclass btn btn-effect-ripple btn-warning" type="button">작성자 설문 수정</button></a>
												</div>  
											</c:if>
										</div>
										</form>
                                    </div>
                                    <!-- END Button Styles Content -->
								</div>
                                <!-- END Button Styles Block -->
                            </div>
                    	</div>
                    </div>
                    <!-- END Page Content -->
</body>
</html>


<script>

$(document).ready(function(){
	var formObj = $("form");
 	
	$(function() {
		$('.itemButton').hover(function() {
			$(this).addClass('hover');
		}, function() {
			$(this).removeClass('hover');
		});
	});
	
	$(function(){
		$('.buttonclass').on('click',function(){
			var operation = $(this).data('oper');
			/* alert('클릭'+ operation); */
			/* e.preventDefault(); */
			if (operation == 'remove') {
				/* alert("삭제"); */
				formObj.attr("action", "/poll/polldelete");
			}else if (operation == 'list') {
				/* 책 내용실패 */
				/* self.location="polllistform"; */
				/* return */
				formObj.attr("action", "/poll/polllistform");
				formObj.attr("method", "get");
			}else if (operation == 'update') {
				formObj.attr("action", "/poll/polluserupdate");
			}else if (operation == "userinput") {
				formObj.attr("action", "/poll/polluserinsertform");
			}
			/* else if (operation == "createrupdate") {
				formObj.attr("action", "/poll/polluserinsertform2");
				
			} 
			*/
			/* alert(operation); */
			formObj.submit();
		});
	});
	
	
	
	

	
//버튼을 클릭하면 하나씩 아래의 input에 입력됨
//두번클릭하면 입력된 값을 없에야됨
//다중선택시 여러가지 선택
//단일선택시 하나 클릭후 다른 값 없엠
$(function(){
	
	$('.itemButton').on('click',function(){
		
		var ButtonID = $(this).attr('id');

		var inum = ButtonID.substring(ButtonID.length-3);
		var qnum = ButtonID.substring(ButtonID.length-3, ButtonID.length-2);
		var itemID = "#itemNum_"+inum;
		var item_value = $(itemID).attr('value');
		var chid = "#userinput_" + inum;
		var mulpichoID = "#qm_"+qnum;
		

		// 단일 선택=1
		if ($(mulpichoID).attr('value') == '1') {
			
			var itembuttonNum = ".itemButton_"+qnum;
			$(itembuttonNum).removeClass('itemclick');
			$(this).addClass('itemclick');
			var uselect = ".userselectI_"+qnum;
			$(uselect).attr('value',0);
			var oneid = "#userinput_" + inum;
			$(oneid).attr('value', item_value); 
		}
		// 다중선택 =2;
		else if ($(mulpichoID).attr('value') == '2') {
			
			var qtag = ".qtag_"+qnum;
			var qtaglast = ".qtag_"+qnum+":last";
			var qid = "#Qnum_"+qnum;
			var QID = $(qid).attr('value');
			
			
			if ($(this).hasClass('itemclick')) {	
				$(this).removeClass('itemclick');
				$(chid).attr('value', 0); 
			} 
			else {
					$(this).addClass('itemclick');
					$(chid).attr('value', item_value); 
			}
		}
	});
	//저장된 응답번호 불러와 클릭해주기
	if ($('.getanswerC').length != 0) {
		var lennum = $('.getanswerC').length;
		for (var i = 1; i <= lennum; i++) {
			var id = "#getanswerI_"+i;
			var rid = $(id).attr('value');
			var bcl = ".button_"+rid;
			$(bcl).trigger("click");
		}
	}
	
	
	
	

});

 	

});
</script>


<style>
.block {
	margin-left: 100px;
}


.itemList .itemButton {
	color: #333333;
	cursor: pointer;
	width: 80%;
	float: left;
	text-align: center;
	margin: 5px;
	padding: 5px;
	background-color: #EEEEEE;
/* 	border-top: 3px solid #888;
	border-left: 3px solid #888;
	border-bottom: 3px solid #888;
	border-right: 3px solid #888; */
}


.itemList .hover {
	/* background-color: navy; */
	color: #5CCDDE;
}

.itemList .itemclick {
	color: #FFFFFF;
	background-color: #5CCDDE;
}

.tail {
	background-color: #EEEEEE;
}

.tail *{
	display: inline-block;
	 margin: 10px 10px 10px 10px; 
}

.subutton {
	/* margin-right: 50px; */
}



</style>
