package com.maorong.cost.model;

import java.util.Map;

public class QuoteResponse {
    private QuoteResult quoteResult;
    private ScheduleResult scheduleResult;

    public QuoteResponse() {}

    public QuoteResponse(QuoteResult quoteResult, ScheduleResult scheduleResult) {
        this.quoteResult = quoteResult;
        this.scheduleResult = scheduleResult;
    }

    public QuoteResult getQuoteResult() { return quoteResult; }
    public void setQuoteResult(QuoteResult quoteResult) { this.quoteResult = quoteResult; }

    public ScheduleResult getScheduleResult() { return scheduleResult; }
    public void setScheduleResult(ScheduleResult scheduleResult) { this.scheduleResult = scheduleResult; }

    public static class QuoteResult {
        private double unitPrice;
        private double totalPrice;
        private CostBreakdown costBreakdown;
        private String calculationTime;

        public QuoteResult() {}

        public QuoteResult(double unitPrice, double totalPrice, CostBreakdown costBreakdown, String calculationTime) {
            this.unitPrice = unitPrice;
            this.totalPrice = totalPrice;
            this.costBreakdown = costBreakdown;
            this.calculationTime = calculationTime;
        }

        public double getUnitPrice() { return unitPrice; }
        public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

        public double getTotalPrice() { return totalPrice; }
        public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

        public CostBreakdown getCostBreakdown() { return costBreakdown; }
        public void setCostBreakdown(CostBreakdown costBreakdown) { this.costBreakdown = costBreakdown; }

        public String getCalculationTime() { return calculationTime; }
        public void setCalculationTime(String calculationTime) { this.calculationTime = calculationTime; }
    }

    public static class CostBreakdown {
        private double fabricCost;
        private double stuffingCost;
        private double craftCost;

        public CostBreakdown() {}

        public CostBreakdown(double fabricCost, double stuffingCost, double craftCost) {
            this.fabricCost = fabricCost;
            this.stuffingCost = stuffingCost;
            this.craftCost = craftCost;
        }

        public double getFabricCost() { return fabricCost; }
        public void setFabricCost(double fabricCost) { this.fabricCost = fabricCost; }

        public double getStuffingCost() { return stuffingCost; }
        public void setStuffingCost(double stuffingCost) { this.stuffingCost = stuffingCost; }

        public double getCraftCost() { return craftCost; }
        public void setCraftCost(double craftCost) { this.craftCost = craftCost; }
    }

    public static class ScheduleResult {
        private int totalDeliveryDays;
        private int samplingDays;
        private int materialPrepDays;
        private int productionDays;
        private String estimatedCompletionDate;

        public ScheduleResult() {}

        public ScheduleResult(int totalDeliveryDays, int samplingDays, int materialPrepDays, int productionDays, String estimatedCompletionDate) {
            this.totalDeliveryDays = totalDeliveryDays;
            this.samplingDays = samplingDays;
            this.materialPrepDays = materialPrepDays;
            this.productionDays = productionDays;
            this.estimatedCompletionDate = estimatedCompletionDate;
        }

        public int getTotalDeliveryDays() { return totalDeliveryDays; }
        public void setTotalDeliveryDays(int totalDeliveryDays) { this.totalDeliveryDays = totalDeliveryDays; }

        public int getSamplingDays() { return samplingDays; }
        public void setSamplingDays(int samplingDays) { this.samplingDays = samplingDays; }

        public int getMaterialPrepDays() { return materialPrepDays; }
        public void setMaterialPrepDays(int materialPrepDays) { this.materialPrepDays = materialPrepDays; }

        public int getProductionDays() { return productionDays; }
        public void setProductionDays(int productionDays) { this.productionDays = productionDays; }

        public String getEstimatedCompletionDate() { return estimatedCompletionDate; }
        public void setEstimatedCompletionDate(String estimatedCompletionDate) { this.estimatedCompletionDate = estimatedCompletionDate; }
    }
}
