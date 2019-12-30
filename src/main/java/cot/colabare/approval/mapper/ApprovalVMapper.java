package cot.colabare.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cot.colabare.approval.domain.ApprovalViewerDto;
import cot.colabare.approval.domain.ApproverDto;

public interface ApprovalVMapper {
	
	// 참조자 삽입
	public int insertAppViewer(ApprovalViewerDto approvalV);
	
	// 참조자 목록
	public List<ApprovalViewerDto> approvalVList (@Param("approval_no") Long approval_no);
	
	// 참조자 삭제
	public int approvalVRemove(Long apprviewer);
	
	// 참조자 글번호
	public ApprovalViewerDto approvalNumVSelect(Long apprviewer);

}
