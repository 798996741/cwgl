package com.fh.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class tbcontmon implements Serializable {
    private Long conmid;
    private Long conid;
    private BigDecimal conamon;
    private BigDecimal connmon;
    private BigDecimal paymon;
    private String paytime;
    private String username;
    private String cztime;

    @Override
    public String toString() {
        return "tbcontmon{" +
                "conmid=" + conmid +
                ", conid=" + conid +
                ", conamon=" + conamon +
                ", connmon=" + connmon +
                ", paymon=" + paymon +
                ", paytime='" + paytime + '\'' +
                ", username='" + username + '\'' +
                ", cztime='" + cztime + '\'' +
                '}';
    }

    public Long getConmid() {
        return conmid;
    }

    public void setConmid(Long conmid) {
        this.conmid = conmid;
    }

    public Long getConid() {
        return conid;
    }

    public void setConid(Long conid) {
        this.conid = conid;
    }

    public BigDecimal getConamon() {
        return conamon;
    }

    public void setConamon(BigDecimal conamon) {
        this.conamon = conamon;
    }

    public BigDecimal getConnmon() {
        return connmon;
    }

    public void setConnmon(BigDecimal connmon) {
        this.connmon = connmon;
    }

    public BigDecimal getPaymon() {
        return paymon;
    }

    public void setPaymon(BigDecimal paymon) {
        this.paymon = paymon;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
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
