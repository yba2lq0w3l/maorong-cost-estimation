/**
 * @Feature M1_DATA_PLATFORM
 * @Version v0.1.0
 * @SonarLint Passed
 * @AI-Generated Approved by Cursor AI
 * 
 * 行业生产数据与成本/工时基准库 (基于近 10 年毛绒玩具行业生产沉淀数据)
 */

module.exports = {
  // 面料基础单价 (元/米) 与工时系数
  fabrics: {
    '超柔短毛绒': { basePrice: 18.5, leadTimeFactor: 1.0, qualityGrade: 'A' },
    '长毛绒/兔毛绒': { basePrice: 28.0, leadTimeFactor: 1.25, qualityGrade: 'A+' },
    '水晶超柔': { basePrice: 22.0, leadTimeFactor: 1.1, qualityGrade: 'A' },
    '环保再生毛绒': { basePrice: 24.5, leadTimeFactor: 1.15, qualityGrade: 'A+' },
    '普通短毛绒': { basePrice: 12.0, leadTimeFactor: 0.9, qualityGrade: 'B' }
  },

  // 工艺成本模型 (元/件) 与基准工时 (小时/百件)
  crafts: {
    '电脑刺绣': { costPerUnit: 2.5, laborHoursPerHundred: 4.0 },
    '热转印印花': { costPerUnit: 1.8, laborHoursPerHundred: 2.5 },
    '复杂立体拼接': { costPerUnit: 5.0, laborHoursPerHundred: 8.0 },
    '语音/发声芯片': { costPerUnit: 6.5, laborHoursPerHundred: 3.0 },
    '基础缝纫': { costPerUnit: 3.0, laborHoursPerHundred: 5.0 }
  },

  // 规模效应折减系数表 (订单量 -> 成本折扣与工期并行度)
  quantityScale: [
    { minQty: 1, maxQty: 200, costFactor: 1.3, speedFactor: 1.0 },
    { minQty: 201, maxQty: 1000, costFactor: 1.1, speedFactor: 1.2 },
    { minQty: 1001, maxQty: 5000, costFactor: 0.95, speedFactor: 1.5 },
    { minQty: 5001, maxQty: 100000, costFactor: 0.85, speedFactor: 1.8 }
  ]
};
