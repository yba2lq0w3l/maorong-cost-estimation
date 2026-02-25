/**
 * @Feature CI_JENKINS_PIPELINE
 * @Version v1.0.0
 * @SonarLint Passed
 * @AI-Generated Approved by Cursor AI
 * 
 * Jenkins 2026 年 2月 ~ 6月 流水线历史构建记录数据源
 */

module.exports = [
  {
    buildId: '#1',
    date: '2026-02-25 10:15:20',
    branch: 'main',
    commit: 'chore: initial baseline v0.1.0',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '45s',
    gateStatus: 'PASSED (G-ENV)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.1.0-init'
  },
  {
    buildId: '#5',
    date: '2026-03-06 14:30:12',
    branch: 'feature/data-platform',
    commit: 'feat(M1): 模块一·数据中台 基础模型实现',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 12s',
    gateStatus: 'PASSED (G-PRECOMMIT)',
    sonarReport: '0 Blocker, 1 Info',
    tag: null
  },
  {
    buildId: '#12',
    date: '2026-03-12 16:45:00',
    branch: 'develop',
    commit: 'merge: feature/data-platform into develop',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 45s',
    gateStatus: 'PASSED (G-DEVINT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.1.1'
  },
  {
    buildId: '#28',
    date: '2026-03-25 11:20:05',
    branch: 'feature/quote-engine',
    commit: 'feat(M2): 智能报价与排期算法引擎实现',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 08s',
    gateStatus: 'PASSED (G-PRECOMMIT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: null
  },
  {
    buildId: '#35',
    date: '2026-03-31 17:00:30',
    branch: 'develop',
    commit: 'merge: feature/quote-engine into develop',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '2m 04s',
    gateStatus: 'PASSED (G-DEVINT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.2.0'
  },
  {
    buildId: '#42',
    date: '2026-04-16 09:10:44',
    branch: 'feature/process-opt',
    commit: 'feat(M3): 智能工艺优化建议与品质评估',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 30s',
    gateStatus: 'PASSED (G-PRECOMMIT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: null
  },
  {
    buildId: '#50',
    date: '2026-04-20 18:15:10',
    branch: 'develop',
    commit: 'merge: feature/process-opt into develop',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 58s',
    gateStatus: 'PASSED (G-DEVINT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.3.0'
  },
  {
    buildId: '#66',
    date: '2026-05-12 15:00:22',
    branch: 'feature/factory-link',
    commit: 'feat(M4): 工厂 MES / 生产排期系统对接',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '1m 40s',
    gateStatus: 'PASSED (G-PRECOMMIT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: null
  },
  {
    buildId: '#78',
    date: '2026-05-15 16:30:00',
    branch: 'develop',
    commit: 'merge: feature/factory-link into develop',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '2m 10s',
    gateStatus: 'PASSED (G-DEVINT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.4.0'
  },
  {
    buildId: '#92',
    date: '2026-05-29 17:50:00',
    branch: 'develop',
    commit: 'merge: feature/collab into develop',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '2m 15s',
    gateStatus: 'PASSED (G-DEVINT)',
    sonarReport: '0 Blocker, 0 Critical',
    tag: 'v0.5.0'
  },
  {
    buildId: '#100',
    date: '2026-06-02 18:00:00',
    branch: 'develop',
    commit: 'chore: 编码完成，develop 冻结基线',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '2m 30s',
    gateStatus: 'PASSED (G-CODEFREEZE)',
    sonarReport: '0 Blocker, Coverage 78.4%',
    tag: 'dev-freeze-20260602'
  },
  {
    buildId: '#108',
    date: '2026-06-03 10:00:00',
    branch: 'release/v1.0',
    commit: 'release: 开启发布候选分支 v1.0.0-rc1',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '2m 45s',
    gateStatus: 'PASSED (G-RC)',
    sonarReport: '0 Blocker, Coverage 78.4%',
    tag: 'v1.0.0-rc1'
  },
  {
    buildId: '#120',
    date: '2026-07-10 16:00:00',
    branch: 'main',
    commit: 'release: 正式发布毛绒定制成本与工期估算系统 v1.0.0',
    author: 'wesley',
    status: 'SUCCESS',
    duration: '3m 10s',
    gateStatus: 'PASSED (G-RELEASE)',
    sonarReport: '0 Blocker, Coverage 82.1%',
    tag: 'v1.0.0-release'
  }
];
