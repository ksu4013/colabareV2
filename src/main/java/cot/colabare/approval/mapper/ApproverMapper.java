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
	
	// 내가 받은 결재 목록 
	public List<ApproverDto> receiveList(int employee_no);
	
	// 반려 
	public int rejectApver(ApproverDto apverDto);
	
	// 결재 
	public int passApver(ApproverDto apverDto);

	// 최종 결재 완료
	public String realDoneApver(Long approval_no);
}
