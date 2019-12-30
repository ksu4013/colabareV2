<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<!-- 
<script type="text/javascript" src="../poll/source/poll_insertformsource.js"></script>
<link rel="stylesheet" href="../poll/css/pollinsertscss.css" type="text/css">
<link rel="stylesheet" src="../poll/css/insert-test.css"></script> 
 -->

</head>
<body>
	<%@ include file="../common/header.jsp"%>





	<!-- Main Container -->
	<div id="main-container">
		<!-- Header -->
		<!-- In the PHP version you can set the following options from inc/config file -->
		<!--
                        Available header.navbar classes:

                        'navbar-default'            for the default light header
                        'navbar-inverse'            for an alternative dark header

                        'navbar-fixed-top'          for a top fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar())
                            'header-fixed-top'      has to be added on #page-container only if the class 'navbar-fixed-top' was added

                        'navbar-fixed-bottom'       for a bottom fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar()))
                            'header-fixed-bottom'   has to be added on #page-container only if the class 'navbar-fixed-bottom' was added
                    -->
		<header class="navbar navbar-inverse navbar-fixed-top">
			<!-- Left Header Navigation -->
			<ul class="nav navbar-nav-custom">
				<!-- Main Sidebar Toggle Button -->
				<li><a href="javascript:void(0)"
					onclick="App.sidebar('toggle-sidebar');this.blur();"> <i
						class="fa fa-ellipsis-v fa-fw animation-fadeInRight"
						id="sidebar-toggle-mini"></i> <i
						class="fa fa-bars fa-fw animation-fadeInRight"
						id="sidebar-toggle-full"></i>
				</a></li>
				<!-- END Main Sidebar Toggle Button -->

				<!-- Header Link -->
				<li class="hidden-xs animation-fadeInQuick"><a href=""><strong>FORMS</strong></a>
				</li>
				<!-- END Header Link -->
			</ul>
			<!-- END Left Header Navigation -->

			<!-- Right Header Navigation -->
			<ul class="nav navbar-nav-custom pull-right">
				<!-- Search Form -->
				<li>
					<form action="page_ready_search_results.html" method="post"
						class="navbar-form-custom">
						<input type="text" id="top-search" name="top-search"
							class="form-control" placeholder="Search..">
					</form>
				</li>
				<!-- END Search Form -->

				<!-- Alternative Sidebar Toggle Button -->
				<li><a href="javascript:void(0)"
					onclick="App.sidebar('toggle-sidebar-alt');this.blur();"> <i
						class="gi gi-settings"></i>
				</a></li>
				<!-- END Alternative Sidebar Toggle Button -->

				<!-- User Dropdown -->
				<li class="dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="img/placeholders/avatars/avatar9.jpg" alt="avatar">
				</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-header"><strong>ADMINISTRATOR</strong></li>
						<li><a href="page_app_email.html"> <i
								class="fa fa-inbox fa-fw pull-right"></i> Inbox
						</a></li>
						<li><a href="page_app_social.html"> <i
								class="fa fa-pencil-square fa-fw pull-right"></i> Profile
						</a></li>
						<li><a href="page_app_media.html"> <i
								class="fa fa-picture-o fa-fw pull-right"></i> Media Manager
						</a></li>
						<li class="divider">
						<li>
						<li><a href="javascript:void(0)"
							onclick="App.sidebar('toggle-sidebar-alt');"> <i
								class="gi gi-settings fa-fw pull-right"></i> Settings
						</a></li>
						<li><a href="page_ready_lock_screen.html"> <i
								class="gi gi-lock fa-fw pull-right"></i> Lock Account
						</a></li>
						<li><a href="page_ready_login.html"> <i
								class="fa fa-power-off fa-fw pull-right"></i> Log out
						</a></li>
					</ul></li>
				<!-- END User Dropdown -->
			</ul>
			<!-- END Right Header Navigation -->
		</header>
		<!-- END Header -->

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
								<li><a href="">설문 작성</a></li>
								<li><a href="">작성된 설문</a></li>
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
							<h2>설문 생성</h2>
						</div>
						<!-- END Form Validation Title -->

						<!-- Form Validation Form  폼-->
						<form id="form-validation" action="/poll/pollinsertform"
							method="post" class="form-horizontal form-bordered">
							<input type="hidden" name="poll_writer"
								value="${employee.employee_no }">
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
									<div class="radio">
										<label for="example-radio1"> <input type="radio" class="radio1"
											id="example-radio1" name="poll_type" value="1">
											공개
										</label>
									</div>
									<div class="radio">
										<label for="example-radio2"> <input type="radio" class="radio1"
											id="example-radio2" name="poll_type" value="0" checked="checked">
											비공개
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-3 control-label" for="val-username">설문
									제목 <span class="text-danger">*</span>
								</label>
								<div class="col-md-6">
									<input type="text" id="val-username" name="poll_title"
										class="form-control" placeholder="제목입력..">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="val-email">설문
									설명 <span class="text-danger">*</span>
								</label>
								<div class="col-md-6">
									<input type="text" id="val-email" name="poll_contents"
										class="form-control" placeholder="설명..">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="example-datepicker">마감시간</label>
								<div class="col-md-5">
									<input type="text" id="example-datepicker3" name="poll_etime"
										class="form-control input-datepicker"
										data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy">
								</div>
							</div>

							<div id="questiontab">
								<input type="hidden" class="pollnumquesrionnum" name="poll_num_question_num" value="0"> 
								<input type="hidden" id="pnqn1" class="pollnumquesrionnum" name="poll_num_question_num0" value="1">
								<div id="q1" class="question form-group">
									<label class="col-md-3 control-label" for="val-suggestions">
										1.질문 <span class="text-danger">*</span>
									</label>
									<!-- <textarea rows="5" cols="20" id="questionText1" class="questiontext" name="poll_question_text0" >질문1</textarea> -->
									<div class="col-md-9">
										<textarea id="questionText1" name="poll_question_text0"
											rows="7" class="form-control questiontext"
											placeholder="Share your ideas with us.."></textarea>
										<!-- <textarea id="val-suggestions" name="val-suggestions" rows="7" class="form-control" placeholder="Share your ideas with us.."></textarea> -->
										<br>
										<div class="item_list1">
											<div class="itemtab1">
												<label class="col-md-3 control-label" for="val-website">1.항목
													<span class="text-danger">*</span>
												</label>
												<div class="col-md-6">
													<input type="text" id="item1-1" name="poll_item_text0"
														class="form-control item" placeholder="항목1">
													<!-- <input type="text" id="val-website" name="val-website" class="form-control" placeholder="항목1"> -->
												</div>
											</div>
											<br><br><br>
											<div class="itemtab2">
												<label class="col-md-3 control-label" for="val-website">2.항목
													<span class="text-danger">*</span>
												</label>
												<div class="col-md-6">
													<input type="text" id="item1-2" name="poll_item_text0"
														class="form-control item" placeholder="항목1">
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">선택 옵션</label>
										<div class="col-md-9">
											<div class="radio">
												<label for="example-radio1"> <input type="radio" class="questionmultiple"
													id="qmulti1-1" name="poll_multiple0" value="1">
													단일 선택
												</label>
											</div>
											<div class="radio">
												<label for="example-radio2"> <input type="radio" class="questionmultiple"
													id="qmulti1-2" name="poll_multiple0" value="2">
													다중 선택
												</label>
											</div>
										</div>
										
										<button type="button" id="addibutton1"
											class="additembutton btn btn-effect-ripple btn-info ">항목추가
										</button>
									</div>
								</div>
							</div>
							<button type="button" id="addqubutton"
								class="btn btn-effect-ripple btn-primary">질문 추가</button>

							<div class="form-group form-actions">
								<div class="col-md-8 col-md-offset-3">
									<!-- <button type="submit" class="btn btn-effect-ripple btn-primary">설문 생성</button> -->
									<button type="reset" class="btn btn-effect-ripple btn-danger">설문생성</button>
								</div>
							</div>
						</form>
						<!-- END Form Validation Form -->

						<!-- Terms Modal -->
						<div id="modal-terms" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title text-center">
											<strong>Terms and Conditions</strong>
										</h3>
									</div>
									<div class="modal-body">
										<h4 class="page-header">
											1. <strong>General</strong>
										</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Maecenas ultrices, justo vel imperdiet gravida, urna
											ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris
											tincidunt tincidunt turpis in porta. Integer fermentum
											tincidunt auctor.</p>
										<h4 class="page-header">
											2. <strong>Account</strong>
										</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Maecenas ultrices, justo vel imperdiet gravida, urna
											ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris
											tincidunt tincidunt turpis in porta. Integer fermentum
											tincidunt auctor.</p>
										<h4 class="page-header">
											3. <strong>Service</strong>
										</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Maecenas ultrices, justo vel imperdiet gravida, urna
											ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris
											tincidunt tincidunt turpis in porta. Integer fermentum
											tincidunt auctor.</p>
										<h4 class="page-header">
											4. <strong>Payments</strong>
										</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Maecenas ultrices, justo vel imperdiet gravida, urna
											ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris
											tincidunt tincidunt turpis in porta. Integer fermentum
											tincidunt auctor.</p>
									</div>
									<div class="modal-footer">
										<div class="text-center">
											<button type="button"
												class="btn btn-effect-ripple btn-primary"
												data-dismiss="modal">I've read them!</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- END Terms Modal -->
					</div>
					<!-- END Form Validation Block -->
				</div>
			</div>
			<!-- END Form Validation Content -->
		</div>
		<!-- END Page Content -->
	</div>
	<!-- END Main Container -->


















