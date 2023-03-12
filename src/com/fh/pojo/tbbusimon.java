package com.fh.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class tbbusimon implements Serializable{
    private Long busimid;
    private Long conid;
    private BigDecimal busiamon;
    private String busitime;
    private BigDecimal businmon;
    private BigDecimal paymon;
    private String username;
    private String cztime;
    private String payee;
    private String remark;

    @Override
    public String toString() {
        return "tbbusimon{" +
                "busimid=" + busimid +
                ", conid=" + conid +
                ", busiamon=" + busiamon +
                ", busitime='" + busitime + '\'' +
                ", businmon=" + businmon +
                ", paymon=" + paymon +
                ", username='" + username + '\'' +
                ", cztime='" + cztime + '\'' +
                ", payee='" + payee + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public String getPayee() {
        return payee;
    }

    public void setPayee(String payee) {
        this.payee = payee;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getBusimid() {
        return busimid;
    }

    public void setBusimid(Long busimid) {
        this.busimid = busimid;
    }

    public Long getConid() {
        return conid;
    }

    public void setConid(Long conid) {
        this.conid = conid;
    }

    public BigDecimal getBusiamon() {
        return busiamon;
    }

    public void setBusiamon(BigDecimal busiamon) {
        this.busiamon = busiamon;
    }

    public String getBusitime() {
        return busitime;
    }

    public void setBusitime(String busitime) {
        this.busitime = busitime;
    }

    public BigDecimal getBusinmon() {
        return businmon;
    }

    public void setBusinmon(BigDecimal businmon) {
        this.businmon = businmon;
    }

    public BigDecimal getPaymon() {
        return paymon;
    }

    public void setPaymon(BigDecimal paymon) {
        this.paymon = paymon;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCztime() {
        return cztime;
    }

    public void setCztime(String cztime) {
        this.cztime = cztime;
    }
}
