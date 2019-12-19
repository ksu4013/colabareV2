<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file = "../common/header.jsp" %>


	<!-- Page content -->
    <div id="page-content">
       
        <!-- Table Styles Block -->
        <div class="block">
			<button id='regBtn' type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: right;">
					<span class="btn-ripple animate" style="height: 75px; width: 75px; top: -29.5px; left: -14.5px;"></span>글쓰기
			</button><br><br>
            <!-- Table Styles Content -->
            <div class="table-responsive">
                <!--
                Available Table Classes:
                    'table'             - basic table
                    'table-bordered'    - table with full borders
                    'table-borderless'  - table with no borders
                    'table-striped'     - striped table
                    'table-condensed'   - table with smaller top and bottom cell padding
                    'table-hover'       - rows highlighted on mouse hover
                    'table-vcenter'     - middle align content vertically
                -->
                <table id="general-table" class="table table-striped table-bordered table-vcenter table-hover">
                    <thead>
                        <tr>
                            <!-- <th style="width: 80px;" class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></th> -->
                            <th style="width: 80px;" class="text-center">글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th style="width: 120px;">조회수</th>
                            <th>파일첨부</th>
                            <th style="width: 120px;" class="text-center">작성일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var = "meetingBoard" items="${list }">
                        <tr>
                            <td class="text-center">${meetingBoard.board_no }</td>
                            <td>
                            	<strong><a class='move' href='<c:out value="${meetingBoard.board_no}"/>'>
                            				<c:out value="${meetingBoard.title }" /><b> [  <c:out value="${meetingBoard.replyCnt}" />  ]</b>
                            </a>
                            <%-- <a href="detail.do?board_no=${meetingBoard.board_no }">${meetingBoard.title }</a> --%></strong></td>
                            
                            
                            <td>${meetingBoard.name }</td>
                            <td>${meetingBoard.read_count }</td>
                            <td><i class="fa fa-paperclip fa-2x text-muted"></i></td>
                            <td class="text-center">${meetingBoard.write_date }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- END Table Styles Content -->
        </div>
        <!-- END Table Styles Block -->
        
         <!-- Pagination Alignment -->
         
         <!-- <div class="text-right">
			<ul class="pagination">
			<li><a href="javascript:void(0)"><i class="fa fa-chevron-left"></i></a></li>
			<li><a href="javascript:void(0)">1</a></li>
			<li class="active"><a href="javascript:void(0)">2</a></li>
			<li><a href="javascript:void(0)">3</a></li>
			<li><a href="javascript:void(0)"><i class="fa fa-chevron-right"></i></a></li>
			</ul>
		</div> -->
		
		
		<div class="content-header">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div class="header-section">
						<form id='searchForm' action="/meetingboard/meetingBoardList" method='get'>
						
							<div class="form-group">
								<div class="col-md-3">
									<select id="example-select" name='type' class="form-control" size="1">
										<option value=""    <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
										<option value="T"   <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
										<option value="C"   <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
										<option value="W"   <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
										<option value="TC"  <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
										<option value="TW"  <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
										<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
									</select>
								</div>
							</div>
							
							
							<div class="col-md-6">
								<input type="text" id="search-term" name=keyword class="form-control" placeholder="검색 할 내용을 입력하세요." value='<c:out value="${pageMaker.cri.keyword}"/>' />
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
								<input type='hidden' name='amount'  value='<c:out value="${pageMaker.cri.amount}"/>'  />
							</div>
								
							<div class="text-center">
								<button type="submit" class="btn btn-effect-ripple btn-effect-ripple btn-primary"> 검색 </button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
         
        <div class="text-right">
			<ul class="pagination">
			
				<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					
			</ul>
		</div>
		
		<form id='actionForm' action="/meetingboard/meetingBoardList" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>
        
      
        
        
        
        
   
        
        
        
        
        
        
        
        
        
        
        
        
	

	
<script type="text/javascript">
$(document).ready(function () {
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click",
			function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
	
	$(".move").on("click",
			function(e) {

				e.preventDefault();
				actionForm.append("<input type='hidden' name='board_no' value='"+ $(this).attr("href")+ "'>");
				actionForm.attr("action", "/meetingboard/detailMeetingBoard");
				actionForm.submit();

			});
	
	$("#regBtn").on("click", function(){
		
		self.location = "/meetingboard/insertMeetingBoard";
		
	});
	
	
	
	
	
	
	
	
});




</script>
</body>

</html>