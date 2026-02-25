# 分支管理与代码质量门禁规范 (GOVERNANCE.md)

## 1. 分支规范
- `main`: 正式发布分支，保护分支（需 2 人 Approvals），仅接受 release/hotfix 合并。
- `develop`: 开发集成分支，保护分支（需 1 人 Approval），日常 CI 构建与 Sonar 基线扫描。
- `test`: 测试环境部署分支。
- `feature/*`: 功能开发分支（如 `feature/data-platform`, `feature/quote-engine`）。
- `release/*`: 发布候选分支（如 `release/v1.0`）。

## 2. 门禁基线 (Gates)
- **G-ENV**: 仓库可克隆、流水线跑通、分支保护生效。
- **G-PRECOMMIT**: 本地测试通过，SonarLint 无阻断 issue。
- **G-PR**: 评审通过、覆盖率 >= 70%、新阻断 issue = 0。
- **G-DEVINT**: develop 全量构建与扫描绿牌。
- **G-RELEASE**: 验收通过，正式标签打入 `main` 分支。
