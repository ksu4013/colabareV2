package cot.colabare.approval.service;

import java.util.List;

import cot.colabare.approval.domain.AEmployeeDto;
import cot.colabare.approval.domain.ApprovalDto;

public interface ApprovalService {

	// 전자결재 문서 내 입력
	public void insertApproval(ApprovalDto approvaldto);
	
	// 결재자 검색
	public List<AEmployeeDto> approvalM(String query);
	
}
