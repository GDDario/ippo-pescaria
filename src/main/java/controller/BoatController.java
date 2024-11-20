/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Boat;
import service.BoatsService;
import util.DateUtil;

import java.io.IOException;
import java.util.ArrayList;

/**
 * @author acer
 */
public class BoatController extends HttpServlet {
    private final BoatsService service = new BoatsService();
    private final ObjectMapper objectMapper = DateUtil.configureObjectMapper();

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
        response.setContentType("application/json");

        if (request.getParameter("id") == null) {
            request.getSession().setAttribute("genericError", "O id é necessário para carregar os dados de um barco.");
            response.sendRedirect("index.jsp");
        }

        Boat boat = this.service.getBoatByUuid(request.getParameter("id"));
        String json = objectMapper.writeValueAsString(boat);

        response.getWriter().write(json);
    }
}