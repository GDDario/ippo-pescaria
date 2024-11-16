/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.FindBoatsByFilterDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Boat;
import service.BoatsService;
import util.DateUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

/**
 * @author acer
 */
public class FilteredBoatsController extends HttpServlet {
    private final BoatsService service = new BoatsService();
    private ObjectMapper objectMapper = DateUtil.configureObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        FindBoatsByFilterDTO filters = this.extractFilters(request);

        List<Boat> filteredBoats = service.getBoatsByFilters(filters);

        String jsonResponse = objectMapper.writeValueAsString(filteredBoats);

        response.getWriter().write(jsonResponse);
    }

    private FindBoatsByFilterDTO extractFilters(HttpServletRequest request) {
        String categoryUuids = request.getParameter("categoryUuids").trim();
        String equipmentsArray = request.getParameter("equipmentsArray").trim();

        double minLength = Double.parseDouble(request.getParameter("minLength"));
        double maxLength = Double.parseDouble(request.getParameter("maxLength"));
        double minPricePerDay = Double.parseDouble(request.getParameter("minPricePerDay"));
        double maxPricePerDay = Double.parseDouble(request.getParameter("maxPricePerDay"));
        int minCapacity = Integer.parseInt(request.getParameter("minCapacity"));
        int maxCapacity = Integer.parseInt(request.getParameter("maxCapacity"));
        double minEnginePower = Double.parseDouble(request.getParameter("minEnginePower"));
        double maxEnginePower = Double.parseDouble(request.getParameter("maxEnginePower"));
        int minCabinsNumber = Integer.parseInt(request.getParameter("minCabinsNumber"));
        int maxCabinsNumber = Integer.parseInt(request.getParameter("maxCabinsNumber"));

        int manufacturerStartDate = Integer.parseInt(request.getParameter("manufacturerStartDate"));
        int manufacturerEndDate = Integer.parseInt(request.getParameter("manufacturerEndDate"));

        ArrayList<UUID> categoryUuidList = new ArrayList<>();
        if (categoryUuids != null && !categoryUuids.trim().isEmpty()) {
            String[] uuidArray = categoryUuids.trim().split(",");
            for (String uuidString : uuidArray) {
                try {
                    if (!uuidString.trim().isEmpty()) {
                        categoryUuidList.add(UUID.fromString(uuidString.trim()));
                    }
                } catch (IllegalArgumentException e) {
                    System.out.println("Warning: Invalid UUID string encountered: " + uuidString);
                }
            }
        }

        // Processar equipmentsArray
        ArrayList<String> equipmentsList = new ArrayList<>();
        if (equipmentsArray != null && !equipmentsArray.trim().isEmpty()) {
            String[] equipmentArray = equipmentsArray.trim().split(",");
            for (String equipment : equipmentArray) {
                if (!equipment.trim().isEmpty() && !equipment.equals("[]")) {
                    equipmentsList.add(equipment.trim());
                }
            }
        }

        FindBoatsByFilterDTO filterDTO = new FindBoatsByFilterDTO(
                categoryUuidList,
                equipmentsList,
                minLength,
                maxLength,
                minPricePerDay,
                maxPricePerDay,
                minCapacity,
                maxCapacity,
                minEnginePower,
                maxEnginePower,
                minCabinsNumber,
                maxCabinsNumber,
                manufacturerStartDate,
                manufacturerEndDate
        );

        return filterDTO;
    }
}