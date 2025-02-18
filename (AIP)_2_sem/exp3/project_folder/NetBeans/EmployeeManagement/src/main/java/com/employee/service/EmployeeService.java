/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.employee.service;

import com.employee.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import java.util.List;

/**
 *
 * @author Abhis
 */
public class EmployeeService {

    private static final SessionFactory factory;

    static {
        factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).buildSessionFactory();
    }

    public static void saveEmployee(Employee employee) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.save(employee);
        transaction.commit();
    }

    public static List<Employee> getAllEmployees() {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        List<Employee> employees;
        employees = session.createQuery("from Employee", Employee.class).getResultList();
        transaction.commit();
        return employees;
    }

    public Employee getEmployee(int employeeId) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Employee employee = session.get(Employee.class, employeeId);
        transaction.commit();
        return employee;
    }

    public void updateEmployee(Employee employee) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        session.update(employee);
        transaction.commit();
    }

    public void deleteEmployee(int employeeId) {
        Session session = factory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        Employee employee = session.get(Employee.class, employeeId);
        session.delete(employee);
        transaction.commit();
    }
}
