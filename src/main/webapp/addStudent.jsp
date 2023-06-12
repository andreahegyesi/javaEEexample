
<%@ page import="com.siit.studentRepoExample.Student, com.siit.studentRepoExample.JpaStudentRepository" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");

  Student student = new Student(name, email);

  JpaStudentRepository studentRepo = new JpaStudentRepository();
  studentRepo.addStudent(student);

%>

  <meta http-equiv="Refresh" content="0; url='/persistanceExample" />