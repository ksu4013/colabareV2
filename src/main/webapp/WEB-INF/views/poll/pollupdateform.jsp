<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>



		<!-- Page content -->
		<div id="page-content">
			<!-- Validation Header -->
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
			<!-- END Validation Header -->

			<!-- Form Validation Content -->
			<div class="row">
				<div
					class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
					<!-- Form Validation Block -->
					<div class="block">
						<!-- Form Validation Title -->
						<div class="block-title">
							<h2>설문 수정</h2>
						</div>
						<!-- END Form Validation Title -->

						<!-- Form Validation Form  폼-->
						<form id="form-validation" action="/poll/polllistform" method="post" class="form-horizontal form-bordered">
						
							<input type="hidden" name="poll_writer" value="${employee.employee_no }">
							<input type="hidden" name="poll_num" value="${poll.pollVO.poll_num }">
							<!-- <div class="form-group">
								<label class="col-md-3 control-label" for="val-skill">Best
									Skill <span class="text-danger">*</span>
								</label>
								<div class="col-md-6">
									<select id="val-skill" name="val-skill" class="form-control">
										<option value="">Please select</option>
										<option value="html">HTML</option>
										<option value="css">CSS</option>
										<option value="javascript">Javascript</option>
										<option value="ruby">Ruby</option>
										<option value="php">PHP</option>
										<option value="asp">ASP.NET</option>
										<option value="python">Python</option>
										<option value="mysql">MySQL</option>
									</select>
								</div>
							</div> -->
							<div class="form-group">
								<label class="col-md-3 control-label">이름</label>
								<div class="col-md-9">
								<c:choose>
										<c:when test='${poll.pollVO.poll_type eq "1".charAt(0)}'>
											<div class="radio">
												<label for="example-radio1"> <input type="radio" class="radio1" id="example-radio1" name="poll_type" value="1"checked="checked">
													공개
												</label>
											</div>
											<div class="radio">
												<label for="example-radio2"> <input type="radio" class="radio1" id="example-radio2" name="poll_type" value="0" >
													비공개
												</label>
											</div>
										</c:when>
									<c:when test='${poll.pollVO.poll_type eq "0".charAt(0)}'>
										<div class="radio">
											<label for="example-radio1"> <input type="radio" class="radio1" id="example-radio1" name="poll_type" value="1">
												공개
											</label>
										</div>
										<div class="radio">
											<label for="example-radio2"> <input type="radio" class="radio1" id="example-radio2" name="poll_type" value="0" checked="checked">
												비공개
											</label>
										</div>
									</c:when>
									</c:choose>
									<!-- <div class="radio">
										<label for="example-radio1"> <input type="radio" class="radio1" id="example-radio1" name="poll_type" value="1">
											공개
										</label>
									</div>
									<div class="radio">
										<label for="example-radio2"> <input type="radio" class="radio1" id="example-radio2" name="poll_type" value="0" checked="checked">
											비공개
										</label>
									</div> -->
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="val-username">설문 제목 <span class="text-danger">*</span>
								</label>
								<div class="col-md-6">
									<input type="text" id="val-username" name="poll_title" class="form-control" placeholder="제목입력.." value="${poll.pollVO.poll_title }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="val-email">설문 설명 <span class="text-danger">*</span>
								</label>
								<div class="col-md-6">
									<input type="text" id="val-email" name="poll_contents" class="form-control" placeholder="설명.." value="${poll.pollVO.poll_contents }">
								</div>
							</div>
							<%-- <div class="form-group">
								<label class="col-md-3 control-label" for="example-datepicker">마감시간</label>
								<div class="col-md-5">
									<input type="datetime-local" id="example-datepicker3" class="form-control " 
									name="poll_etime" placeholder="yyyy-MM-dd tt:mm" value="${poll.pollVO.poll_etime }">
									<input type="text" value="${poll.pollVO.poll_etime }">
									<input type="hidden" name="poll_stime" value="${poll.pollVO.poll_stime }">
								</div>
							</div> --%>

							<div id="questiontab">
								<c:forEach var="qilist" items="${poll.qilist }" varStatus="qnum">
								
								<div id="q1" class="question ">
								
								<input type="hidden" name="poll_question_num${qilist.question.poll_num_question_num -1}" value="${qilist.question.poll_question_num }"> 
								<input type="hidden" name="poll_num_question_num${qilist.question.poll_num_question_num -1}" value="${qilist.question.poll_num_question_num }"> 
								<input type="hidden" id="pnqn1" class="pollnumquesrionnum" name="poll_num_question_num" value="1">
									<label class="col-md-3 control-label" for="val-suggestions"> ${qilist.question.poll_num_question_num }.질문 <span class="text-danger">*</span>
									</label>
									<div class="col-md-9">
										<textarea id="questionText1" name="poll_question_text${qilist.question.poll_num_question_num -1}" rows="7" class="form-control questiontext"
										placeholder="1.질문..">${qilist.question.poll_question_text }</textarea>
										<br>
										<c:forEach var="items" items="${qilist.item }" varStatus="inum">
											<input type="hidden" name="poll_item_num${qilist.question.poll_num_question_num -1}" value="${items.poll_item_num }">
											<div class="item_list item_list1">
												<div class="itemtab itemtab1">
													<label class="col-md-3 control-label" for="val-website">1.항목<span class="text-danger">*</span></label>
													<div class="col-md-6">
														<input type="text" id="item1-1" name="poll_item_text${qilist.question.poll_num_question_num -1}" class="form-control item" 
														placeholder="항목1" value="${items.poll_item_text }">
													</div>
												</div><br><br><br>
											</div>
										</c:forEach>
									</div>
									
									<div class="form-group">
										<label class="col-md-3 control-label">선택 옵션</label>
										<div class="col-md-9">
										
										<c:choose>
											<c:when test='${qilist.question.poll_multiple eq "1".charAt(0)}'>
												<div class="radio">
													<label for="example-radio1"> <input type="radio" class="questionmultiple" id="qmulti1-1" name="poll_multiple${qilist.question.poll_num_question_num -1}" value="1" checked="checked">
														단일 선택
													</label>
												</div>
												<div class="radio">
													<label for="example-radio2"> <input type="radio" class="questionmultiple" id="qmulti1-2" name="poll_multiple${qilist.question.poll_num_question_num -1}" value="2">
														다중 선택
													</label>
												</div>
											</c:when>
										<c:when test='${qilist.question.poll_multiple eq "2".charAt(0)}'>
											<div class="radio">
													<label for="example-radio1"> <input type="radio" class="questionmultiple" id="qmulti1-1" name="poll_multiple${qilist.question.poll_num_question_num -1}" value="1" >
														단일 선택
													</label>
												</div>
												<div class="radio">
													<label for="example-radio2"> <input type="radio" class="questionmultiple" id="qmulti1-2" name="poll_multiple${qilist.question.poll_num_question_num -1}" value="2" checked="checked">
														다중 선택
													</label>
												</div>
										</c:when>
										</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>	
							</div>
							<div class="form-group form-actions">
								<div class="col-md-8 col-md-offset-3">
									<!-- <button type="submit" class="btn btn-effect-ripple btn-primary">설문 생성</button> -->
									<button type="submit" class="btn btn-effect-ripple btn-danger">설문수정</button>
								</div>
							</div>
						</form>
					</div>
					<!-- END Form Validation Block -->
				</div>
			</div>
			<!-- END Form Validation Content -->
		</div>
		<!-- END Page Content -->
	<!-- </div> -->
	<!-- END Main Container -->

