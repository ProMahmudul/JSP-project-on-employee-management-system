<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file="header.jsp" %>
    <p><br></p>
    <div class="card card-body">
        <div class="d-flex justify-content-between mb-4">
            <h4 class="card-title">Employee Information</h4>
            <a href="addnew.jsp" class="btn btn-success">+ Add</a>
        </div>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Salary</th>
                <th class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            String host = "jdbc:mysql://localhost:3306/mydata";
            Connection conn = null;
            Statement stat = null;
            ResultSet res = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(host, "root","");
            stat = conn.createStatement();
            String data = "select * from employee order by id desc";
            res = stat.executeQuery(data);
            while(res.next()){
            %>
            <tr>
                <td><%=res.getString("employee_id")%></td>
                <td><%=res.getString("name")%></td>
                <td><%=res.getString("phone")%></td>
                <td><%=res.getString("email")%></td>
                <td><%=res.getString("address")%></td>
                <td><%=res.getString("designation")%></td>
                <td><%=res.getString("department")%></td>
                <td><%=res.getString("salary")%></td>
                <td>
                    <a href='edit.jsp?id=<%=res.getString("id")%>' class="btn btn-warning">Edit</a>
                    <a href='delete.jsp?id=<%=res.getString("id")%>' class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>
    <%@ include file="footer.jsp" %>
</html>