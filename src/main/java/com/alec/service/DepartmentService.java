package com.alec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alec.bean.Department;
import com.alec.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	@Autowired
    private DepartmentMapper departmentMapper;
	
	public List<Department> getDepts() {
		return departmentMapper.selectByExample(null);
	}
	 
	

}
