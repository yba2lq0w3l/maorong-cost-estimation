package com.maorong.cost.model;

public class JenkinsBuild {
    private String buildId;
    private String date;
    private String branch;
    private String commit;
    private String duration;
    private String gateStatus;
    private String tag;
    private String status;

    public JenkinsBuild() {}

    public JenkinsBuild(String buildId, String date, String branch, String commit, String duration, String gateStatus, String tag, String status) {
        this.buildId = buildId;
        this.date = date;
        this.branch = branch;
        this.commit = commit;
        this.duration = duration;
        this.gateStatus = gateStatus;
        this.tag = tag;
        this.status = status;
    }

    public String getBuildId() { return buildId; }
    public void setBuildId(String buildId) { this.buildId = buildId; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public String getCommit() { return commit; }
    public void setCommit(String commit) { this.commit = commit; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getGateStatus() { return gateStatus; }
    public void setGateStatus(String gateStatus) { this.gateStatus = gateStatus; }

    public String getTag() { return tag; }
    public void setTag(String tag) { this.tag = tag; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
