package com.alec.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alec.bean.Employee;
import com.alec.bean.Msg;
import com.alec.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

// import  Jackson Databind to convert returning value to JSON, using @ResponseBody
@Controller
public class EmployeeControllerWithJson {
	@Autowired
	EmployeeService employeeService;

	// 1-2-3, integrate single-deletion and multiple-deletion
	@ResponseBody
	@RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				del_ids.add(Integer.parseInt(id));
			}
			employeeService.deleteBatch(del_ids);
		} else {
			int id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();

	}

	@ResponseBody
	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);

	}

	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// using plug-in to do paging, here 3 means records per page
		PageHelper.startPage(pn, 3);
		List<Employee> employees = employeeService.getEmps();
		// using pageinfo to encapsulate query results and provide many methods
		// to display paging
		// here "3" means display successive 123 pages
		PageInfo pageInfo = new PageInfo(employees, 3);
		return Msg.success().add("pageInfo", pageInfo);
	}

	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	// employee automatic loads data from form
	// @Valid according to the @Pattern in the bean, BindingResult get
	// validation result
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				// fieldId is field name in bean, message is message in @Pattern
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.failure().add("errors", map);
		} else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkName", method = RequestMethod.POST)
	public Msg checkName(@RequestParam("empName") String empName) {

		// check name rules based on regular expression
		String reg = "^[a-zA-Z0-9_-]{3,16}$";
		if (!empName.matches(reg)) {
			return Msg.failure().add("va_msg", "3-16: a-z or A-Z or 0-9 or _ or -.");
		}
		// check repetitive name
		boolean b = employeeService.checkName(empName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.failure().add("va_msg", "This name has been used.");
		}
	}

}
