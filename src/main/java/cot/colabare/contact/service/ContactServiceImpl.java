package cot.colabare.contact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cot.colabare.contact.domain.ContactEmplDto;
import cot.colabare.contact.mapper.ContactMapper;
import cot.colabare.profile.domain.Criteria;
import lombok.Setter;

@Service
public class ContactServiceImpl implements ContactService {

	@Setter(onMethod_=@Autowired)
	private ContactMapper mapper;
	
	@Override 
	public List<ContactEmplDto> contactListService(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getContactList(cri);
	}

	@Override
	public ContactEmplDto contactService(int employee_no) {
		// TODO Auto-generated method stub
		return mapper.getContact(employee_no);
	}

}
