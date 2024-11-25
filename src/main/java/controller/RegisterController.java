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
import model.User;
import service.AuthenticationService;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Objects;

/**
 * @author acer
 */
public class RegisterController extends HttpServlet {

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

            User serviceResponse = authenticationService.register(registerDTO);


            if (serviceResponse.getName().isEmpty()) {
                request.getSession().setAttribute("genericError", "Não foi possível realizar o cadastro.");
                response.sendRedirect("index.jsp?openRegisterModal=true");
                return;
            }

            HttpSession session = request.getSession();

            System.out.println("??");
            System.out.println(serviceResponse.getId());
            System.out.println(serviceResponse.getName());
            session.setAttribute("id", serviceResponse.getId());
            session.setAttribute("name", serviceResponse.getName());
            session.setAttribute("isLoggedIn", true);

            response.sendRedirect("index.jsp?register_success=true");
            return;

        } catch (EmailAlreadyRegisteredException | IllegalArgumentException e) {
            request.getSession().setAttribute("emailError", e.getMessage());
        } catch (InvalidPasswordConfirmationException e) {
            request.getSession().setAttribute("passwordConfirmationError", e.getMessage());
        }

        // Redireciona para index bckp.jsp em caso de erro ou exceção
        response.sendRedirect("index.jsp?openRegisterModal=true");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
