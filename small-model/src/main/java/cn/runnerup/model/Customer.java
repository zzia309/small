package cn.runnerup.model;

import java.util.Date;

public class Customer {
    private Integer id;

    private String loanername;

    private String loanersex;

    private Integer loanerage;

    private String loanercard;

    private String loanertel;

    private String loanerhomeaddress;

    private String loanerunit;

    private String loanerunittel;

    private String loanermarry;

    private String loanerarea;

    private String loanerbirthplace;

    private String loanerhukou;

    private String loanerunitaddress;

    private String loanerposition;

    private String matename;

    private Integer mateage;

    private String matecard;

    private String matetel;

    private String mateunit;

    private String mateunittel;

    private String matebirthplace;

    private String matehukou;

    private String mateunitaddress;

    private String mateposition;

    private String guaranteename;

    private String guaranteesex;

    private Integer guaranteeage;

    private String guaranteecard;

    private String guaranteetel;

    private String guaranteehomeaddress;

    private String guaranteeunit;

    private String guaranteeunittel;

    private String guaranteearea;

    private String guaranteemary;

    private String guaranteebirthplace;

    private String guaranteehukou;

    private String guaranteeunitaddress;

    private String guaranteeposition;


    private String sales;

    private String manager;

    private Integer years;

    private Integer stages;

    private String cartype;

    private Double carprice;

    private Double carloans;

    private Double carrate;

    private Double carbrokerage;

    private String cartoobject;

    private String cartoaccount;

    private Double bail;

    private Double notaryfees;

    private Double otherfees;

    private Double guaranteefees;

    private boolean isFlow;

    private User createdby;

    private Date created = new Date(System.currentTimeMillis());

    private String guaranteematename;

    private String guaranteematecard;

    private String guaranteematetel;

    private boolean isbank;

    private String bankaccount;

    private boolean isgps;

	public String getGuaranteematecard() {
		return guaranteematecard;
	}

	public void setGuaranteematecard(String guaranteematecard) {
		this.guaranteematecard = guaranteematecard;
	}

	public String getGuaranteematetel() {
		return guaranteematetel;
	}

	public void setGuaranteematetel(String guaranteematetel) {
		this.guaranteematetel = guaranteematetel;
	}

	public boolean isIsbank() {
		return isbank;
	}

	public void setIsbank(boolean isbank) {
		this.isbank = isbank;
	}