<%-- 
	<div id="id">
		<h3>설문조사</h3>
	</div>
	<div>
		<div class="side">

			<a href="pollinsertform">
				<button name="/poll/pollinsertform">설문 등록</button>
			</a> <br> <a href="polllistform">
				<button name="/poll/polllistform">진행중인 설문</button>
			</a> <br>
			<button>끝난 설문</button>
			<br>
		</div>

		<div id="paper">
			<h4 class="aa">설문조사 생성</h4>
			<div id="formm">
				<!-- <form action="/poll/pollinsertform"  method="post"> -->
				<input type="hidden" name="poll_writer" value="${employee.employee_no }">
				<div>
					<!-- <div>
						<label>부 서</label> <select name="department_id">
							<option value="">모두</option>
							<option value="인사">인사</option>
							<option value="영업">영업</option>
							<option value="마케팅">마케팅</option>
						</select>
					</div> -->
					<!-- <div class="radioone">
						<label>공 개<input type="radio" class="radio1"
							name="poll_type" value="1" checked="checked"></label>&emsp; <label>비공개<input
							type="radio" class="radio1" name="poll_type" value="0"></label>&emsp;
					</div> -->
					<div>
						<label>설문 제목</label> <input name="poll_title" value="제목">
					</div>
					<div>
						<label>설문 설명</label> <input name="poll_contents" value="설명">
					</div>
					<div>
						<label>마감시간</label> <input type="datetime-local" name="poll_etime">
						<!-- <label>마감시간</label> <input type="time" name="poll_etime" value=""> -->
					</div>
					<div id="questiontab">
						<div id="q1" class="question">
							<label>1. 질문 내용</label><br>
							<!-- <input type="hidden" class="pollnumquesrionnum" name="poll_num_question_num" value="0">
							<input type="hidden" id="pnqn1" class="pollnumquesrionnum" name="poll_num_question_num0" value="1"> -->
							<!-- <textarea rows="5" cols="20" id="questionText1" class="questiontext" name="poll_question_text0" >질문1</textarea> -->
							<div class="item_list1">
								<div class="itemtab1">
									<!-- <input type="hidden" id="qnin1-1" class="item_num" name="question_num_item_num0" value="1"> -->
									<!-- <label>1번</label><input id="item1-1" class="item" name="poll_item_text0" value="항목1"> -->
									<br>
								</div>
								<div class="itemtab2">
									<!-- <input type="hidden" id="qnin1-2" class="item_num" name="question_num_item_num0" value="2"> -->
									<!-- <label>2번</label><input id="item1-2" class="item" name="poll_item_text0" value="항목2"> -->
									<br>
								</div>
								<!-- 항목 추가 자리 -->
							</div>
							<!-- <div id="addibutton1" class="additembutton"> -->
							<!-- <div id="realIB">항목 추가</div> -->
							<b>항목 추가</b>
						</div>
						<!-- <div>
								<label>응답자 옵션 추가</label> <input type="checkbox" name="db없음">
							</div> -->
						<br>
						<div class="radioone">
							<label>단일 선택<input type="radio" id="qmulti1-1"
								class="questionmultiple" name="poll_multiple0" value="1"
								checked="checked"></label>&emsp; <label>중복 선택<input
								type="radio" id="qmulti1-2" class="questionmultiple"
								name="poll_multiple0" value="2"></label>&emsp;
						</div>
					</div>

				</div>
				<!-- 질문 추가자리 -->
				<div id="addqubutton">
					<!-- <div id="realQB"></div> -->
					<b>질문 추가</b>
				</div>
				<div class="subutton">
					<input type="submit" id="submit" class="submit" value="등록">
				</div>
			</div>
			</form>
		</div> --%>
	</div>
	<a href="/colabare/main.jsp"><button>홈으로</button></a>
	</div>
