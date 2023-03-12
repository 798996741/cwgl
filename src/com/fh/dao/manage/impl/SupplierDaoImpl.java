package com.fh.dao.manage.impl;

import com.fh.dao.manage.SupplierDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
@Repository("supplierDaoImpl")
public class SupplierDaoImpl implements SupplierDao {

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
    public Object getBySupfname(String str, Object obj) {
        return sqlSessionTemplate.selectOne(str,obj);
    }

    @Override
    public Object findPuecById(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object findCsname(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object findSupno(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object insertSupplier(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertTxaInfo(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertPurchase(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object deleteSupplierById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object deletePurById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object updateSupplierById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updatePurchaseById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updateTxaInfoById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object findSupfname(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }


}
