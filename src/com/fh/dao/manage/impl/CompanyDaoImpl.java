package com.fh.dao.manage.impl;

import com.fh.dao.manage.CompanyDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository("companyDaoImpl")
public class CompanyDaoImpl implements CompanyDao{

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;


    @Override
    public Object findAllList(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }


    @Override
    public Object findById(String str, Object obj) {
        return sqlSessionTemplate.selectOne(str,obj);
    }

    @Override
    public Object findBankById(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object findCno(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object insertCompany(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertBankinfo(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertTaxiInfo(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object deleteCompanyById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object deleteBankById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object updateCompanyById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updateBankInfoById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updateTxaInfoById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }
}
