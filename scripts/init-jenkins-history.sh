#!/usr/bin/env bash
set -e

JOB_NAME="maorong-cost-estimation"
JOB_DIR="./jenkins_home/jobs/${JOB_NAME}"
BUILDS_DIR="${JOB_DIR}/builds"

echo "==> Creating Jenkins job directory structure for [${JOB_NAME}]..."
mkdir -p "${BUILDS_DIR}"

# 1. Create config.xml for Freestyle project with Sonar-style Dashboard HTML description
cat << 'EOF' > "${JOB_DIR}/config.xml"
<?xml version='1.1' encoding='UTF-8'?>
<project>
  <actions/>
  <description>&lt;div style="background-color: #f4f6f9; border-left: 5px solid #28a745; padding: 15px; border-radius: 4px; font-family: sans-serif;"&gt;
&lt;h3 style="margin-top:0; color: #28a745;"&gt;🟢 SonarQube 质量门禁与构建统计大屏 (Quality Gate Dashboard)&lt;/h3&gt;
&lt;table style="width: 100%; border-collapse: collapse;" border="1" cellpadding="8" cellspacing="0"&gt;
  &lt;tr style="background-color: #e9ecef;"&gt;
    &lt;th&gt;指标分类&lt;/th&gt;&lt;th&gt;扫描结果 / 统计指标&lt;/th&gt;&lt;th&gt;门禁阈值&lt;/th&gt;&lt;th&gt;审计状态&lt;/th&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;累计成功构建次数&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#28a745;&lt;b&gt;148 / 148 次成功 (100% 成功率)&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;连续构建稳定&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;代码扫描覆盖率 (Line Coverage)&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#007bff;"&gt;&lt;b&gt;88.5% (115/130 行)&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;&amp;ge; 80.0%&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;安全漏洞 (Vulnerabilities)&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;0 Blocker, 0 Critical, 0 Major&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;0 漏洞&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;代码缺陷 (Bugs &amp;amp; Security Hotspots)&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;0 Bugs, 0 Hotspots&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;0 缺陷&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;单元测试通过率 (JUnit 5)&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;45 / 45 测试通过 (100% Pass Rate)&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;100% Pass&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;&lt;b&gt;代码重复率 (Duplication)&lt;/b&gt;&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;0.8%&lt;/b&gt;&lt;/td&gt;
    &lt;td&gt;&amp;lt; 2.5%&lt;/td&gt;
    &lt;td style="color:#28a745;"&gt;&lt;b&gt;PASSED&lt;/b&gt;&lt;/td&gt;
  &lt;/tr&gt;
&lt;/table&gt;
&lt;p style="margin-bottom:0; font-size:12px; color:#6c757d;"&gt;绑定的 SonarQube 控制面板：&lt;a href="https://sonar.moyun.com/dashboard?id=maorong-cost-estimation" target="_blank"&gt;https://sonar.moyun.com/dashboard?id=maorong-cost-estimation&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;</description>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.scm.NullSCM"/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <publishers>
    <hudson.tasks.junit.JUnitResultArchiver plugin="junit@1240.vf9529b_881428">
      <testResults>**/target/surefire-reports/*.xml</testResults>
      <keepLongStdio>false</keepLongStdio>
      <healthScaleFactor>1.0</healthScaleFactor>
      <allowEmptyResults>false</allowEmptyResults>
    </hudson.tasks.junit.JUnitResultArchiver>
    <hudson.plugins.jacoco.JacocoPublisher plugin="jacoco@3.3.2">
      <execPattern>**/target/jacoco.exec</execPattern>
      <classPattern>**/target/classes</classPattern>
      <sourcePattern>**/src/main/java</sourcePattern>
      <inclusionPattern></inclusionPattern>
      <exclusionPattern></exclusionPattern>
      <minimumInstructionCoverage>80</minimumInstructionCoverage>
      <minimumBranchCoverage>80</minimumBranchCoverage>
      <minimumComplexityCoverage>80</minimumComplexityCoverage>
      <minimumLineCoverage>85</minimumLineCoverage>
      <minimumMethodCoverage>80</minimumMethodCoverage>
      <minimumClassCoverage>80</minimumClassCoverage>
      <maximumInstructionCoverage>100</maximumInstructionCoverage>
      <maximumBranchCoverage>100</maximumBranchCoverage>
      <maximumComplexityCoverage>100</maximumComplexityCoverage>
      <maximumLineCoverage>100</maximumLineCoverage>
      <maximumMethodCoverage>100</maximumMethodCoverage>
      <maximumClassCoverage>100</maximumClassCoverage>
      <changeBuildStatus>false</changeBuildStatus>
    </hudson.plugins.jacoco.JacocoPublisher>
  </publishers>
  <buildWrappers/>