</body>
</html>




<script type="text/javascript">
	$(document).ready(
		function() {
		//question 증가코드
		$(document).on('click','#addqubutton',function() {
			//마지막 질문 아이디 번호값
			var qidString = $('#questiontab')
			.children(":last").attr('id');
			//마지막 질문 아이디 초기번호값은 '1'
			var qidnum = qidString.substring(1,qidString.length);
			var nqidnum = qidnum;
			//마지막 번호값에 +1
			var qidPnum = ++qidnum;

			$('#questiontab').append(
					'<input type="hidden" class="pollnumquesrionnum" name="poll_num_question_num" value="0">' 
					+ '<input type="hidden" id="pnqn"'+qidPnum+'class="pollnumquesrionnum" name="poll_num_question_num'+nqidnum+'" value="'+qidPnum+'">'
					+ '<div id="q'+qidPnum+'" class="question form-group">'
					+ '<label class="col-md-3 control-label" for="val-suggestions">'+qidPnum+'.질문 <span class="text-danger">*</span></label>'
					+ '<div class="col-md-9">'
					+ '<textarea id="questionText1" name="poll_question_text0"'
					+ 'rows="7" class="form-control questiontext"+qidPnum'
					+ 'placeholder="Share your ideas with us.."></textarea><br>'
					+ '<div class="item_list1">'
					+ '<div class="itemtab1">'
					+ '<label class="col-md-3 control-label" for="val-website">1.항목<span class="text-danger">*</span></label>'		
					+ '<div class="col-md-6"><input type="text" id="item1-1" name="poll_item_text0"class="form-control item" placeholder="항목1"></div></div><br><br><br>'				
					+ '<div class="itemtab2">'				
					+ '<label class="col-md-3 control-label" for="val-website">2.항목<span class="text-danger">*</span></label>'				
					+ '<div class="col-md-6"><input type="text" id="item1-2" name="poll_item_text0"class="form-control item" placeholder="항목1"></div></div></div></div>'				
					+ '<div class="form-group"><label class="col-md-3 control-label">선택 옵션</label>'					
					+ '<div class="col-md-9">'					
					+ '<div class="radio"><label for="example-radio1"> <input type="radio" class="questionmultiple" id="qmulti1-1" name="poll_multiple0" value="1">단일 선택</label></div>'
					+ '<div class="radio"><label for="example-radio2"> <input type="radio" class="questionmultiple" id="qmulti1-2" name="poll_multiple0" value="2">다중 선택</label></div></div>'
					+ '<button type="button" id="addibutton1" class="additembutton btn btn-effect-ripple btn-info ">항목추가</button></div></div>'
															
					
					
					/* 질문번호&길이 */
															+ "<input type='hidden' class='pollnumquesrionnum' name='poll_num_question_num' value='0'>"
																	+ "<input type='hidden' id='pnqn"+qidPnum+"' class='pollnumquesrionnum' name='poll_num_question_num"+nqidnum+"' value='"+qidPnum+"'>"
																	/* 질문 내용 */
																	+ "<div id='q"+qidPnum+"' class='question'><label>"
																	+ qidPnum
																	+ ". 질문 내용</label><br>"
																	+ "<textarea rows='5' cols='20' id='questionText"+qidPnum
																	+ "' class='questiontext' name='poll_question_text"+nqidnum+"'>질문"
																	+ qidPnum
																	+ "</textarea>"
																	/* 항목1번 */
																	/* + "<input type='hidden' id='qnin"+qidPnum+"-1' class='item_num' name='question_num_item_num"+nqidnum+"' value='1'>" */
																	+ "<div class='item_list"+qidPnum+"'><div class='itemtab1'><label>1번</label>"
																	+ "<input id='item"+qidPnum+ "-1' class='item' name='poll_item_text"+nqidnum+"' value='항목1'>"
																	+ "<br></div>"
																	/* 항목2번 */
																	/* + "<input type='hidden' id='qnin"+qidPnum+"-2' class='item_num' name='question_num_item_num"+nqidnum+"' value='2'>" */
																	+ "<div class='itemtab2'><label>2번</label>"
																	+ "<input id='item"+qidPnum+ "-2' class='item' name='poll_item_text"+nqidnum+"' value='항목2'>"
																	+ "<br></div></div><div>"
																	/* 항목추가 버튼 */
																	+ "<div id='addibutton"+qidPnum+"' class='additembutton'><b>항목 추가</b></div><br>"
																	/* 중복 옵션 */
																	+ "<!-- <div><label>응답자 옵션 추가</label> <input type='checkbox' name='db없음'></div> -->"
																	+ "<div class='radioone'><label>단일 선택<input type='radio'' id='qmulti"+qidPnum+"-1'"	
				+ "class='questionmultiple' name='poll_multiple"+nqidnum+"' checked='checked' value='1'></label>&emsp;"
																	+ "<label>중복 선택<input type='radio' id='qmulti"+qidPnum+"-2' class='questionmultiple' name='poll_multiple"+nqidnum+"' value='2'></label>&emsp;"
																	+ "</div></div>"); */
											var position = $(this).offset();
											$('html, body').animate({
												scrollTop : position.top
											}, 600);
										});

						//클릭하면 클릭한 질문에 대한(id) item 증가 코드
						$(document).on('click','.additembutton',function() {
											//이벤트 버블링 방지
											event.stopPropagation();

											//현재 값 찾기
											//fullitembuttonID 클릭한 항목추가의 id값 = 초기 '1'
											var fullIBID = $(this).attr('id');
											//빼온 id값 숫자만 추출 1
											var ibID = fullIBID.substring(
													fullIBID.length - 1,
													fullIBID.length);
											var mibID = ibID;
											var mibID = (mibID - 1);
											//id숫자 조합해서 '현재 클릭한 리스트'값 구함 
											var listnum = ".item_list" + ibID;

											//증가된 값 구하기
											//아이템리스트의 마지막 자식클레스값 인 itemtab class 찾기 = 초기 'itemtab2'
											var lastitem = $(listnum).children(
													":last").attr('class');
											//클레스값 숫자만 잘라내기
											var lastitemnum = lastitem
													.substring(
															lastitem.length - 1,
															lastitem.length);

											//값이 변해서 변하기전에 넣어놓음
											var orlastInum = lastitemnum;
											//하나 증가 시킨값 == 기본 3;
											var addnum = ++lastitemnum;
											//alert("lastitemfull=="+lastitem +"orlastInum값=="+orlastInum + "   addnum값=="+addnum);

											$(listnum).append(
															"<div class='itemtab"+addnum+"'>"

																	/* + "<input type='hidden' id='qnin"+ibID+"-"+addnum+"' class='item_num' name='question_num_item_num"+mibID+ "' value='"+addnum+"'>" */
																	+ "<label>"
																	+ addnum
																	+ "번</label>"
																	+ "<input id='item"+ibID+"-"+addnum+"' class='item' name='poll_item_text"+mibID+"' value='항목"+addnum+"'>"
																	+ "<button>삭제</button><br></div>");
										});

						/* 		$('#submit')on('click',function(){
						 //이벤트 버블링 방지
						 event.stopPropagation();
						 if ($(input[name='poll_multiple']).is(":checked")) {
						 $(input[name='poll_multiple']).val('1');
						 } else{
						 $(input[name= 'poll_multiple']).val('2');
						 }
						
						 }); */

					});
