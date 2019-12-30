package cot.colabare.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cot.colabare.approval.domain.ApproverDto;

public interface ApproverMapper {

	// 결재자 등록
	public int insertApprover(ApproverDto apverDto);
	
	// 결재자 목록
	public List<ApproverDto> approverList (@Param("approval_no") Long approval_no);
	
	// 결재자 삭제
	public int approverRemove(Long no);
	
	// 해당 결재자 문서번호
	public ApproverDto approvalNumSelect(Long no);
}
