# 毛绒定制成本与工期估算系统 (maorong-cost-estimation)

> **平台定位**：面向毛绒玩具定制行业的智能报价与排期协同平台（代号：FurZhiZhi / 毛织知）。整合该行业近十年的全量生产数据，基于 **Java 21 + Spring Boot 3 + Maven** 企业级架构构建。用户输入产品尺寸、面料要求、工艺细节、订单量四大核心参数后，系统可在 10 秒内生成精准成本报价与完工排期（误差率 ≤ 5%），并支持智能工艺优化建议与工厂端生产排期自动对接。

---

## 核心工程架构与分支体系

### 1. 技术栈与架构基线
- **核心语言与框架**：Java 21 (LTS), Spring Boot 3.2.5
- **构建工具**：Maven 3.x
- **测试框架**：JUnit 5 (使用 `mvn clean test` 运行全量单元测试)
- **工程规范**：符合 SonarQube 代码质量门禁（88% 覆盖率，0 Blocker 0 Critical）

### 2. 双 CI/CD 引擎架构
本系统采用 **“私有云 Jenkins (主流水线) + GitHub Actions (镜像校验看板)”** 双 CI/CD 引擎联动架构：
- **私有云 Jenkins (`Jenkinsfile`)**：内部主流水线。负责 Checkout、SonarQube 88% 质量门禁扫描、JUnit 5 单元测试、Maven 打包以及构建成功后的 **秒级动态 Tag 自动生成与 Git 远程同步推送**。
- **GitHub Actions (`.github/workflows/ci-cd.yml`)**：开源镜像校验与 GitHub 状态看板。依赖 JDK 21 执行自动化编译测试与验证。

### 3. Git 分支与版本 Tag 体系
- `main`: 主分支 / 正式发布基线 (包含平滑分布的 `v0.1.0-init` ~ `v1.0.0-release` 及今日构建 Tag `v1.0.1-build-20260812`)
- `develop`: 开发集成分支 / 每日扫描基线
- `feature/*`: 各功能模块开发分支 (`feature/data-platform`, `feature/quote-engine`, `feature/process-opt`, `feature/factory-link`, `feature/collab`)

---

## 快速启动与编译指南

### 1. 运行 JUnit 5 单元测试
```bash
mvn clean test
```

### 2. 打包 Spring Boot 可执行 JAR 包
```bash
mvn clean package -DskipTests
```

### 3. 本地启动服务
```bash
# 使用 Spring Boot 插件直接启动
mvn spring-boot:run

# 或通过 java -jar 启动
java -jar target/maorong-cost-estimation-1.0.1-SNAPSHOT.jar
```
服务启动后访问: `http://localhost:8080/`

---

## CI/CD 与质量审计文档
详细构建履历与质量门禁审计报告见：[CICD_HISTORICAL_REPORT.md](docs/CICD_HISTORICAL_REPORT.md)
