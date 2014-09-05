package cn.runnerup.model;

import java.util.Date;

public class Business {

    private Integer id;

    private Customer customer;

    private String credit;

    private String publicorder;

    private String court;

    private String branch;

    private Double advances;

    private Date advancedate;

    private Date loandate;

    private String insuranceagent;

    private Date insurancestart;

    private Date insuranceend;

    private String certificate;

    private boolean isimpawn;

    private boolean issonghang;

    private String carmodel;

    private String carengine;

    private String carframe;

    private String status;

    private String carno;

    private String advancebank;

    private Double amounts;

    private Double profits;

    private Date finishtime;

    private String buqicailiao;
  
    private Date songdayinhangriqi;

    public String getBuqicailiao() {
		return buqicailiao;
	}

	public void setBuqicailiao(String buqicailiao) {
		this.buqicailiao = buqicailiao;
	}

	public Date getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(Date finishtime) {
		this.finishtime = finishtime;
	}

	public Integer getId() {
		return id;
	}

	public String getCarno() {
		return carno;
	}

	public void setCarno(String carno) {
		this.carno = carno;
	}

	public String getAdvancebank() {
		return advancebank;
	}

	public void setAdvancebank(String advancebank) {
		this.advancebank = advancebank;
	}

	public Double getAmounts() {
		return amounts;
	}

	public void setAmounts(Double amounts) {
		this.amounts = amounts;
	}

	public Double getProfits() {
		return profits;
	}

	public void setProfits(Double profits) {
		this.profits = profits;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getPublicorder() {
		return publicorder;
	}

	public void setPublicorder(String publicorder) {
		this.publicorder = publicorder;
	}

	public String getCourt() {
		return court;
	}

	public void setCourt(String court) {
		this.court = court;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Double getAdvances() {
		return advances;
	}

	public void setAdvances(Double advances) {
		this.advances = advances;
	}

	public Date getAdvancedate() {
		return advancedate;
	}

	public void setAdvancedate(Date advancedate) {
		this.advancedate = advancedate;
	}

	public Date getLoandate() {
		return loandate;
	}

	public void setLoandate(Date loandate) {
		this.loandate = loandate;
	}

	public String getInsuranceagent() {
		return insuranceagent;
	}

	public void setInsuranceagent(String insuranceagent) {
		this.insuranceagent = insuranceagent;
	}

	public Date getInsurancestart() {
		return insurancestart;
	}

	public void setInsurancestart(Date insurancestart) {
		this.insurancestart = insurancestart;
	}

	public Date getInsuranceend() {
		return insuranceend;
	}

	public void setInsuranceend(Date insuranceend) {
		this.insuranceend = insuranceend;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public boolean isIsimpawn() {
		return isimpawn;
	}

	public void setIsimpawn(boolean isimpawn) {
		this.isimpawn = isimpawn;
	}

	public boolean isIssonghang() {
		return issonghang;
	}

	public void setIssonghang(boolean issonghang) {
		this.issonghang = issonghang;
	}

	public String getCarmodel() {
		return carmodel;
	}

	public void setCarmodel(String carmodel) {
		this.carmodel = carmodel;
	}

	public String getCarengine() {
		return carengine;
	}

	public void setCarengine(String carengine) {
		this.carengine = carengine;
	}

	public String getCarframe() {
		return carframe;
	}

	public void setCarframe(String carframe) {
		this.carframe = carframe;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getSongdayinhangriqi() {
		return songdayinhangriqi;
	}

	public void setSongdayinhangriqi(Date songdayinhangriqi) {
		this.songdayinhangriqi = songdayinhangriqi;
	}

}