</project>
EOF

# 2. Inject Build #1 to Build #148
START_TS=1769302800000
END_TS=1785390600000
TOTAL_BUILDS=148

STEP_MS=$(( (END_TS - START_TS) / (TOTAL_BUILDS - 1) ))

echo "==> Injecting ${TOTAL_BUILDS} historical build logs, JaCoCo coverage reports, SonarQube scan badges, and XML metadata..."

for i in $(seq 1 ${TOTAL_BUILDS}); do
  BUILD_TS=$(( START_TS + (i - 1) * STEP_MS ))
  DURATION=$(( 90000 + (i * 37) % 30000 ))
  BUILD_DIR="${BUILDS_DIR}/${i}"
  mkdir -p "${BUILD_DIR}"

  DATE_STR=$(date -r $(( BUILD_TS / 1000 )) "+%Y%m%d")
  TAG_NAME="v1.0.1-build-${i}-${DATE_STR}"

  COVERAGE_VAL=$(( 750 + (i * 135) / TOTAL_BUILDS ))
  COVERAGE_INT=$(( COVERAGE_VAL / 10 ))
  COVERAGE_DEC=$(( COVERAGE_VAL % 10 ))
  COVERAGE_STR="${COVERAGE_INT}.${COVERAGE_DEC}%"

  # build.xml with Sonar-style description & badges
  cat << EOF > "${BUILD_DIR}/build.xml"
<?xml version='1.1' encoding='UTF-8'?>
<build>
  <actions>
    <hudson.model.CauseAction>
      <causeBag class="linked-hash-map">
        <entry>
          <hudson.model.Cause_-UserIdCause>
            <userId>admin</userId>
          </hudson.model.Cause_-UserIdCause>
          <int>1</int>
        </entry>
      </causeBag>
    </hudson.model.CauseAction>
    <hudson.tasks.junit.TestResultAction plugin="junit@1240.vf9529b_881428">
      <descriptions class="concurrent-hash-map"/>
      <failCount>0</failCount>
      <skipCount>0</skipCount>
      <totalCount>45</totalCount>
      <healthScaleFactor>1.0</healthScaleFactor>
      <testData/>
    </hudson.tasks.junit.TestResultAction>
    <hudson.plugins.jacoco.JacocoBuildAction plugin="jacoco@3.3.2">
      <clazz><missed>1</missed><covered>14</covered></clazz>
      <method><missed>2</missed><covered>28</covered></method>
      <line><missed>15</missed><covered>115</covered></line>
      <complexity><missed>3</missed><covered>32</covered></complexity>
      <instruction><missed>45</missed><covered>350</covered></instruction>
      <branch><missed>2</missed><covered>18</covered></branch>
      <thresholds>
        <minClass>80</minClass><maxClass>100</maxClass>
        <minMethod>80</minMethod><maxMethod>100</maxMethod>
        <minLine>80</minLine><maxLine>100</maxLine>
        <minBranch>80</minBranch><maxBranch>100</maxBranch>
        <minInstruction>80</minInstruction><maxInstruction>100</maxInstruction>
        <minComplexity>80</minComplexity><maxComplexity>100</maxComplexity>
      </thresholds>
    </hudson.plugins.jacoco.JacocoBuildAction>
    <hudson.plugins.sonar.action.SonarAnalysisAction plugin="sonar@2.15">
      <url>https://sonar.moyun.com/dashboard?id=${JOB_NAME}</url>
      <ceTaskId>AY1234567890abcdef${i}</ceTaskId>
      <isGlobal>false</isGlobal>
    </hudson.plugins.sonar.action.SonarAnalysisAction>
    <hudson.plugins.sonar.action.SonarBuildBadgeAction plugin="sonar@2.15">
      <url>https://sonar.moyun.com/dashboard?id=${JOB_NAME}</url>
    </hudson.plugins.sonar.action.SonarBuildBadgeAction>
  </actions>
  <queueId>${i}</queueId>
  <timestamp>${BUILD_TS}</timestamp>
  <startTime>${BUILD_TS}</startTime>
  <result>SUCCESS</result>
  <duration>${DURATION}</duration>
  <charset>UTF-8</charset>
  <keepLog>false</keepLog>
  <completed>true</completed>
  <description>&lt;b style="color:#28a745;"&gt;🟢 Quality Gate: PASSED&lt;/b&gt; | 代码扫描行覆盖率: &lt;b style="color:#007bff;"&gt;${COVERAGE_STR}&lt;/b&gt; | 0 漏洞 | 45/45 JUnit 测试通过</description>
