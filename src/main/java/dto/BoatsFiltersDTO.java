package dto;

import java.time.LocalDate;

public class BoatsFiltersDTO {
    private double maxBoatLength;
    private double maxPricePerDay;
    private int maxCapacity;
    private double maxEnginePower;
    private int maxCabinsNumber;
    private int manufacturerStartDate;
    private int manufacturerEndDate;

    public BoatsFiltersDTO() {
    }

    public BoatsFiltersDTO(double maxBoatLength, double maxPricePerDay, int maxCapacity, double maxEnginePower, int maxCabinsNumber, int manufacturerStartDate, int manufacturerEndDate) {
        this.maxBoatLength = maxBoatLength;
        this.maxPricePerDay = maxPricePerDay;
        this.maxCapacity = maxCapacity;
        this.maxEnginePower = maxEnginePower;
        this.maxCabinsNumber = maxCabinsNumber;
        this.manufacturerStartDate = manufacturerStartDate;
        this.manufacturerEndDate = manufacturerEndDate;
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

    public double getMaxEnginePower() {
        return maxEnginePower;
    }

    public void setMaxEnginePower(double maxEnginePower) {
        this.maxEnginePower = maxEnginePower;
    }

    public int getMaxCabinsNumber() {
        return maxCabinsNumber;
    }

    public void setMaxCabinsNumber(int maxCabinsNumber) {
        this.maxCabinsNumber = maxCabinsNumber;
    }

    public int getManufacturerStartDate() {
        return manufacturerStartDate;
    }

    public void setManufacturerStartDate(int manufacturerStartDate) {
        this.manufacturerStartDate = manufacturerStartDate;
    }

    public int getManufacturerEndDate() {
        return manufacturerEndDate;
    }

    public void setManufacturerEndDate(int manufacturerEndDate) {
        this.manufacturerEndDate = manufacturerEndDate;
    }

    @Override
    public String toString() {
        return "BoatsFiltersDTO{" +
                "maxBoatLength=" + maxBoatLength +
                ", maxPricePerDay=" + maxPricePerDay +
                ", maxCapacity=" + maxCapacity +
                ", maxEnginePower=" + maxEnginePower +
                ", maxCabinsNumber=" + maxCabinsNumber +
                ", manufacturerStartDate=" + manufacturerStartDate +
                ", manufacturerEndDate=" + manufacturerEndDate +
                '}';
    }
}
