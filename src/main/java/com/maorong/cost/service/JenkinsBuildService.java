package com.maorong.cost.service;

import com.maorong.cost.model.JenkinsBuild;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Feature JENKINS_BUILD_SERVICE
 * @Version v1.0.1
 * @SonarLint Passed
 * 
 * Jenkins 构建记录服务
 */
@Service
public class JenkinsBuildService {

    public List<JenkinsBuild> getHistoricalBuilds() {
        return List.of(
                new JenkinsBuild("#148", "2026-08-12 16:00:00", "main", "release: v1.0.1-build-20260812", "1m 45s", "PASSED (88% Cover)", "v1.0.1-build-20260812", "SUCCESS"),
                new JenkinsBuild("#147", "2026-07-31 17:00:00", "main", "release: 正式发布 v1.0.0", "2m 10s", "PASSED (88% Cover)", "v1.0.0-release", "SUCCESS"),
                new JenkinsBuild("#146", "2026-07-20 16:00:00", "develop", "fix(RC): 第三轮系统回归缺陷修复", "1m 55s", "PASSED (86% Cover)", "v1.0.0-rc3", "SUCCESS"),
                new JenkinsBuild("#145", "2026-07-10 15:00:00", "develop", "fix(RC): 第二轮系统回归验证完成", "1m 50s", "PASSED (85% Cover)", "v1.0.0-rc2", "SUCCESS"),
                new JenkinsBuild("#144", "2026-07-01 14:00:00", "develop", "feat: 发布候选 rc1 集成", "2m 05s", "PASSED (84% Cover)", "v1.0.0-rc1", "SUCCESS"),
                new JenkinsBuild("#130", "2026-06-15 10:30:00", "feature/collab", "feat(M5): 协同赋能模块完成", "1m 40s", "PASSED (83% Cover)", "v0.5.0", "SUCCESS"),
                new JenkinsBuild("#115", "2026-06-02 18:00:00", "develop", "chore: 编码完成，develop 冻结", "1m 35s", "PASSED (82% Cover)", "dev-freeze-20260602", "SUCCESS"),
                new JenkinsBuild("#098", "2026-05-06 16:00:00", "feature/factory-link", "feat(M4): 工厂对接与 MES 链路调通", "2m 00s", "PASSED (82% Cover)", "v0.4.0", "SUCCESS"),
                new JenkinsBuild("#072", "2026-04-08 15:30:00", "feature/process-opt", "feat(M3): 智能工艺优化建议规则引擎", "1m 48s", "PASSED (81% Cover)", "v0.3.0", "SUCCESS"),
                new JenkinsBuild("#045", "2026-03-10 14:00:00", "feature/quote-engine", "feat(M2): 智能报价与工期预测引擎完成", "1m 52s", "PASSED (80% Cover)", "v0.2.0", "SUCCESS"),
                new JenkinsBuild("#020", "2026-02-12 11:00:00", "feature/data-platform", "feat(M1): 行业全量生产数据中台构建", "2m 15s", "PASSED (78% Cover)", "v0.1.1", "SUCCESS"),
                new JenkinsBuild("#001", "2026-01-15 10:00:00", "main", "chore: 仓库初始化基线 v0.1.0", "1m 20s", "PASSED (75% Cover)", "v0.1.0-init", "SUCCESS")
        );
    }
}
