package com.siit.studentRepoExample;

import jakarta.persistence.*;

import java.util.List;

public class JpaStudentRepository {

    public List<Student> getAllStudents() {

        EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
        EntityManager entityManager = emFactory.createEntityManager();
        TypedQuery<Student> typedQuery = entityManager.createQuery("select s from Student s", Student.class);
        List<Student> studentList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return studentList;
//      Query query = entityManager.createNativeQuery("SELECT * FROM STUDENTS");
//        Query query = entityManager.createQuery("select s from Student s");
    }

//TODO  add method here to add a Student to the database

//TODO  add method here to find a Student in the database by name

//TODO  add method here to find a Student in the database by id

//TODO modify the JSP file to use the new methods instead of the JDBC one


}