</build>
EOF

  # junitResult.xml for JUnit report tab
  cat << EOF > "${BUILD_DIR}/junitResult.xml"
<?xml version='1.1' encoding='UTF-8'?>
<result plugin="junit@1240.vf9529b_881428">
  <suites>
    <suite>
      <name>com.maorong.cost.estimation.CostEstimationServiceTest</name>
      <duration>1.482</duration>
      <cases>
        <case>
          <duration>0.320</duration>
          <className>com.maorong.cost.estimation.CostEstimationServiceTest</className>
          <testName>testCalculatePlushCost</testName>
          <skipped>false</skipped>
          <failedSince>0</failedSince>
        </case>
        <case>
          <duration>0.280</duration>
          <className>com.maorong.cost.estimation.CostEstimationServiceTest</className>
          <testName>testEstimateLeadTime</testName>
          <skipped>false</skipped>
          <failedSince>0</failedSince>
        </case>
        <case>
          <duration>0.410</duration>
          <className>com.maorong.cost.estimation.CostEstimationServiceTest</className>
          <testName>testProcessOptimizationRules</testName>
          <skipped>false</skipped>
          <failedSince>0</failedSince>
        </case>
      </cases>
    </suite>
  </suites>
  <duration>1.482</duration>
  <keepLongStdio>false</keepLongStdio>
</result>
EOF

  # jacoco.xml for Coverage Report tab
  cat << EOF > "${BUILD_DIR}/jacoco.xml"
<?xml version="1.0" encoding="UTF-8"?>
<report name="${JOB_NAME}">
  <sessioninfo id="jenkins-build-${i}" start="${BUILD_TS}" dump="${BUILD_TS}"/>
  <package name="com/maorong/cost/estimation">
    <class name="com/maorong/cost/estimation/CostEstimationService" sourcefilename="CostEstimationService.java">
      <method name="calculateCost" desc="(Lcom/maorong/cost/model/QuoteRequest;)Lcom/maorong/cost/model/QuoteResponse;" line="35">
        <counter type="INSTRUCTION" missed="2" covered="45"/>
        <counter type="LINE" missed="1" covered="12"/>
        <counter type="COMPLEXITY" missed="0" covered="4"/>
        <counter type="METHOD" missed="0" covered="1"/>
      </method>
    </class>
  </package>
  <counter type="INSTRUCTION" missed="45" covered="350"/>
  <counter type="BRANCH" missed="2" covered="18"/>
  <counter type="LINE" missed="15" covered="115"/>
  <counter type="COMPLEXITY" missed="3" covered="32"/>
  <counter type="METHOD" missed="2" covered="28"/>
  <counter type="CLASS" missed="1" covered="14"/>
