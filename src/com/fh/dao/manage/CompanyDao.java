package com.fh.dao.manage;

public interface CompanyDao {
    public Object findAllList(String str, Object obj);

    public Object findById(String str, Object obj);

    public Object findBankById(String str, Object obj);

    public Object findCno(String str, Object obj);

    public Object insertCompany(String str, Object obj);

    public Object insertBankinfo(String str, Object obj);

    public Object insertTaxiInfo(String str, Object obj);

    public Object deleteCompanyById(String str, Object obj);

    public Object deleteBankById(String str, Object obj);

    public Object updateCompanyById(String str, Object obj);

    public Object updateBankInfoById(String str, Object obj);

    public Object updateTxaInfoById(String str, Object obj);
}
