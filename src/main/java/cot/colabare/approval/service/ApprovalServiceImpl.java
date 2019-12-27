package cot.colabare.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.approval.domain.AEmployeeDto;
import cot.colabare.approval.domain.ApprovalDto;
import cot.colabare.approval.mapper.AEmployeeMapper;
import cot.colabare.approval.mapper.ApprovalMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Setter(onMethod_ = @Autowired)
	private ApprovalMapper mapper; 
	
	@Setter(onMethod_ = @Autowired)
	private AEmployeeMapper Emapper;
	
	// 전자결재 문서 내용 삽입
	@Override
	public void insertApproval(ApprovalDto approvaldto) {
		
		System.out.println("register......" + approvaldto);
		
		mapper.insertApproval(approvaldto);
		
		System.out.println("넘버 : " + approvaldto.getApproval_no());
		
	}

	@Override
	public List<AEmployeeDto> approvalM(String query) {
		System.out.println("서비스임플 : approvalM");
		
		String Aquery = "%"+ query + "%";
		
		
		
		return Emapper.approvalM(Aquery);
	}

}
