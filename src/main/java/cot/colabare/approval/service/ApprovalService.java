package cot.colabare.approval.service;

import java.util.List;

import cot.colabare.approval.domain.AEmployeeDto;
import cot.colabare.approval.domain.ApprovalCriteria;
import cot.colabare.approval.domain.ApprovalDto;
import cot.colabare.approval.domain.ApprovalViewerDto;
import cot.colabare.approval.domain.ApproverDto;

public interface ApprovalService {

	// 전자결재 문서 내 입력
	public int insertApproval(ApprovalDto approvaldto);
	
	// 결재자 검색
	public List<AEmployeeDto> approvalM(String query);
	
	// 검색 결과
	public AEmployeeDto selectMem(Long employee_no);
	
	// 결재자 삽입
	public int insertApprover(ApproverDto apverDto);
	
	// 마지막 문서번호
	public Long lastNum();
	
	// 결재자 목록
	public List<ApproverDto> approverList (Long approval_no);
	
	// 결재자 삭제
	public int approverRemove(Long no);
	
	// 해당 결재자 문서 번호
	public Long approvalNumSelect(Long no);
	
	// 참조자 삽입
	public int insertAppViewer(ApprovalViewerDto approvalV);
	
	// 참조자 목록
	public List<ApprovalViewerDto> approvalVList (Long approval_no);
	
	// 참조자 삭제
	public int approvalVRemove(Long apprviewer);
	
	// 해당 결재자 문서 번호
	public Long approvalNumVSelect(Long apprviewer);
	
	// 보낸 기안문서 목록
	public List<ApprovalDto> sentList(ApprovalCriteria cri);
}
