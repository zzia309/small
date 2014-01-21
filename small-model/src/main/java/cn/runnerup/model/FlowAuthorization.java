package cn.runnerup.model;

import java.util.Date;

public class FlowAuthorization {
    private Integer id;

    private Integer role;

    private String fromstatus;

    private String tostatus;

    private Integer priority;

    private Date created;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getFromstatus() {
        return fromstatus;
    }

    public void setFromstatus(String fromstatus) {
        this.fromstatus = fromstatus == null ? null : fromstatus.trim();
    }

    public String getTostatus() {
        return tostatus;
    }

    public void setTostatus(String tostatus) {
        this.tostatus = tostatus == null ? null : tostatus.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

}