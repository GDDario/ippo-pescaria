/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.GetFiltersDTO;
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
public class FiltersController extends HttpServlet {
    private final BoatsService service = new BoatsService();
    private final ObjectMapper objectMapper = DateUtil.configureObjectMapper();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        GetFiltersDTO dto = this.service.getFilters();
        String json = objectMapper.writeValueAsString(dto);

        response.getWriter().write(json);
    }
}