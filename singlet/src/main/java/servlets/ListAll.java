/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.Employee;
import entities.Person;
import entities.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Soma
 */
@WebServlet(name = "ListAll", urlPatterns = {"/ListAll"})
public class ListAll extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("----- Servlet List all persons -----");

        try (PrintWriter out = response.getWriter()) {

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("AdvancedMapping");
            /* Create EntityManager */
            EntityManager em = emf.createEntityManager();
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            
            Query query = em.createQuery("select p from Person p");
            List<Person> personList = new ArrayList<Person>();
            personList = query.getResultList();
            
            List<Student> studentList = new ArrayList<Student>();
            List<Employee> employeeList = new ArrayList<Employee>();
            
            for (int i = 0; i < personList.size(); i++) {
                if(personList.get(i).getClass().getName().equals("entities.Student")){
                    studentList.add((Student)personList.get(i));
                } else {
                    employeeList.add((Employee)personList.get(i));
                }
            }            
            transaction.commit();
            em.close();
            emf.close();

            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
//            request.setAttribute("personList", personList);
            request.setAttribute("studentList", studentList);
            request.setAttribute("employeeList", employeeList);
            dispatcher.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
