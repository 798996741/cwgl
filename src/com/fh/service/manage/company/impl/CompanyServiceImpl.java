package com.fh.service.manage.company.impl;

import com.fh.dao.manage.CompanyDao;
import com.fh.service.manage.company.CompanyService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("companyServiceImpl")
public class CompanyServiceImpl implements CompanyService {
    @Resource(name = "companyDaoImpl")
    private CompanyDao companyDao;


    @Override
    public List<PageData> findAllList(PageData pd) {
        return (List<PageData>)companyDao.findAllList("CompanyMapper.findAllList",pd);
    }

    @Override
    public PageData findById(PageData pd) {
        return (PageData)companyDao.findById("CompanyMapper.findById",pd);
    }

    @Override
    public List<PageData> findBankById(PageData pd) {
        return (List<PageData>)companyDao.findBankById("CompanyMapper.findBankById",pd);
    }

    @Override
    public List<PageData> findCno(PageData pd) {
        return (List<PageData>)companyDao.findCno("CompanyMapper.findCno",pd);
    }


    @Override
    public void insertCompany(PageData pd) {
        companyDao.insertCompany("CompanyMapper.insertCompany",pd);
    }

    @Override
    public void insertBankinfo(PageData pd) {
        companyDao.insertBankinfo("CompanyMapper.insertBankinfo",pd);
    }

    @Override
    public void insertTaxinfo(PageData pd) {
        companyDao.insertTaxiInfo("CompanyMapper.insertTaxinfo",pd);
    }

    @Override
    public void deleteCompanyById(PageData pd) {
        companyDao.deleteCompanyById("CompanyMapper.deleteCompanyById",pd);
    }

    @Override
    public void deleteBankById(PageData pd) {
        companyDao.deleteBankById("CompanyMapper.deleteBankById",pd);
    }

    @Override
    public void updateCompanyById(PageData pd) {
        companyDao.updateCompanyById("CompanyMapper.updateCompanyById",pd);
    }

    @Override
    public void updateBankInfoById(PageData pd) {
        companyDao.updateBankInfoById("CompanyMapper.updateBankInfoById",pd);
    }

    @Override
    public void updateTxaInfoById(PageData pd) {
        companyDao.updateTxaInfoById("CompanyMapper.updateTxaInfoById",pd);
    }

}
