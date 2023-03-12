package com.fh.pojo;

import java.io.Serializable;

public class tbtaxinfo implements Serializable{
    private long invid;
    private long subid;
    private long supid;
    private long cliid;
    private String tname;
    private String taxno;
    private String address;
    private String tel;
    private String bankname;
    private String bankno;

    public long getCliid() {
        return cliid;
    }

    public void setCliid(long cliid) {
        this.cliid = cliid;
    }

    public long getSupid() {
        return supid;
    }

    public void setSupid(long supid) {
        this.supid = supid;
    }

    public long getInvid() {
        return invid;
    }

    public void setInvid(long invid) {
        this.invid = invid;
    }

    public long getSubid() {
        return subid;
    }

    public void setSubid(long subid) {
        this.subid = subid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTaxno() {
        return taxno;
    }

    public void setTaxno(String taxno) {
        this.taxno = taxno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    public String getBankno() {
        return bankno;
    }

    public void setBankno(String bankno) {
        this.bankno = bankno;
    }


}
