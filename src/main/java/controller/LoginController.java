/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dto.LoginDTO;
import exception.InvalidEmailException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.AuthenticationService;
import vo.Email;

import java.io.IOException;

/**
 * @author acer
 */
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthenticationService authenticationService = new AuthenticationService();

        try {
            LoginDTO loginDTO = new LoginDTO(
                    new Email(request.getParameter("email")),
                    request.getParameter("password")
            );

            System.out.println("Email " + request.getParameter("email"));
            System.out.println("Password " + request.getParameter("password"));

            String serviceResponse = authenticationService.login(loginDTO);

            if (serviceResponse.isEmpty()) {
                request.getSession().setAttribute("genericError", "Não foi possível realizar o login.");

                response.sendRedirect("index.jsp?openLoginModal=true");
            } else {
                HttpSession session = request.getSession();

                session.setAttribute("username", serviceResponse);
                session.setAttribute("isLoggedIn", true);

                response.sendRedirect("index.jsp");
            }

        } catch (IllegalArgumentException | InvalidEmailException e){
            request.getSession().setAttribute("emailError", e.getMessage());
            response.sendRedirect("index.jsp?openLoginModal=true");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
