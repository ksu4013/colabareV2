package cot.colabare.contact.mapper;

import java.util.List;

import cot.colabare.contact.domain.ContactEmplDto;
import cot.colabare.profile.domain.Criteria;

public interface ContactMapper {
	List<ContactEmplDto> getContactList(Criteria cri);
	ContactEmplDto getContact(int employee_no);
}
