package com.maorong.cost.model;

import java.util.List;

public class QuoteRequest {
    private double heightCm = 25.0;
    private String fabric = "超柔短毛绒";
    private List<String> crafts = List.of("电脑刺绣", "基础缝纫");
    private int quantity = 1000;

    public QuoteRequest() {}

    public QuoteRequest(double heightCm, String fabric, List<String> crafts, int quantity) {
        this.heightCm = heightCm;
        this.fabric = fabric;
        this.crafts = crafts;
        this.quantity = quantity;
    }

    public double getHeightCm() { return heightCm; }
    public void setHeightCm(double heightCm) { this.heightCm = heightCm; }

    public String getFabric() { return fabric; }
    public void setFabric(String fabric) { this.fabric = fabric; }

    public List<String> getCrafts() { return crafts; }
    public void setCrafts(List<String> crafts) { this.crafts = crafts; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
