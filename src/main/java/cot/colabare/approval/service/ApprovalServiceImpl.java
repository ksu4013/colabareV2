package cot.colabare.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import cot.colabare.approval.domain.AEmployeeDto;
import cot.colabare.approval.domain.ApprovalCriteria;
import cot.colabare.approval.domain.ApprovalDto;
import cot.colabare.approval.domain.ApprovalViewerDto;
import cot.colabare.approval.domain.ApproverDto;
import cot.colabare.approval.mapper.AEmployeeMapper;
import cot.colabare.approval.mapper.ApprovalMapper;
import cot.colabare.approval.mapper.ApprovalVMapper;
import cot.colabare.approval.mapper.ApproverMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Setter(onMethod_ = @Autowired)
	private ApprovalMapper mapper; 
	
	@Setter(onMethod_ = @Autowired)
	private AEmployeeMapper Emapper;
	
	@Setter(onMethod_ = @Autowired)
	private ApproverMapper vermapper;
	
	@Setter(onMethod_ = @Autowired)
	private ApprovalVMapper Vmapper;
	
	// 전자결재 문서 내용 삽입
	@Override
	public int insertApproval(ApprovalDto approvaldto) {
		
		System.out.println("register......" + approvaldto);
		
		System.out.println("넘버 임 서비스임플: " + approvaldto.getApproval_no());
		
		return mapper.insertApproval(approvaldto);
		
	}

	@Override
	public List<AEmployeeDto> approvalM(String query) {
		System.out.println("서비스임플 : approvalM");
		
		String Aquery = "%"+ query + "%";
		
		return Emapper.approvalM(Aquery);
	}

	@Override
	public AEmployeeDto selectMem(Long employee_no) {
		
		System.out.println("AEmployeeDto 한 명 조회" + employee_no);
		
		return Emapper.selectMem(employee_no);
	}

	@Override
	public int insertApprover(ApproverDto apverDto) {
		
		System.out.println("서비스임플 : insertApprover" + apverDto);
		
		return vermapper.insertApprover(apverDto);
	}

	@Override
	public Long lastNum() {
		
		System.out.println("마지막 문서번호2");
		ApprovalDto juang = mapper.lastNum();
		System.out.println(juang);
		Long hi = juang.getApproval_no();
		System.out.println("넘버야 서비스 " + hi);
		
		return hi;
		
	}

	@Override
	public List<ApproverDto> approverList(Long approval_no) {
		System.out.println("approval서비스입플 approverList" + approval_no);
		
		return vermapper.approverList(approval_no);
	}

	@Override
	public int approverRemove(Long no) {
		
		System.out.println("서비스 임플  삭제 + " + no);
		
		return vermapper.approverRemove(no);
	}

	@Override
	public Long approvalNumSelect(Long no) {
		
		ApproverDto approvalNum = vermapper.approvalNumSelect(no);
		
		Long approvalNumSelect = approvalNum.getApproval_no();
		
		
		return approvalNumSelect;
	}

	@Override
	public int insertAppViewer(ApprovalViewerDto approvalV) {
		
		return Vmapper.insertAppViewer(approvalV);
	}

	@Override
	public List<ApprovalViewerDto> approvalVList(Long approval_no) {
		return Vmapper.approvalVList(approval_no);
	}

	@Override
	public int approvalVRemove(Long apprviewer) {
		return Vmapper.approvalVRemove(apprviewer);
	}

	@Override
	public Long approvalNumVSelect(Long apprviewer) {
		
		ApprovalViewerDto appVNum = Vmapper.approvalNumVSelect(apprviewer);
		
		Long approvalNumVSelect = appVNum.getApproval_no();
		
		
		return approvalNumVSelect;
	}

	@Override
	public List<ApprovalDto> sentList(Long employee_no) {
		
		return mapper.sentList(employee_no);
	}

	@Override
	public List<ApproverDto> receiveList(Long employee_no) {
		return vermapper.receiveList(employee_no);
	}

	@Override
	public ApprovalDto detailReceive( Long approval_no) {
		return mapper.detailReceive(approval_no);
	}

	@Override
	public int rejectApver(ApproverDto apverDto) {
		return vermapper.rejectApver(apverDto);
	}

	@Override
	public List<ApprovalDto> rejectList(Long employee_no) {
		return mapper.rejectList(employee_no);
	}

	@Override
	public List<ApprovalViewerDto> viewList(Long employee_no) {
		return Vmapper.viewList(employee_no);
	}

	@Override
	public int passApver(ApproverDto apverDto) {
		return vermapper.passApver(apverDto);
	}

	@Override
	public List<ApprovalDto> doneList(Long employee_no) {
		return mapper.doneList(employee_no);
	}

	@Override
	public String realDoneApver(Long approval_no) {
		return vermapper.realDoneApver(approval_no);
	}

	/*@Override
	public int getTotalCount(int employee_no, ApprovalCriteria cri) {
		return mapper.getTotalCount(employee_no, cri);
	}
*/


}