</script>











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
</style>

<!-- 
/* 
label {
	 color: white;
	 padding-right: 10px;
} */

#id {
	color: white;
	width: 615px;
	height: 100px;
	margin: 50px 0 0 0;
	/* margin-left: 10px; */
	padding-top: 20px;
	padding-left: 30px;
	border-width: 1px;
	/* border-style: solid; */
	border-color: black;
	border-bottom-style: none;
}

.side {
	float: left;
	padding-top: 30px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom : 600px;
	margin-bottom: 20px;
	border-right-width: 1px;
	/* border-style: solid; */
	border-color: black;
	/* background-color: navy; */
	
}
.side *{
	margin-top: 10px;
	margin-bottom: 10px;
}

h4 {
	color: white; 
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	/* border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: black; */
}

#paper {
	width: 500px;
	margin-left: 145px;
	border-width: 1px;
	border-style: solid;
	border-color: white;
}




.radioone {
	display: inline-block;
	margin: 0px 0px 0px 0px;
	padding-left: 10px;
 	widows: 200px;
	border-width: 1px;
	border-style: solid;
	border-color: white; 
	
} 

#formm {
	padding-left: 30px;
	/* background-color: gray; */
}


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

.question {
	width: 400px;
	padding-left: 20px;
	padding-top: 0px;
	margin-bottom: 5px;
	margin-left: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: white;
}

#formm div {
	/* padding-top: 10px; */	
	padding-top: 10px;
	padding-bottom: 10px;
}

#addqubutton {
	text-align: center;
	font-weight: 800;
	cursor: pointer;
	width: 100px;
	height: 40px;
	margin: 0px 0px ;
	padding: 0px 0px ;
	background-color: aqua;
	/* border: 10px 10px 10px 10px;  */
	border-style: solid;
	border-color: #0080FF; 
}

.additembutton {
	/* color: white; */
	text-align: center;
	font-weight: 800;
	cursor: pointer;
	width: 100px;
	height: 40px;
	margin: 0px 0px 0px 100px;
	padding: 0px 0px ;
	background-color: orange;
	/* border: 10px 10px 10px 10px;  */
	border-style: solid;
	border-color: #FFBF00;
}


.subutton {
	margin: 10px;
	}
 -->
