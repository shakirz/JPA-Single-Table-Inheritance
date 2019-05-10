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
@WebServlet(name = "DeletePerson", urlPatterns = {"/DeletePerson"})
public class DeletePerson extends HttpServlet {

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
        
        System.out.println("----- Servlet Delete person -----");

        try (PrintWriter out = response.getWriter()) {

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("AdvancedMapping");
            /* Create EntityManager */
            EntityManager em = emf.createEntityManager();
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();

            String name = request.getParameter("nameDel");
//            String address = request.getParameter("addressDel");
//            String phone = request.getParameter("phoneDel");
//            String email = request.getParameter("emailDel");
            String status = request.getParameter("statusDel");

            if (status.equals("Student")) {
                
                Student person = new Student();
//                person.setName(name);
//                person.setAddress(address);
//                person.setPhone(phone);
//                person.setEmail(status);
                person = em.find(Student.class, name);
                
//                System.out.println("==============" + personToRemove);
                em.remove(person);
            } else {
                Employee person = new Employee();
//                person.setName(name);
//                person.setAddress(address);
//                person.setPhone(phone);
//                person.setEmail(status);
                person = em.find(Employee.class, name);
                em.remove(person);
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
