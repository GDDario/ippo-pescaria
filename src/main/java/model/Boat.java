package model;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

public class Boat {
    private BigInteger id;
    private UUID uuid;
    private String name;
    private double pricePerDay;
    private int capacity;
    private int cabinsNumber;
    private double length;
    private double enginePower;
    private int idealId;
    private String equipments;
    private LocalDate manufactureDate;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Category category;

    public Boat() {
    }

    public Boat(BigInteger id, UUID uuid, String name, double pricePerDay, int capacity, int cabinsNumber, double length, double enginePower, int idealId, String equipments, LocalDate manufactureDate, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.uuid = uuid;
        this.name = name;
        this.pricePerDay = pricePerDay;
        this.capacity = capacity;
        this.cabinsNumber = cabinsNumber;
        this.length = length;
        this.enginePower = enginePower;
        this.idealId = idealId;
        this.equipments = equipments;
        this.manufactureDate = manufactureDate;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Boat(UUID uuid, String name, double length, int capacity, double enginePower, double pricePerDay, Category category) {
        this.uuid = uuid;
        this.name = name;
        this.length = length;
        this.capacity = capacity;
        this.enginePower = enginePower;
        this.pricePerDay = pricePerDay;
        this.category = category;
    }

    public Boat(String name) {
        this.name = name;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public UUID getUuid() {
        return uuid;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCabinsNumber() {
        return cabinsNumber;
    }

    public void setCabinsNumber(int cabinsNumber) {
        this.cabinsNumber = cabinsNumber;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public double getEnginePower() {
        return enginePower;
    }

    public void setEnginePower(double enginePower) {
        this.enginePower = enginePower;
    }

    public int getIdealId() {
        return idealId;
    }

    public void setIdealId(int idealId) {
        this.idealId = idealId;
    }

    public String getEquipments() {
        return equipments;
    }

    public void setEquipments(String equipments) {
        this.equipments = equipments;
    }

    public LocalDate getManufactureDate() {
        return manufactureDate;
    }

    public void setManufactureDate(LocalDate manufactureDate) {
        this.manufactureDate = manufactureDate;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}

