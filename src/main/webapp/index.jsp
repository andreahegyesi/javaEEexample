<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.siit.studentRepoExample.JdbcStudentRepository" %>
<%@ page import="com.siit.studentRepoExample.JpaStudentRepository" %>
<%@ page import="com.siit.studentRepoExample.Student" %>
<html>

 <head>
    <!-- This will make the table look nicer -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Very nice student list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
  </head>
<body>
    <h1>Student List from the index.jsp file</h1>
    <table border="1" class="table table-dark w-25 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>
        <%
       //     JdbcStudentRepository repository = new JdbcStudentRepository();
            JpaStudentRepository repository = new JpaStudentRepository();
            List<Student> students = repository.getAllStudents();
            for (Student student : students) {
        %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() %></td>
            </tr>
        <% } %>
    </table>

<br/>
<br/>
<h1>Add a student</h1>

    <form action="addStudent.jsp">
        <div class="form-outline mb-4">
            <input type="text" name="name" value="Name..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="email"  value="Email ID..." onclick="this.value=''"/><br/>
        </div>

    <br/>
    <input type="submit" value="Add student" class="btn btn-primary btn-block"/>
    </form>

</body>
</html>
