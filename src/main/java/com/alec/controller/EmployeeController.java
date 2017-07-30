package com.alec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.alec.bean.Employee;
import com.alec.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// using plug-in to do paging, here 3 means records per page
		PageHelper.startPage(pn, 3);
		List<Employee> employees = employeeService.getEmps();
		// using pageinfo to encapsulate query results and provide many methods
		// to display paging
		// here "3" means display successive 123 pages
		PageInfo pageInfo = new PageInfo(employees, 3);
		model.addAttribute("pageInfo", pageInfo);
		return "list";

	}
}
