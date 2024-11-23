package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class UserRentDTO {
    private int id;
    private String boatName;
    private int daysRented;
    private LocalDate dateStart;
    private LocalDate dateEnd;
    private double total;
    private LocalDateTime createdAt;

    public UserRentDTO() {
    }

    public UserRentDTO(int id, String boatName, int daysRented, LocalDate dateStart, LocalDate dateEnd, double total, LocalDateTime createdAt) {
        this.id = id;
        this.boatName = boatName;
        this.daysRented = daysRented;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.total = total;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBoatName() {
        return boatName;
    }

    public void setBoatName(String boatName) {
        this.boatName = boatName;
    }

    public int getDaysRented() {
        return daysRented;
    }

    public void setDaysRented(int daysRented) {
        this.daysRented = daysRented;
    }

    public LocalDate getDateStart() {
        return dateStart;
    }

    public void setDateStart(LocalDate dateStart) {
        this.dateStart = dateStart;
    }

    public LocalDate getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(LocalDate dateEnd) {
        this.dateEnd = dateEnd;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