	public String getBankaccount() {
		return bankaccount;
	}

	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}

	public boolean isIsgps() {
		return isgps;
	}

	public void setIsgps(boolean isgps) {
		this.isgps = isgps;
	}

	public User getCreatedby() {
		return createdby;
	}

	public void setCreatedby(User createdby) {
		this.createdby = createdby;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoanername() {
		return loanername;
	}

	public void setLoanername(String loanername) {
		this.loanername = loanername;
	}

	public String getLoanersex() {
		return loanersex;
	}

	public void setLoanersex(String loanersex) {
		this.loanersex = loanersex;
	}

	public Integer getLoanerage() {
		return loanerage;
	}

	public void setLoanerage(Integer loanerage) {
		this.loanerage = loanerage;
	}

	public String getLoanercard() {
		return loanercard;
	}

	public void setLoanercard(String loanercard) {
		this.loanercard = loanercard;
	}

	public String getLoanertel() {
		return loanertel;
	}

	public void setLoanertel(String loanertel) {
		this.loanertel = loanertel;
	}

	public String getLoanerhomeaddress() {
		return loanerhomeaddress;
	}

	public void setLoanerhomeaddress(String loanerhomeaddress) {
		this.loanerhomeaddress = loanerhomeaddress;
	}

	public String getLoanerunit() {
		return loanerunit;
	}

	public void setLoanerunit(String loanerunit) {
		this.loanerunit = loanerunit;
	}

	public String getLoanerunittel() {
		return loanerunittel;
	}

	public void setLoanerunittel(String loanerunittel) {
		this.loanerunittel = loanerunittel;
	}

	public String getLoanermarry() {
		return loanermarry;
	}

	public void setLoanermarry(String loanermarry) {
		this.loanermarry = loanermarry;
	}

	public String getLoanerarea() {
		return loanerarea;
	}

	public void setLoanerarea(String loanerarea) {
		this.loanerarea = loanerarea;
	}

	public String getLoanerbirthplace() {
		return loanerbirthplace;
	}

	public void setLoanerbirthplace(String loanerbirthplace) {
		this.loanerbirthplace = loanerbirthplace;
	}

	public String getLoanerhukou() {
		return loanerhukou;
	}

	public void setLoanerhukou(String loanerhukou) {
		this.loanerhukou = loanerhukou;
	}

	public String getLoanerunitaddress() {
		return loanerunitaddress;
	}

	public void setLoanerunitaddress(String loanerunitaddress) {
		this.loanerunitaddress = loanerunitaddress;
	}

	public String getLoanerposition() {
		return loanerposition;
	}

	public void setLoanerposition(String loanerposition) {
		this.loanerposition = loanerposition;
	}

	public String getMatename() {
		return matename;
	}

	public void setMatename(String matename) {
		this.matename = matename;
	}


	public String getGuaranteematename() {
		return guaranteematename;
	}

	public void setGuaranteematename(String guaranteematename) {
		this.guaranteematename = guaranteematename;
	}

	public Integer getMateage() {
		return mateage;
	}

	public void setMateage(Integer mateage) {
		this.mateage = mateage;
	}

	public String getMatecard() {
		return matecard;
	}

	public void setMatecard(String matecard) {
		this.matecard = matecard;
	}

	public String getMatetel() {
		return matetel;
	}

	public void setMatetel(String matetel) {
		this.matetel = matetel;
	}

	public String getMateunit() {
		return mateunit;
	}

	public void setMateunit(String mateunit) {
		this.mateunit = mateunit;
	}

	public String getMateunittel() {
		return mateunittel;
	}

	public void setMateunittel(String mateunittel) {
		this.mateunittel = mateunittel;
	}

	public String getMatebirthplace() {
		return matebirthplace;
	}

	public void setMatebirthplace(String matebirthplace) {
		this.matebirthplace = matebirthplace;
	}

	public String getMatehukou() {
		return matehukou;
	}

	public void setMatehukou(String matehukou) {
		this.matehukou = matehukou;
	}

	public String getMateunitaddress() {
		return mateunitaddress;
	}

	public void setMateunitaddress(String mateunitaddress) {
		this.mateunitaddress = mateunitaddress;
	}

	public String getMateposition() {
		return mateposition;
	}

	public void setMateposition(String mateposition) {
		this.mateposition = mateposition;
	}

	public String getGuaranteename() {
		return guaranteename;
	}

	public void setGuaranteename(String guaranteename) {
		this.guaranteename = guaranteename;
	}

	public String getGuaranteesex() {
		return guaranteesex;
	}

	public void setGuaranteesex(String guaranteesex) {
		this.guaranteesex = guaranteesex;
	}

	public Integer getGuaranteeage() {
		return guaranteeage;
	}

	public void setGuaranteeage(Integer guaranteeage) {
		this.guaranteeage = guaranteeage;
	}

	public String getGuaranteecard() {
		return guaranteecard;
	}

	public void setGuaranteecard(String guaranteecard) {
		this.guaranteecard = guaranteecard;
	}

	public String getGuaranteetel() {
		return guaranteetel;
	}

	public void setGuaranteetel(String guaranteetel) {
		this.guaranteetel = guaranteetel;
	}

	public String getGuaranteehomeaddress() {
		return guaranteehomeaddress;
	}

	public void setGuaranteehomeaddress(String guaranteehomeaddress) {
		this.guaranteehomeaddress = guaranteehomeaddress;
	}

	public String getGuaranteeunit() {
		return guaranteeunit;
	}

	public void setGuaranteeunit(String guaranteeunit) {
		this.guaranteeunit = guaranteeunit;
	}

	public String getGuaranteeunittel() {
		return guaranteeunittel;
	}

	public void setGuaranteeunittel(String guaranteeunittel) {
		this.guaranteeunittel = guaranteeunittel;
	}

	public String getGuaranteearea() {
		return guaranteearea;
	}

	public void setGuaranteearea(String guaranteearea) {
		this.guaranteearea = guaranteearea;
	}

	public String getGuaranteemary() {
		return guaranteemary;
	}

	public void setGuaranteemary(String guaranteemary) {
		this.guaranteemary = guaranteemary;
	}

	public String getGuaranteebirthplace() {
		return guaranteebirthplace;
	}

	public void setGuaranteebirthplace(String guaranteebirthplace) {
		this.guaranteebirthplace = guaranteebirthplace;
	}

	public String getGuaranteehukou() {
		return guaranteehukou;
	}

	public void setGuaranteehukou(String guaranteehukou) {
		this.guaranteehukou = guaranteehukou;
	}

	public String getGuaranteeunitaddress() {
		return guaranteeunitaddress;
	}

	public void setGuaranteeunitaddress(String guaranteeunitaddress) {
		this.guaranteeunitaddress = guaranteeunitaddress;
	}

	public String getGuaranteeposition() {
		return guaranteeposition;
	}

	public void setGuaranteeposition(String guaranteeposition) {
		this.guaranteeposition = guaranteeposition;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public Integer getYears() {
		return years;
	}

	public void setYears(Integer years) {
		this.years = years;
	}

	public Integer getStages() {
		return stages;
	}

	public void setStages(Integer stages) {
		this.stages = stages;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public Double getCarprice() {
		return carprice;
	}

	public void setCarprice(Double carprice) {
		this.carprice = carprice;
	}

	public Double getCarloans() {
		return carloans;
	}

	public void setCarloans(Double carloans) {
		this.carloans = carloans;
	}

	public Double getCarrate() {
		return carrate;
	}

	public void setCarrate(Double carrate) {
		this.carrate = carrate;
	}

	public Double getCarbrokerage() {
		return carbrokerage;
	}

	public void setCarbrokerage(Double carbrokerage) {
		this.carbrokerage = carbrokerage;
	}

	public String getCartoobject() {
		return cartoobject;
	}

	public void setCartoobject(String cartoobject) {
		this.cartoobject = cartoobject;
	}

	public String getCartoaccount() {
		return cartoaccount;
	}

	public void setCartoaccount(String cartoaccount) {
		this.cartoaccount = cartoaccount;
	}

	public Double getBail() {
		return bail;
	}

	public void setBail(Double bail) {
		this.bail = bail;
	}

	public Double getNotaryfees() {
		return notaryfees;
	}

	public void setNotaryfees(Double notaryfees) {
		this.notaryfees = notaryfees;
	}

	public Double getOtherfees() {
		return otherfees;
	}

	public void setOtherfees(Double otherfees) {
		this.otherfees = otherfees;
	}

	public Double getGuaranteefees() {
		return guaranteefees;
	}

	public void setGuaranteefees(Double guaranteefees) {
		this.guaranteefees = guaranteefees;
	}

	public boolean isFlow() {
		return isFlow;
	}

	public void setFlow(boolean isFlow) {
		this.isFlow = isFlow;
	}

}