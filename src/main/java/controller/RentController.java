/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.RentDateRangeDTO;
import dto.UserRentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.RentService;
import util.DateUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 * @author acer
 */
public class RentController extends HttpServlet {
    private final RentService service = new RentService();
    private final ObjectMapper objectMapper = DateUtil.configureObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getParameter("selected-rent-dates"));
        System.out.println(request.getParameter("user-description"));
        System.out.println(request.getParameter("boat-id"));

        String[] split = request.getParameter("selected-rent-dates").split(",");

        HttpSession session = request.getSession();

        try {
            RentDateRangeDTO dto = new RentDateRangeDTO(
                    LocalDate.parse(split[0]),
                    LocalDate.parse(split[1])
            );
            String description = request.getParameter("user-description");
            String boatUuid = request.getParameter("boat-id");

            boolean serviceResponse = service.registerRent(dto, description, (Integer) session.getAttribute("id"), boatUuid);

            if (!serviceResponse) {
                request.getSession().setAttribute("genericError", "Não foi possível realizar o cadastro.");
            }

            session.setAttribute("success", true);

            response.sendRedirect("boat.jsp?id=" + boatUuid + "&rent_success=true");
            return;

        } catch (IllegalArgumentException e) {
            request.getSession().setAttribute("success", false);
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int userId = (Integer) session.getAttribute("id");

        ArrayList<UserRentDTO> rents = this.service.getUserRents(userId);
        String json = objectMapper.writeValueAsString(rents);

        response.getWriter().write(json);
    }

}