<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <%@ include file="header.jsp" %>
    <p><br></p>
    <%
        String host = "jdbc:mysql://localhost:3306/mydata";
        Connection conn = null;
        Statement stat = null;
        ResultSet res = null;
        PreparedStatement stmt = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(host, "root", "");
    %>
    <form action="" method="post" class="card card-body">
        <div class="d-flex justify-content-between">
            <h4 class="card-title">Update Employee Information</h4>
            <a href="index.jsp" class="btn btn-success">Back</a>
        </div>
        <hr>
        <%

        stat = conn.createStatement();
        String u = request.getParameter("id");
        int num = Integer.parseInt(u);
        String data = "select * from employee where id ='"+num+"'";
        res = stat.executeQuery(data);
        while(res.next()){
        %>
        <input type="hidden" name="id" value='<%= res.getString("id") %>'>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="employee_id">Employee Id</label>
                <input type="text" class="form-control" name="employee_id" id="employee_id" value='<%= res.getString("employee_id") %>'>
            </div>
            <div class="form-group col-md-6">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="name" id="name" value='<%= res.getString("name") %>'>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" name="phone" id="phone" value='<%= res.getString("phone") %>'>
            </div>
            <div class="form-group col-md-6">
                <label for="email">Email</label>
                <input type="text" class="form-control" name="email" id="email" value='<%= res.getString("email") %>'>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="address">Address</label>
                <textarea name="address" class="form-control" id="address" cols="20" rows="4"><%= res.getString("address") %></textarea>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="designation">Designation</label>
                    <input type="text" class="form-control" name="designation" id="designation" value='<%= res.getString("designation") %>'>
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text" class="form-control" name="department" id="department" value='<%= res.getString("department") %>'>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="salary">Salary</label>
                <input type="text" class="form-control" name="salary" id="salary" value='<%= res.getString("salary") %>'>
            </div>
            <div class="col-md-6 text-center">
                <div class="my-md-4"></div>
                <button type="submit" class="btn btn-warning">Update</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </div>        
        <%
        }
        %>
    </form>
    <%@ include file="footer.jsp" %>
</html>
<%

String id = request.getParameter("id");
String employee_id = request.getParameter("employee_id");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String address = request.getParameter("address");
String designation = request.getParameter("designation");
String department = request.getParameter("department");
String salary = request.getParameter("salary");
if(id!=null && employee_id!=null && name!=null && phone!=null && email!=null && address!=null && designation!=null && department!=null && salary!=null){
    String query = "update employee set employee_id=?, name=?, phone=?, email=?, address=?, designation=?, department=?, salary=? where id='"+id+"'";
    stmt = conn.prepareStatement(query);
    stmt.setString(1, employee_id);
    stmt.setString(2, name);
    stmt.setString(3, phone);
    stmt.setString(4, email);
    stmt.setString(5, address);
    stmt.setString(6, designation);
    stmt.setString(7, department);
    stmt.setString(8, salary);
    stmt.executeUpdate();
    response.sendRedirect("index.jsp");
}

%>