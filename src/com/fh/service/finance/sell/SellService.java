package com.fh.service.finance.sell;

import com.fh.pojo.*;
import com.fh.util.PageData;

import java.util.List;

public interface SellService {
    public List<PageData> findSellContract(PageData pd) throws Exception;
    public List<PageData> findPurContract(PageData pd) throws Exception;
    public List<tbcontmon> findContmon(PageData pd) throws Exception;
    public List<tbinvmon> findInvmon(PageData pd) throws Exception;
    public List<tbbusimon> findBusimon(PageData pd) throws Exception;
    public tbcontract findContractById(PageData contract) throws Exception;
    public List<PageData> getCno(PageData pd) throws Exception;
    public List<PageData> getPno(PageData pd) throws Exception;
    public List<PageData> getClino(PageData pd) throws Exception;
    public List<PageData> getSupno(PageData pd) throws Exception;
    public void deleteContract(PageData pd) throws Exception;
    public void deleteContmon(PageData pd) throws Exception;
    public void deleteInvmon(PageData pd) throws Exception;
    public void deleteBusimon(PageData pd) throws Exception;
    public void insertContract(PageData pd) throws Exception;
    public void insertContract(tbcontract contract) throws Exception;
    public void insertContmon(tbcontmon contmon) throws Exception;
    public void insertInvmon(tbinvmon invmon) throws Exception;
    public void insertBusimon(tbbusimon busimon) throws Exception;
    public void insertContmon(PageData pd) throws Exception;
    public void insertInvmon(PageData pd) throws Exception;
    public void insertBusimon(PageData pd) throws Exception;
    public void updateContractById(tbcontract contract) throws Exception;
    public void updateContmonById(tbcontmon contmon) throws Exception;
    public void updateInvmonById(tbinvmon invmon) throws Exception;
    public void updateBusimonById(tbbusimon busimon) throws Exception;
    public tbcontmon lastContmon(PageData pd) throws Exception;
    public tbinvmon lastInvmon(PageData pageData) throws Exception;
    public tbbusimon lastBusimon(PageData pd) throws Exception;
    public PageData maxConid(PageData pd) throws Exception;
    public List<PageData> conWord(PageData pd) throws Exception;
    public List<PageData> clinoWord(PageData pd) throws Exception;
    public List<PageData> supnoWord(PageData pd) throws Exception;


}
