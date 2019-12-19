package cot.colabare.master.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EmployeePageDto {
	private int employeecnt;
	private List<EmplDepPosDto> employeelist;
}