</body>
</html>




<!-- <script type="text/javascript">


	$(document).ready(function() {
		//question 증가코드
		$(document).on('click','#addqubutton',function() {
			//마지막 질문 아이디 번호값
			var qidString = $('#questiontab').children(":last").attr('id');
			//마지막 질문 아이디 초기번호값은 '1'
			var qidnum = qidString.substring(1,qidString.length);
			var nqidnum = qidnum;
			//마지막 번호값에 +1
			var qidPnum = ++qidnum;
			
			$('#questiontab').append(
					
				'<div id="q'+qidPnum+'" class="question form-group">'	
				+'<input type="hidden" class="pollnumquesrionnum" name="poll_num_question_num" value="0">'	
				+'<input type="hidden" id="pnqn'+qidPnum+'" class="pollnumquesrionnum" name="poll_num_question_num'+nqidnum+'" value="'+qidPnum+'">'	
				+'<label class="col-md-3 control-label" for="val-suggestions">'+qidPnum+'.질문 <span class="text-danger">*</span></label>'	
				+'<div class="col-md-9"><textarea id="questionText'+qidPnum+'" name="poll_question_text'+nqidnum+'" rows="7" class="form-control questiontext"'
				+'placeholder="'+ qidPnum+'.질문.."></textarea><br><div class="item_list item_list'+qidPnum+'"><div class="itemtab itemtab1">'
				+'<label class="col-md-3 control-label" for="val-website">1.항목<span class="text-danger">*</span></label>'
				+'<div class="col-md-6"><input type="text" id="item'+qidPnum+'-1" name="poll_item_text'+nqidnum+'" class="form-control item" placeholder="항목1"></div></div><br><br><br>'
				+'<div class="itemtab itemtab2"><label class="col-md-3 control-label" for="val-website">2.항목 <span class="text-danger">*</span></label>'
				+'<div class="col-md-6"><input type="text" id="item'+qidPnum+'-2" name="poll_item_text'+nqidnum+'" class="form-control item" placeholder="항목2"></div></div></div></div>'
				+'<button type="button" id="addibutton'+qidPnum+'" class="additembutton btn btn-effect-ripple btn-info ">항목추가</button>'
				+'<div class="form-group"><label class="col-md-3 control-label">선택 옵션</label><div class="col-md-9">'
				+'<div class="radio"><label for="example-radio1"><input type="radio" class="questionmultiple" id="qmulti'+qidPnum+'-1" name="poll_multiple'+nqidnum+'" value="1" checked="checked">단일 선택</label></div>'
				+'<div class="radio"><label for="example-radio2"> <input type="radio" class="questionmultiple" id="qmulti'+qidPnum+'-2" name="poll_multiple'+nqidnum+'" value="2">'
				+'다중 선택</label></div></div></div></div>');
						
					/* 질문번호&길이 */
					var position = $(this).offset();
						$('html, body').animate({
							scrollTop : position.top}, 600);
						});

		
		
					//클릭하면 클릭한 질문에 대한(id) item 증가 코드
					$(document).on('click','.additembutton',function() {
						event.stopPropagation();

						//현재 값 찾기
						//fullitembuttonID 클릭한 항목추가의 id값 = 초기 '1'
						var fullIBID = $(this).attr('id');
						//빼온 id값 숫자만 추출 1
						var ibID = fullIBID.substring(fullIBID.length - 1,fullIBID.length);
						var mibID = ibID;
						var mibID = (mibID - 1);
						//id숫자 조합해서 '현재 클릭한 리스트'값 구함 
						var listnum = ".item_list" + ibID;
						//증가된 값 구하기
						//아이템리스트의 마지막 자식클레스값 인 itemtab class 찾기 = 초기 'itemtab2'
						
						var lastitem = $(listnum).children(":last").attr('class');
						//클레스값 숫자만 잘라내기
						var lastitemnum = lastitem.substring(lastitem.length - 1,lastitem.length);
						//값이 변해서 변하기전에 넣어놓음
						var orlastInum = lastitemnum;
						//하나 증가 시킨값 == 기본 3;
						var addnum = ++lastitemnum;
						//alert("lastitemfull=="+lastitem +"orlastInum값=="+orlastInum + "   addnum값=="+addnum);
						
						$(listnum).append(
							'<br><br><br><div class="itemtab itemtab'+addnum+'">'
							+'<label class="col-md-3 control-label" for="val-website">'+addnum+'.항목 <span class="text-danger">*</span></label>'
							+'<div class="col-md-6">'
							+'<input type="text" id="item'+ibID+'-'+addnum+'" name="poll_item_text'+mibID+'" class="form-control item" placeholder="항목'+addnum+'"></div></div>');
					});
				});
</script>




 -->






<style>
#questiontab {
	width: 442px;
	
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 10px;
	/* background-color: aqua; */
	border-width: 1px;
	border-style: solid;
	border-color: white; 
}

.itemtab {
	display: block;
}

#questiontab {
	margin-left: 80px;
}
.additembutton {
	margin-left: 100px;
	margin-bottom: 10px;
	margin-top: 10px;
}
#addqubutton {
	margin-left: 50px;
}

</style>
