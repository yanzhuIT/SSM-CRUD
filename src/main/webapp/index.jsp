<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee list</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- update employee modal -->
	<div class="modal fade" id="updateEmpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Update employee</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_update_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="email_update_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="M"
									checked="checked"> Male
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="F">
									Female
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="dept_update_select" class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_udpate_select"></select>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
				</div>
			</div>
		</div>
	</div>

	<!-- add employee modal -->
	<div class="modal fade" id="addEmpModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add a new employee</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="empName"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_add_input" placeholder="email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="M"
									checked="checked"> Male
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="F"> Female
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="dept_add_select" class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_select"></select>
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<!-- title -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- two buttons -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">Add</button>
				<!-- delete all items on current page -->
				<button class="btn btn-danger" id="emp_delete_all_btn">Delete</button>
			</div>
		</div>
		<!-- display data  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>operation</th>
						</tr>
					</thead>

					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- display pageing -->
		<div class="row">
			<!-- paging information -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- page navigation -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<!-- after loading, get paging information -->
	<script type="text/javascript">
		var totalRecords;
		var currentPage;
		$(function() {
			toPage(1);
		});

		function toPage(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					// console.log(result);
					// display table data
					build_emps_table(result);
					// display paging data
					build_page_info(result);
					// display paging navigation
					build_page_nav(result);
				}
			});
		}
		function build_emps_table(result) {
			// clear all current content
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$
					.each(
							emps,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empINameTd = $("<td></td>").append(
										item.empName);
								var empGenderTd = $("<td></td>").append(
										item.gender == "M" ? "Male" : "Female");
								var empEmailTd = $("<td></td>").append(
										item.email);
								var empDeptNameTd = $("<td></td>").append(
										item.department.deptName);
								// edit_btn for "all" edit button
								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil"))
										.append("Edit");
								editBtn.attr("edit_id", item.empId);
								// delete_btn for "all" delete button
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("Delete");
								delBtn.attr("delete_id", item.empId);
								var btnTd = ($("<td></td>")).append(editBtn)
										.append(" ").append(delBtn);
								$("<tr></tr>").append(checkBoxTd).append(
										empIdTd).append(empINameTd).append(
										empGenderTd).append(empEmailTd).append(
										empDeptNameTd).append(btnTd).appendTo(
										"#emps_table tbody");
							});
		}

		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"current No." + result.extend.pageInfo.pageNum + ", total "
							+ result.extend.pageInfo.pages + ", total "
							+ result.extend.pageInfo.total + " records");
			totalRecords = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}

		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul><ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("First").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {

				firstPageLi.click(function() {
					toPage(1);
				})
				prePageLi.click(function() {
					toPage(result.extend.pageInfo.pageNum - 1);
				})

			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href", "#"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("Last").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {

				nextPageLi.click(function() {
					toPage(result.extend.pageInfo.pageNum + 1)
				})
				lastPageLi.click(function() {
					toPage(result.extend.pageInfo.pages);
				})

			}

			ul.append(firstPageLi).append(prePageLi);
			// 1,2,3       2,3,4       3,4,5
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					toPage(item);
				})
				ul.append(numLi);
			})
			ul.append(nextPageLi).append(lastPageLi);
			$("<nav></nav>").append(ul).appendTo("#page_nav_area");
		}

		// add modal
		$("#emp_add_modal_btn").click(
				function() {
					$("#addEmpModal form")[0].reset();
					$("#addEmpModal form").find("*").removeClass(
							"has-success has-error");
					$("#addEmpModal form").find(".help-block").text("");
					getDepts("#dept_add_select");
					$("#addEmpModal").modal({
						backdrop : "static"
					});
				});

		// find all departments
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					$.each(result.extend.depts, function() {
						// if function has no params, "this" means current traversal dept
						var optionEl = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);
						optionEl.appendTo(ele);
					});
				}
			});
		}
		// use regular expression to verify input
		function validate_add_form() {
			// verify name 
			var empName = $("#empName_add_input").val();
			var regName = /^[a-zA-Z0-9_-]{3,16}$/;
			if (!regName.test(empName)) {
				//alert("6-16 a-z or A-Z or 0-9 or _ or -");
				$("#empName_add_input").parent().removeClass(
						"has-success has-error");
				$("#empName_add_input").parent().addClass("has-error");
				$("#empName_add_input").next("span").text(
						"3-16: a-z or A-Z or 0-9 or _ or -.");
				return false;
			} else {
				$("#empName_add_input").parent().removeClass(
						"has-success has-error");
				$("#empName_add_input").parent().addClass("has-success");
				$("#empName_add_input").next("span").text("");
			}
			// verify the email input at front end 
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				$("#email_add_input").parent().removeClass(
						"has-success has-error");
				$("#email_add_input").parent().addClass("has-error");
				$("#email_add_input").next("span").text(
						"Please input right email form.");
				return false;
			} else {
				$("#email_add_input").parent().removeClass(
						"has-success has-error");
				$("#email_add_input").parent().addClass("has-success");
				$("#email_add_input").next("span").text("");
			}
			return true;
		}

		// find repetitive name and wrong form in server
		$("#empName_add_input").change(
				function() {
					var empName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkName",
						data : "empName=" + empName,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								$("#empName_add_input").parent().removeClass(
										"has-success has-error");
								$("#empName_add_input").parent().addClass(
										"has-success");
								$("#empName_add_input").next("span").text(
										"This name is available.");
								$("#emp_save_btn").attr("ajax-va", "success");
							} else {
								$("#empName_add_input").parent().removeClass(
										"has-success has-error");
								$("#empName_add_input").parent().addClass(
										"has-error");
								$("#empName_add_input").next("span").text(
										result.extend.va_msg);
								$("#emp_save_btn").attr("ajax-va", "failure");
							}
						}
					});

				});

		// save a new employee
		$("#emp_save_btn").click(
				function() {
					if (!validate_add_form()) {
						return false;
					}

					if ($(this).attr("ajax-va") == "failure") {
						return false;
					}
					$.ajax({
						url : "${APP_PATH}/emp",
						type : "POST",
						// modal window has just one form, using serialize() to sent data from form
						data : $("#addEmpModal form").serialize(),
						success : function(result) {
							if (result.code == 100) {
								// close the modal window
								$("#addEmpModal").modal('hide');
								// go to last page to display the new record
								// totalRecords >= total pages, so based on plug-in rules, it goes to the last page
								toPage(totalRecords);
							} else {
								if (undefined != result.extend.errors.email) {
									$("#email_add_input").parent().removeClass(
											"has-success has-error");
									$("#email_add_input").parent().addClass(
											"has-error");
									$("#email_add_input").next("span").text(
											result.extend.errors.email);
								}
								if (undefined != result.extend.errors.empName) {
									$("#empName_add_input").parent()
											.removeClass(
													"has-success has-error");
									$("#empName_add_input").parent().addClass(
											"has-error");
									$("#empName_add_input").next("span").text(
											result.extend.errors.empName);
								}
							}
						}
					});
				});

		// "live" method is not available for new JQuery
		// to bind click with a button after loading, use "on" method like below
		$(document).on("click", ".edit_btn", function() {
			// alert("hello");
			getEmp($(this).attr("edit_id"));
			getDepts("#updateEmpModal select");
			// give the id to the edit button
			$("#emp_update_btn").attr("update_id", $(this).attr("edit_id"));
			$("#updateEmpModal").modal({
				backdrop : "static"
			});

		});

		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#updateEmpModal input[name=gender]").val(
							[ empData.gender ]);
					$("#updateEmpModal select").val([ empData.dId ]);
				}
			})
		}

		$("#emp_update_btn")
				.click(
						function() {
							var email = $("#email_update_input").val();
							var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
							if (!regEmail.test(email)) {
								$("#email_update_input").parent().removeClass(
										"has-success has-error");
								$("#email_update_input").parent().addClass(
										"has-error");
								$("#email_update_input").next("span").text(
										"Please input right email form.");
								return false;
							} else {
								$("#email_update_input").parent().removeClass(
										"has-success has-error");
								$("#email_update_input").parent().addClass(
										"has-success");
								$("#email_update_input").next("span").text("");
							}
							// return true;
							$.ajax({
								url : "${APP_PATH}/emp/"
										+ $(this).attr("update_id"),
								// post can be converted to put
								type : "PUT",
								data : $("#updateEmpModal form").serialize(),
								success : function(result) {
									// alert(result.msg);
									$("#updateEmpModal").modal("hide");
									toPage(currentPage);
								}
							});
						});

		// delete one employee
		$(document).on("click", ".delete_btn", function() {
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			//alert($(this).parents("tr").find("td:eq(1)").text());
			// popup confirm window
			if (confirm("Confirm to delete " + empName + "?")) {
				$.ajax({
					url : "${APP_PATH}/emp/" + $(this).attr("delete_id"),
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						toPage(currentPage);
					}
				});
			}

		});

		// select all items or cancel for "check_all" 
		$("#check_all").click(function() {
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		// for "check_item"
		$(document)
				.on(
						"click",
						".check_item",
						function() {
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);

						});

		$("#emp_delete_all_btn").click(
				function() {
					var empNames = "";
					var del_ids = "";
					$.each($(".check_item:checked"), function() {
						empNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ", ";
						// get the ids together by "-"
						del_ids += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					// delete the last ","
					empNames = empNames.substring(0, empNames.length - 2);
					// delete the last "-"
					del_ids = del_ids.substring(0, del_ids.length - 1);
					if (confirm("Confirm to delete " + empNames + " ?")) {
						$.ajax({
							url : "${APP_PATH}/emp/" + del_ids,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								toPage(currentPage);
							}
						});

					}
				});
	</script>
</body>
</html>
