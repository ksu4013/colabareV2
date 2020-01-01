package cot.colabare.approval.mapper;

import java.util.List;

import cot.colabare.approval.domain.ApprovalCriteria;
import cot.colabare.approval.domain.ApprovalDto;

public interface ApprovalMapper {

	// 전자결재 문서 내용 입력
	public int insertApproval (ApprovalDto approvaldto);
	
	// 마지막 문서 번호
	public ApprovalDto lastNum();
	
	// 보낸 기안문서 목록 리스트
	public List<ApprovalDto> sentList(Long employee_no);
	
	// 보낸 기안문서 페이징
	//List<ApprovalDto> sentListPaging (ApprovalCriteria cri);
	
	// 글 목록 카운트
    //public int getTotalCount(int employee_no, ApprovalCriteria cri);
	
	// 받은 결재 상세 보기
	public ApprovalDto detailReceive(Long approval_no );
	
	// 반려 된 문서 리스트
	public List<ApprovalDto> rejectList(Long employee_no);
	
	// 결재 완료 된 문서 리스트
	public List<ApprovalDto> doneList(Long employee_no);
	
}
