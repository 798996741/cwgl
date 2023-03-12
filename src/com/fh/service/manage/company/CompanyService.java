package com.fh.service.manage.company;

import com.fh.util.PageData;

import java.util.List;

public interface CompanyService {
    public List<PageData> findAllList(PageData pd);

    public PageData findById(PageData pd);

    public List<PageData> findBankById(PageData pd);

    public List<PageData> findCno(PageData pd);

    public void insertCompany(PageData pd);
    public void insertBankinfo(PageData pd);
    public void insertTaxinfo(PageData pd);

    public void deleteCompanyById(PageData pd);
    public void deleteBankById(PageData pd);

    public void updateCompanyById(PageData pd);
    public void updateBankInfoById(PageData pd);
    public void updateTxaInfoById(PageData pd);
}
