<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:query dataSource="jdbc/employees" var="result">
    SELECT * FROM employees
</sql:query>

<sql:query dataSource="jdbc/employees" var="employees">
    SELECT * FROM employees WHERE emp_no = ?
    <sql:param value="${param.emp_no}" />
</sql:query>

<!DOCTYPE html>
<!--update-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee</title>
</head>
<body>
<h1>Employee <c:out value="${param.emp_no}"/></h1>
<c:forEach var="e" items="${employees.rows}">
    <form action="employee-controller">
        <input type="hidden" name="cmd" value="u"/>
        <input type="hidden" name="emp_no" value='<c:out value="${e.emp_no}"/>'/>
        <table>
            <tr>
                <td>Birth Date</td>
                <td><input type="date" name="birth_date" value='<c:out value="${e.birth_date}"/>'></td>
            </tr>
            <tr>
                <td>Firstname</td>
                <td><input type="text" name="first_name" value='<c:out value="${e.first_name}"/>'></td>
            </tr>
            <tr>
                <td>Lastname</td>
                <td><input type="text" name="last_name" value='<c:out value="${e.last_name}"/>'></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <select name="gender" value='<c:out value="${e.gender}"/>'>
                        <c:if test = "${p.gender == 'M'}">

                        </c:if>
                        <c:choose>
                            <c:when test="${p.gender == 'M'}">
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                            </c:when>
                            <c:otherwise>
                                <option value="F">Female</option>
                                <option value="M">Male</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Hire Date</td>
                <td><input type="date" name="hire_date" value='<c:out value="${e.hire_date}"/>'></td>
            </tr>

            <td colspan="2">
                <input type="submit" value="Update">
            </td>
            </tr>
        </table>
    </form>
</c:forEach>

</body>
</html>