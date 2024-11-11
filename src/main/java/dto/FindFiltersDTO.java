package dto;

import java.time.LocalDate;

public class FindFiltersDTO {
    private double maxBoatLength;
    private double maxPricePerDay;
    private int maxCapacity;
    private double maxEnginePopwer;
    private int maxCabinsNumber;
    private LocalDate manufacturerEndDate;

    public FindFiltersDTO() {
    }

    public FindFiltersDTO(double maxBoatLength, double maxPricePerDay, int maxCapacity, double maxEnginePopwer, int maxCabinsNumber, LocalDate maxManufactureDate) {
        this.maxBoatLength = maxBoatLength;
        this.maxPricePerDay = maxPricePerDay;
        this.maxCapacity = maxCapacity;
        this.maxEnginePopwer = maxEnginePopwer;
        this.maxCabinsNumber = maxCabinsNumber;
        this.manufacturerEndDate = maxManufactureDate;
    }

    public double getMaxBoatLength() {
        return maxBoatLength;
    }

    public void setMaxBoatLength(double maxBoatLength) {
        this.maxBoatLength = maxBoatLength;
    }

    public double getMaxPricePerDay() {
        return maxPricePerDay;
    }

    public void setMaxPricePerDay(double maxPricePerDay) {
        this.maxPricePerDay = maxPricePerDay;
    }

    public int getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(int maxCapacity) {
        this.maxCapacity = maxCapacity;
    }

    public double getMaxEnginePopwer() {
        return maxEnginePopwer;
    }

    public void setMaxEnginePopwer(double maxEnginePopwer) {
        this.maxEnginePopwer = maxEnginePopwer;
    }

    public int getMaxCabinsNumber() {
        return maxCabinsNumber;
    }

    public void setMaxCabinsNumber(int maxCabinsNumber) {
        this.maxCabinsNumber = maxCabinsNumber;
    }

    public LocalDate getManufacturerEndDate() {
        return manufacturerEndDate;
    }

    public void setManufacturerEndDate(LocalDate manufacturerEndDate) {
        this.manufacturerEndDate = manufacturerEndDate;
    }
}
