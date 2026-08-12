package com.maorong.cost;

import com.maorong.cost.model.QuoteRequest;
import com.maorong.cost.model.QuoteResponse;
import com.maorong.cost.service.QuoteService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * JUnit 5 单元测试：验证 QuoteService 报价与排期算法
 */
class QuoteServiceTest {

    private final QuoteService quoteService = new QuoteService();

    @Test
    @DisplayName("测试标准订单报价与排期测算")
    void testCalculateQuoteStandard() {
        QuoteRequest request = new QuoteRequest(25.0, "超柔短毛绒", List.of("电脑刺绣", "基础缝纫"), 1000);
        QuoteResponse response = quoteService.calculateQuote(request);

        assertNotNull(response);
        assertNotNull(response.getQuoteResult());
        assertNotNull(response.getScheduleResult());

        assertTrue(response.getQuoteResult().getUnitPrice() > 0);
        assertTrue(response.getQuoteResult().getTotalPrice() > 0);
        assertTrue(response.getScheduleResult().getTotalDeliveryDays() > 0);

        assertEquals(3, response.getScheduleResult().getSamplingDays());
        assertEquals(2, response.getScheduleResult().getMaterialPrepDays());
    }

    @Test
    @DisplayName("测试大批量订单规模效应价格折扣")
    void testCalculateQuoteBulkDiscount() {
        QuoteRequest requestSmall = new QuoteRequest(25.0, "超柔短毛绒", List.of("基础缝纫"), 100);
        QuoteRequest requestLarge = new QuoteRequest(25.0, "超柔短毛绒", List.of("基础缝纫"), 5000);

        QuoteResponse responseSmall = quoteService.calculateQuote(requestSmall);
        QuoteResponse responseLarge = quoteService.calculateQuote(requestLarge);

        assertTrue(responseLarge.getQuoteResult().getUnitPrice() < responseSmall.getQuoteResult().getUnitPrice(),
                "大订单量单价应该享有规模效应折扣");
    }
}
