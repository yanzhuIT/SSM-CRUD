package com.alec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alec.bean.Department;
import com.alec.bean.Msg;
import com.alec.service.DepartmentService;

@Controller
public class DepartmentControllerWithJson {
	
	@Autowired
	private DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts(){
		List<Department> departments = departmentService.getDepts(); 
		return Msg.success().add("depts", departments);
	}

}
