package cot.colabare.contact.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cot.colabare.contact.domain.ContactEmplDto;
import cot.colabare.profile.domain.Criteria;

@Service
public interface ContactService {
	public List<ContactEmplDto> contactListService(Criteria cri);
	public ContactEmplDto contactService(int employee_no);
}
