package com.alec.test;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alec.bean.Department;
import com.alec.bean.Employee;
import com.alec.dao.DepartmentMapper;
import com.alec.dao.EmployeeMapper;

// import spring test module , then use "autowired"
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	// get sqlSession and it can do batch based on applicationContext.xml
	SqlSession sqlSession;

	@Test
	public void testCRUD() {
		// departmentMapper.insertSelective(new Department(null,
		// "Development"));
		// departmentMapper.insertSelective(new Department(null, "Test"));

		// here gender is String type by generator even if this column is char
		// in database
		// employeeMapper.insertSelective(new Employee(null, "Alec", "M",
		// "alec@gmail.com", 1));

		// batch insert
		// EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		// for(int i = 0; i < 10; i++){
		// String uid = UUID.randomUUID().toString().substring(0, 5) + i;
		// mapper.insertSelective(new Employee(null, uid, "M", uid+
		// "@gmail.com",1));
		// }
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		for (Employee employee : list) {
			System.out
					.println(employee.getEmpName() + ":" + employee.getdId() + ":" + employee.getDepartment().getDeptName());
		}

		List<Department> list2 = departmentMapper.selectByExample(null);
		for (Department department : list2) {
			System.out.println(department.getDeptId() + "-----" + department.getDeptName());
		}

	}

}
