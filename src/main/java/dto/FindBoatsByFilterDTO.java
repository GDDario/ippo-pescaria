package dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

public class FindBoatsByFilterDTO {
    private String boatName;
    private ArrayList<UUID> categoryUuids;
    private ArrayList<String> equipmentsArray;
    private double minLength;
    private double maxLength;
    private double minPricePerDay;
    private double maxPricePerDay;
    private int minCapacity;
    private int maxCapacity;
    private double minEnginePower;
    private double maxEnginePower;
    private int minCabinsNumber;
    private int maxCabinsNumber;
    private int manufacturerStartDate;
    private int manufacturerEndDate;

    public FindBoatsByFilterDTO() {
    }

    public FindBoatsByFilterDTO(String boatName, ArrayList<UUID> categoryUuids, ArrayList<String> equipmentsArray, double minLength, double minPricePerDay, double minPrice, double maxPricePerDay, int minCapacity, int maxCapacity, double minEnginePower, double maxEnginePower, int minCabinsNumber, int maxCabinsNumber, int manufacturerStartDate, int manufacturerEndDate) {
        this.boatName = boatName;
        this.categoryUuids = categoryUuids;
        this.equipmentsArray = equipmentsArray;
        this.minLength = minLength;
        this.maxLength = minPricePerDay;
        this.minPricePerDay = minPrice;
        this.maxPricePerDay = maxPricePerDay;
        this.minCapacity = minCapacity;
        this.maxCapacity = maxCapacity;
        this.minEnginePower = minEnginePower;
        this.maxEnginePower = maxEnginePower;
        this.minCabinsNumber = minCabinsNumber;
        this.maxCabinsNumber = maxCabinsNumber;
        this.manufacturerStartDate = manufacturerStartDate;
        this.manufacturerEndDate = manufacturerEndDate;
    }

    public String getBoatName() {
        return boatName;
    }

    public void setBoatName(String boatName) {
        this.boatName = boatName;
    }

    public ArrayList<UUID> getCategoryUuids() {
        return categoryUuids;
    }

    public void setCategoryUuids(ArrayList<UUID> categoryUuids) {
        this.categoryUuids = categoryUuids;
    }

    public ArrayList<String> getEquipmentsArray() {
        return equipmentsArray;
    }

    public void setEquipmentsArray(ArrayList<String> equipmentsArray) {
        this.equipmentsArray = equipmentsArray;
    }

    public double getMinLength() {
        return minLength;
    }

    public void setMinLength(double minLength) {
        this.minLength = minLength;
    }

    public double getMaxLength() {
        return maxLength;
    }

    public void setMaxLength(double maxLength) {
        this.maxLength = maxLength;
    }

    public double getMinPricePerDay() {
        return minPricePerDay;
    }

    public void setMinPricePerDay(double minPricePerDay) {
        this.minPricePerDay = minPricePerDay;
    }

    public double getMaxPricePerDay() {
        return maxPricePerDay;
    }

    public void setMaxPricePerDay(double maxPricePerDay) {
        this.maxPricePerDay = maxPricePerDay;
    }

    public int getMinCapacity() {
        return minCapacity;
    }

    public void setMinCapacity(int minCapacity) {
        this.minCapacity = minCapacity;
    }

    public int getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(int maxCapacity) {
        this.maxCapacity = maxCapacity;
    }

    public double getMinEnginePower() {
        return minEnginePower;
    }

    public void setMinEnginePower(double minEnginePower) {
        this.minEnginePower = minEnginePower;
    }

    public double getMaxEnginePower() {
        return maxEnginePower;
    }

    public void setMaxEnginePower(double maxEnginePower) {
        this.maxEnginePower = maxEnginePower;
    }

    public int getMinCabinsNumber() {
        return minCabinsNumber;
    }

    public void setMinCabinsNumber(int minCabinsNumber) {
        this.minCabinsNumber = minCabinsNumber;
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
        return "FindBoatsByFilterDTO{" +
                "boatName='" + boatName + '\'' +
                ", categoryUuids=" + categoryUuids +
                ", equipmentsArray=" + equipmentsArray +
                ", minLength=" + minLength +
                ", maxLength=" + maxLength +
                ", minPricePerDay=" + minPricePerDay +
                ", maxPricePerDay=" + maxPricePerDay +
                ", minCapacity=" + minCapacity +
                ", maxCapacity=" + maxCapacity +
                ", minEnginePower=" + minEnginePower +
                ", maxEnginePower=" + maxEnginePower +
                ", minCabinsNumber=" + minCabinsNumber +
                ", maxCabinsNumber=" + maxCabinsNumber +
                ", manufacturerStartDate=" + manufacturerStartDate +
                ", manufacturerEndDate=" + manufacturerEndDate +
                '}';
    }
}
