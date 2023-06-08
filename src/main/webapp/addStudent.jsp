
<%@ page import="com.siit.studentRepoExample.Student, com.siit.studentRepoExample.JdbcStudentRepository" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");

  Student student = new Student(name, email);

  JdbcStudentRepository studentRepo = new JdbcStudentRepository();

  studentRepo.addStudent(student);

%>

  <meta http-equiv="Refresh" content="0; url='/world" />