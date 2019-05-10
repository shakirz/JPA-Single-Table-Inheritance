/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.Employee;
import entities.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
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
@WebServlet(name = "Update", urlPatterns = {"/Update"})
public class Update extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("----- Servlet Update person -----");

        try (PrintWriter out = response.getWriter()) {

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("AdvancedMapping");
            /* Create EntityManager */
            EntityManager em = emf.createEntityManager();
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            String name = request.getParameter("nameNew");
            String address = request.getParameter("addressNew");
            String phone = request.getParameter("phoneNew");
            String email = request.getParameter("emailNew");
            String status = request.getParameter("statusNew");

            String statusOld = request.getParameter("statusNew");
            String nameOld = request.getParameter("nameOld");
            
            if (statusOld.equals("Student")) {                
                Student person = new Student();
                person = em.find(Student.class, nameOld);
                person.setName(name);
                person.setAddress(address);
                person.setPhone(phone);
                person.setEmail(email);
//                if(status.equals("Student")){
//                    person.
//                }
            } else {
                Employee person = new Employee();
                person = em.find(Employee.class, nameOld);
                person.setName(name);
                person.setAddress(address);
                person.setPhone(phone);
                person.setEmail(email);
            }
            
            transaction.commit();
            em.close();
            emf.close();

            RequestDispatcher dispatcher = request.getRequestDispatcher("/index");
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
