package com.siit.studentRepoExample;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

public class JpaStudentRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Student> getAllStudents() {
        TypedQuery<Student> typedQuery = entityManager.createQuery("select s from Student s", Student.class);
        List<Student> studentList = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return studentList;
//      Query query = entityManager.createNativeQuery("SELECT * FROM STUDENTS");
//        Query query = entityManager.createQuery("select s from Student s");
    }

//TODO  add method here to add a Student to the database
    public void addStudent(Student student){
        entityManager.getTransaction().begin();
        entityManager.persist(student);
        entityManager.getTransaction().commit();
        entityManager.close();
        emFactory.close();
    }

//TODO  add method here to find a Student in the database by name

    public List<Student> findStudentByName(String findName){
        //TypedQuery<Student> typedQuery = entityManager.createQuery(("select s from Student s WHERE s.name = '" + findName + "'"), Student.class);
        TypedQuery<Student> typedQuery = entityManager.createQuery(("select s from Student s WHERE s.name LIKE '%" + findName + "%'"), Student.class);
        List<Student> studentListByNames = typedQuery.getResultList();
        entityManager.close();
        emFactory.close();
        return studentListByNames;
    }

//TODO  add method here to find a Student in the database by id
public Student findStudentById(int findId){
    Student student = entityManager.find(Student.class, findId);
    entityManager.close();
    emFactory.close();
    return student;
}

//TODO modify the JSP file to use the new methods instead of the JDBC one


}
