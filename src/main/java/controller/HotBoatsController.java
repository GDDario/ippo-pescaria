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

import java.io.IOException;
import java.util.ArrayList;

/**
 * @author acer
 */
public class HotBoatsController extends HttpServlet {
    private final BoatsService service = new BoatsService();
    private final ObjectMapper objectMapper = new ObjectMapper();

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

        ArrayList<Boat> categories = this.service.getHotBoats();
        String json = objectMapper.writeValueAsString(categories);
        System.out.println("Returning json: " + json);

        response.getWriter().write(json);
    }
}