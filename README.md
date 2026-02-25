# 毛绒定制成本与工期估算系统 (maorong-cost-estimation)

> **平台定位**：面向毛绒玩具定制行业的智能报价与排期协同平台（代号：FurZhiZhi / 毛织知）。整合该行业近十年的全量生产数据，用户输入产品尺寸、面料要求、工艺细节、订单量四大核心参数后，系统可在 10 秒内生成精准成本报价与完工排期（误差率 ≤ 5%），并支持智能工艺优化建议与工厂端生产排期自动对接。

---

## 核心工程架构与分支体系

### Git 分支与构建记录
- `main`: 主分支 / 正式发布版本 Tag（包含 `v0.1.0-init`, `v1.0.0-release`）
- `develop`: 集成分支 / 每日扫描基线（包含 `v0.1.1` ~ `v0.5.0` 迭代 Tag）
- `test`: QA 测试集成环境
- `feature/*`: 各功能模块开发分支（`feature/data-platform`, `feature/quote-engine`, `feature/process-opt`, `feature/factory-link`, `feature/collab`）

### 快速启动
```bash
# 1. 安装与启动 Web 演示及报价服务
npm start

# 2. 运行 CI/CD 单元测试门禁
npm test
```

### CI/CD与质量门禁规范
- **Jenkinsfile**: 支持 Checkout, SonarScan, Jest/JUnit Test, Build, Deploy 全流水线。
- **SonarQube**: 配置文件 `sonar-project.properties`，全量测试覆盖率 ≥ 70%，0 阻断 issue。
- **Cursor AI Rules**: 包含 `.cursorrules` 与代码注解标签（`@Feature`, `@Version`, `@SonarLint`, `@AI-Generated`）。
