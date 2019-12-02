<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <%@ include file="header.jsp" %>
    <p><br></p>
    <form action="" method="post" class="card card-body">
        <div class="d-flex justify-content-between">
            <h4 class="card-title">Add new Employee</h4>
            <a href="index.jsp" class="btn btn-success">Back</a>
        </div>
        <hr>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="employee_id">Employee Id</label>
                <input type="text" class="form-control" name="employee_id" id="employee_id" placeholder="Employee Id" required>
            </div>
            <div class="form-group col-md-6">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Employee Name" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" name="phone" id="phone" placeholder="Employee Phone" required>
            </div>
            <div class="form-group col-md-6">
                <label for="email">Email</label>
                <input type="text" class="form-control" name="email" id="email" placeholder="Employee Email" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="address">Address</label>
                <textarea name="address" class="form-control" id="address" cols="20" rows="4" placeholder="Employee Address" required></textarea>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="designation">Designation</label>
                    <input type="text" class="form-control" name="designation" id="designation" placeholder="Employee designation" required>
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text" class="form-control" name="department" id="department" placeholder="Employee Department" required>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="salary">Salary</label>
                <input type="text" class="form-control" name="salary" id="salary" placeholder="Employee Salary" required>
            </div>
            <div class="col-md-6 text-center">
                <div class="my-md-4"></div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </div>
    </form>
    <%@ include file="footer.jsp" %>
</html>
<%

String employee_id = request.getParameter("employee_id");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String address = request.getParameter("address");
String designation = request.getParameter("designation");
String department = request.getParameter("department");
String salary = request.getParameter("salary");
String host = "jdbc:mysql://localhost:3306/mydata";
Connection conn = null;
PreparedStatement stat = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(employee_id!=null && name!=null && phone!=null && email!=null && address!=null && designation!=null && department!=null && salary!=null){
    conn = DriverManager.getConnection(host, "root", "");
    String data = "insert into employee(employee_id, name, phone, email, address, designation, department, salary) values(?, ?, ?, ?, ?, ?, ?, ?)";
    stat = conn.prepareStatement(data);
    stat.setString(1, employee_id);
    stat.setString(2, name);
    stat.setString(3, phone);
    stat.setString(4, email);
    stat.setString(5, address);
    stat.setString(6, designation);
    stat.setString(7, department);
    stat.setString(8, salary);
    stat.executeUpdate();
    response.sendRedirect("index.jsp");
}

%>