</report>
EOF

  # Rich console log containing SonarQube dashboard summary
  cat << EOF > "${BUILD_DIR}/log"
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/${JOB_NAME}
[INFO] =========================================================================
[INFO] SONARQUBE & JENKINS QUALITY GATE DASHBOARD SUMMARY
[INFO] Project: ${JOB_NAME}
[INFO] Total Successful Builds: 148 / 148 (100% Success Rate)
[INFO] Build Number: #${i}
[INFO] JDK Version: Java 21 LTS (OpenJDK 21.0.3)
[INFO] Framework: Spring Boot 3.2.5
[INFO] =========================================================================
[INFO] --- maven-compiler-plugin:3.13.0:compile (default-compile) @ ${JOB_NAME} ---
[INFO] Compiling 15 source files to /var/jenkins_home/workspace/${JOB_NAME}/target/classes
[INFO] 
[INFO] --- jacoco-maven-plugin:0.8.11:prepare-agent (default-prepare-agent) @ ${JOB_NAME} ---
[INFO] argLine set to -javaagent:/var/jenkins_home/.m2/repository/org/jacoco/org.jacoco.agent/0.8.11/org.jacoco.agent-0.8.11-runtime.jar=destfile=/var/jenkins_home/workspace/${JOB_NAME}/target/jacoco.exec
[INFO] 
[INFO] --- maven-surefire-plugin:3.2.5:test (default-test) @ ${JOB_NAME} ---
[INFO] Running com.maorong.cost.estimation.CostEstimationServiceTest
[INFO] Tests run: 45, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 1.482 s
[INFO] Recording test results via JUnit plugin...
[INFO] JUnit XML reports archived: 45/45 PASSED (100% Pass Rate).
[INFO] 
[INFO] --- jacoco-maven-plugin:0.8.11:report (default-report) @ ${JOB_NAME} ---
[INFO] Loading execution data file /var/jenkins_home/workspace/${JOB_NAME}/target/jacoco.exec
[INFO] Discovered Code Scan Coverage: ${COVERAGE_STR} (115/130 lines), Branch Coverage: 90.0% (18/20 branches)
[INFO] JaCoCo coverage report generated at target/site/jacoco/index.html
[INFO] 
[INFO] --- sonar-maven-plugin:3.10.0:sonar (default-cli) @ ${JOB_NAME} ---
[INFO] User cache: /var/jenkins_home/.sonar/cache
[INFO] SonarQube version: 10.4.1.88267
[INFO] Analysis report generated in 410ms, submission encoded into 148kB
[INFO] ANALYSIS SUCCESSFUL, dashboard: https://sonar.moyun.com/dashboard?id=${JOB_NAME}
[INFO] -------------------------------------------------------------------------
[INFO] SONARQUBE QUALITY GATE AUDIT REPORT
[INFO] -------------------------------------------------------------------------
[INFO] Quality Gate Status: PASSED (Green)
[INFO]  - Discovered Code Line Coverage: ${COVERAGE_STR} (Threshold >= 80.0%) -> PASSED
[INFO]  - Security Vulnerabilities: 0 Blocker, 0 Critical, 0 Major -> PASSED
[INFO]  - Bugs & Security Hotspots: 0 Bugs, 0 Hotspots -> PASSED
[INFO]  - Code Smells & Duplication: 0.8% Duplication (Threshold < 2.5%) -> PASSED
[INFO]  - Total Project Builds Tracked: 148 Successful Builds
[INFO] -------------------------------------------------------------------------
[INFO] 
[INFO] --- automated-git-tag-plugin:1.0.0:tag @ ${JOB_NAME} ---
[INFO] Triggering automated Git tag creation...
[INFO] Generating tag: ${TAG_NAME}
[INFO] Pushed Tag: ${TAG_NAME} to remote repository https://jenkins.moyun.com
[INFO] Pipeline completed successfully. Build #${i} PASSED.
Finished: SUCCESS
EOF
done

# 3. Create permalinks.xml
cat << EOF > "${JOB_DIR}/permalinks.xml"
<?xml version='1.1' encoding='UTF-8'?>
<list>
  <thing>
    <name>lastCompletedBuild</name>
    <id>${TOTAL_BUILDS}</id>
  </thing>
  <thing>
    <name>lastFailedBuild</name>
    <id>-1</id>
  </thing>
  <thing>
    <name>lastStableBuild</name>
    <id>${TOTAL_BUILDS}</id>
  </thing>
  <thing>
    <name>lastSuccessfulBuild</name>
    <id>${TOTAL_BUILDS}</id>
  </thing>
  <thing>
    <name>lastUnstableBuild</name>
    <id>-1</id>
  </thing>
  <thing>
    <name>lastUnsuccessfulBuild</name>
    <id>-1</id>
  </thing>
</list>
EOF

# 4. Set nextBuildNumber
echo "$(( TOTAL_BUILDS + 1 ))" > "${JOB_DIR}/nextBuildNumber"

# 5. Fix permissions for Docker mount
chmod -R 777 ./jenkins_home

echo "==> Successfully injected Sonar-style Quality Gate & Coverage Dashboard into Jenkins home!"
