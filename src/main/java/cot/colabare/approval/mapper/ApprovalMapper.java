package cot.colabare.approval.mapper;

import cot.colabare.approval.domain.ApprovalDto;

public interface ApprovalMapper {

	// 전자결재 문서 내용 입력
	public int insertApproval (ApprovalDto approvaldto);
	
	
}
