package com.alec.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alec.bean.Employee;
import com.alec.bean.EmployeeExample;
import com.alec.bean.EmployeeExample.Criteria;
import com.alec.dao.EmployeeMapper;

@Service
public class EmployeeService {

	// inject interface, create proxy implementation object
	@Autowired
	EmployeeMapper employeeMapper;

	public List<Employee> getEmps() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);

	}

	public boolean checkName(String empName) {
		// TODO Auto-generated method stub
		// example is query condition
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		return employeeMapper.selectByPrimaryKey(id);
	}

	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);

	}

	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}
	
	
	public void deleteBatch(List<Integer> ids){
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		// delete from xxx where empId in ()
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
