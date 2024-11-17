/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dto.RegisterDTO;
import exception.EmailAlreadyRegisteredException;
import exception.InvalidPasswordConfirmationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.AuthenticationService;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Objects;

/**
 * @author acer
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthenticationService authenticationService = new AuthenticationService();

        try {
            RegisterDTO registerDTO = RegisterDTO.builder()
                    .setName(request.getParameter("name"))
                    .setEmail(request.getParameter("email"))
                    .setBirthDate(request.getParameter("birth-date"))
                    .setPassword(request.getParameter("password"))
                    .setPasswordConfirmation(request.getParameter("password-confirmation"))
                    .build();

            System.out.println("name " + request.getParameter("name"));
            System.out.println("Email " + request.getParameter("email"));
            System.out.println("birth-date " + request.getParameter("birth-date"));
            System.out.println("password " + request.getParameter("password"));
            System.out.println("password-confirmation " + request.getParameter("password-confirmation"));

            boolean serviceResponse = authenticationService.register(registerDTO);

            if (!serviceResponse) {
                request.getSession().setAttribute("genericError", "Não foi possível realizar o cadastro.");
            }

            HttpSession session = request.getSession();

            session.setAttribute("username", request.getParameter("name"));
            session.setAttribute("isLoggedIn", true);

            response.sendRedirect("index.jsp");
            return;

        } catch (EmailAlreadyRegisteredException | IllegalArgumentException e) {
            request.getSession().setAttribute("emailError", e.getMessage());
        } catch (InvalidPasswordConfirmationException e) {
            request.getSession().setAttribute("passwordConfirmationError", e.getMessage());
        }

        // Redireciona para index bckp.jsp em caso de erro ou exceção
        response.sendRedirect("index.jsp?openRegisterModal=true");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
