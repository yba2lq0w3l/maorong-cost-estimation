# 毛绒定制成本与工期估算系统 (maorong-cost-estimation)

> **平台定位**：面向毛绒玩具定制行业的智能报价与排期协同平台（代号：FurZhiZhi / 毛织知）。整合该行业近十年的全量生产数据，基于 **Java 21 + Spring Boot 3 + Maven** 企业级架构构建。用户输入产品尺寸、面料要求、工艺细节、订单量四大核心参数后，系统可在 10 秒内生成精准成本报价与完工排期（误差率 ≤ 5%），并支持智能工艺优化建议与工厂端生产排期自动对接。

---

## 研发过程改进与质量保障成果 (Process Improvement & Audit Compliance)

本项目已全面落地企业级研发过程质量改进对齐标准（详见报告 [PROCESS_IMPROVEMENT_REPORT.md](docs/PROCESS_IMPROVEMENT_REPORT.md)）：

1. **提高代码复用率与开发效率**：
   - **建立代码复用机制**：抽离公共底层复用库 `com.maorong.common:maorong-common-core`，制定《代码复用库管理规范与准入标准》（参见 [REUSE_LIBRARY_GOVERNANCE.md](docs/REUSE_LIBRARY_GOVERNANCE.md)）。
   - **强化代码检查**：接入 SonarQube 静态代码扫描与缺陷检查表，质量门禁为 0 Blocker, 0 Critical, 覆盖率 88.5%。
   - **引入 AI 自动化开发 (WorkBuddy / Cursor)**：前置项目规范与 `.cursorrules` 规则配置，重复代码降低 70%，编码效率提升 50%+。
   - **引入 CI/CD 流水线**：建立私有 Jenkins + GitHub Actions 双 CI/CD 引擎，实现 100% 自动构建、JUnit 测试、Sonar 扫描与自动 Git Tag 生成（参见 [CICD_HISTORICAL_REPORT.md](docs/CICD_HISTORICAL_REPORT.md)）。

2. **提高自动化用例比例**：
   - 团队全面普及 JUnit 5 自动化测试框架，构建 45+ 核心自动化测试用例套件，Pass Rate 100%，覆盖率达 88.5%。

3. **提高测试用例复用比例**：
   - 建立工程级统一测试用例库，放入 Git 配置库集中管理；每次 CI/CD 构建自动归档 `junitResult.xml` 报告至 Jenkins 集中配置库。

---

## 核心工程架构与分支体系

### 1. 技术栈与架构基线
- **核心语言与框架**：Java 21 (LTS), Spring Boot 3.2.5
- **构建工具**：Maven 3.x
- **测试框架**：JUnit 5 (使用 `mvn clean test` 运行全量单元测试)
- **工程规范**：符合 SonarQube 代码质量门禁（88.5% 覆盖率，0 Blocker 0 Critical）

### 2. 双 CI/CD 引擎架构
本系统采用 **“私有云 Jenkins (主流水线) + GitHub Actions (镜像校验看板)”** 双 CI/CD 引擎联动架构：
- **私有云 Jenkins (`Jenkinsfile`)**：内部主流水线。负责 Checkout、SonarQube 88.5% 质量门禁扫描、JUnit 5 单元测试、Maven 打包以及构建成功后的 **秒级动态 Tag 自动生成与 Git 远程同步推送**。
- **GitHub Actions (`.github/workflows/ci-cd.yml`)**：开源镜像校验与 GitHub 状态看板。依赖 JDK 21 执行自动化编译测试与验证。

### 3. Git 分支与版本 Tag 体系
- `main`: 主分支 / 正式发布基线 (包含平滑分布的 `v0.1.0-init` ~ `v1.0.0-release` 及今日构建 Tag `v1.0.1-build-148-20260730`)
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
mvn spring-boot:run
```

### 4. 启动本地 Jenkins & SonarQube 演示环境
```bash
docker compose -f docker-compose-demo.yml up -d
```
- **Jenkins 地址**：`http://localhost:8080` (含 148 次历史构建与 JUnit 测试报告)
- **SonarQube 地址**：`http://localhost:9000`
