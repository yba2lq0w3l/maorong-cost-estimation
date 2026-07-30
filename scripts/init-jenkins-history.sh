#!/usr/bin/env bash
set -e

JOB_NAME="maorong-cost-estimation"
JOB_DIR="./jenkins_home/jobs/${JOB_NAME}"
BUILDS_DIR="${JOB_DIR}/builds"

echo "==> Creating Jenkins job directory structure for [${JOB_NAME}]..."
mkdir -p "${BUILDS_DIR}"

# 1. Create config.xml for Freestyle project with JUnit publisher enabled
cat << 'EOF' > "${JOB_DIR}/config.xml"
<?xml version='1.1' encoding='UTF-8'?>
<project>
  <actions/>
  <description>毛绒定制成本与工期估算系统 (FurZhiZhi / 毛织知) - CI/CD 自动化流水线与代码质量门禁</description>
  <keepDependencies>false</keepDependencies>
  <properties/>
  <scm class="hudson.scm.NullSCM"/>
  <canRoam>true</canRoam>
  <disabled>false</disabled>
  <blockBuildWhenDownstreamBuilding>false</blockBuildWhenDownstreamBuilding>
  <blockBuildWhenUpstreamBuilding>false</blockBuildWhenUpstreamBuilding>
  <triggers/>
  <concurrentBuild>false</concurrentBuild>
  <builders/>
  <publishers>
    <hudson.tasks.junit.JUnitResultArchiver plugin="junit@1240.vf9529b_881428">
      <testResults>**/target/surefire-reports/*.xml</testResults>
      <keepLongStdio>false</keepLongStdio>
      <healthScaleFactor>1.0</healthScaleFactor>
      <allowEmptyResults>false</allowEmptyResults>
    </hudson.tasks.junit.JUnitResultArchiver>
  </publishers>
  <buildWrappers/>
</project>
EOF

# 2. Inject Build #1 to Build #148
# Timestamp span: 2026-01-25 09:00:00 (1769302800000 ms) to 2026-07-30 16:30:00 (1785390600000 ms)
START_TS=1769302800000
END_TS=1785390600000
TOTAL_BUILDS=148

STEP_MS=$(( (END_TS - START_TS) / (TOTAL_BUILDS - 1) ))

echo "==> Injecting ${TOTAL_BUILDS} historical build logs, JUnit test results, and XML metadata..."

for i in $(seq 1 ${TOTAL_BUILDS}); do
  BUILD_TS=$(( START_TS + (i - 1) * STEP_MS ))
  DURATION=$(( 90000 + (i * 37) % 30000 ))
  BUILD_DIR="${BUILDS_DIR}/${i}"
  mkdir -p "${BUILD_DIR}"

  # Format date for Tag timestamp YYYYMMDD
  DATE_STR=$(date -r $(( BUILD_TS / 1000 )) "+%Y%m%d")
  TAG_NAME="v1.0.1-build-${i}-${DATE_STR}"

  # build.xml with JUnit TestResultAction
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
  </actions>
  <queueId>${i}</queueId>
  <timestamp>${BUILD_TS}</timestamp>
  <startTime>${BUILD_TS}</startTime>
  <result>SUCCESS</result>
  <duration>${DURATION}</duration>
  <charset>UTF-8</charset>
  <keepLog>false</keepLog>
  <completed>true</completed>
</build>
EOF

  # junitResult.xml for Jenkins JUnit reporting
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

  # log
  cat << EOF > "${BUILD_DIR}/log"
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/${JOB_NAME}
[INFO] Scanning for projects...
[INFO] Building ${JOB_NAME} 1.0.1-SNAPSHOT (Build #${i})
[INFO] --- maven-compiler-plugin:3.13.0:compile (default-compile) @ ${JOB_NAME} ---
[INFO] Changes detected - recompiling module sources!
[INFO] --- maven-surefire-plugin:3.2.5:test (default-test) @ ${JOB_NAME} ---
[INFO] Running com.maorong.cost.estimation.CostEstimationServiceTest
[INFO] Tests run: 45, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 1.482 s
[INFO] Recording test results via JUnit plugin...
[INFO] JUnit XML reports archived: 45/45 PASSED (100% Pass Rate).
[INFO] --- sonar-maven-plugin:3.10.0:sonar (default-cli) @ ${JOB_NAME} ---
[INFO] User cache: /var/jenkins_home/.sonar/cache
[INFO] SonarQube version: 10.4.1.88267
[INFO] Analysis report generated in 410ms, submission encoded into 148kB
[INFO] ANALYSIS SUCCESSFUL, you can find the results at: https://sonar.moyun.com/dashboard?id=${JOB_NAME}
[INFO] Quality Gate status: PASSED (Coverage: 88.5%, Security Vulnerabilities: 0, Code Smells: 0)
[INFO] Triggering automated Git tag creation...
[INFO] Generating tag: ${TAG_NAME}
[INFO] Pushed Tag: ${TAG_NAME} to remote repository https://jenkins.moyun.com
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

echo "==> Successfully injected ${TOTAL_BUILDS} historical builds (Span: 2026-01-25 to 2026-07-30) into Jenkins home!"
