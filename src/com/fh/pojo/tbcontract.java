package com.fh.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class tbcontract implements Serializable{
    private Long conid;
    private String cno;
    private String pno;
    private String clino;
    private String conno;
    private String signtime;
    private String purno;
    private String asign;
    private String bsign;
    private String type;
    private BigDecimal consmon;
    private BigDecimal busismon;
    private String isarc;
    private String place;
    private String paymet;
    private String busiexp;
    private String state;
    private String isaudit;
    public String getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(String isaudit) {
        this.isaudit = isaudit;
    }



    @Override
    public String toString() {
        return "tbcontract{" +
                "conid=" + conid +
                ", cno='" + cno + '\'' +
                ", pno='" + pno + '\'' +
                ", clino='" + clino + '\'' +
                ", conno='" + conno + '\'' +
                ", signtime='" + signtime + '\'' +
                ", purno='" + purno + '\'' +
                ", asign='" + asign + '\'' +
                ", bsign='" + bsign + '\'' +
                ", type='" + type + '\'' +
                ", consmon=" + consmon +
                ", busismon=" + busismon +
                ", isarc='" + isarc + '\'' +
                ", place='" + place + '\'' +
                ", paymet='" + paymet + '\'' +
                ", busiexp='" + busiexp + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPaymet() {
        return paymet;
    }

    public void setPaymet(String paymet) {
        this.paymet = paymet;
    }

    public String getBusiexp() {
        return busiexp;
    }

    public void setBusiexp(String busiexp) {
        this.busiexp = busiexp;
    }

    public String getIsarc() {
        return isarc;
    }

    public void setIsarc(String isarc) {
        this.isarc = isarc;
    }

    public Long getConid() {
        return conid;
    }

    public void setConid(Long conid) {
        this.conid = conid;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getPno() {
        return pno;
    }

    public void setPno(String pno) {
        this.pno = pno;
    }

    public String getClino() {
        return clino;
    }

    public void setClino(String clino) {
        this.clino = clino;
    }

    public String getConno() {
        return conno;
    }

    public void setConno(String conno) {
        this.conno = conno;
    }

    public String getSigntime() {
        return signtime;
    }

    public void setSigntime(String signtime) {
        this.signtime = signtime;
    }

    public String getPurno() {
        return purno;
    }

    public void setPurno(String purno) {
        this.purno = purno;
    }

    public String getAsign() {
        return asign;
    }

    public void setAsign(String asign) {
        this.asign = asign;
    }

    public String getBsign() {
        return bsign;
    }

    public void setBsign(String bsign) {
        this.bsign = bsign;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BigDecimal getConsmon() {
        return consmon;
    }

    public void setConsmon(BigDecimal consmon) {
        this.consmon = consmon;
    }

    public BigDecimal getBusismon() {
        return busismon;
    }

    public void setBusismon(BigDecimal busismon) {
        this.busismon = busismon;
    }
}
