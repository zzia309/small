package cn.runnerup.model;

import java.util.Date;

public class Woflow {
    private Integer id;

    private Integer wo;

    private String wotype;

    private String oldstatus;

    private String status;

    private Integer operator;

    private Integer createdby;

    private String creater;

    private Date created;

    private String descr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWo() {
        return wo;
    }

    public void setWo(Integer wo) {
        this.wo = wo;
    }

    public String getWotype() {
        return wotype;
    }

    public void setWotype(String wotype) {
        this.wotype = wotype == null ? null : wotype.trim();
    }

    public String getOldstatus() {
        return oldstatus;
    }

    public void setOldstatus(String oldstatus) {
        this.oldstatus = oldstatus == null ? null : oldstatus.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }
}