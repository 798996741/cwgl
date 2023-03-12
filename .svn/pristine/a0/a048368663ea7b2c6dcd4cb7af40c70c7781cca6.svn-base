package com.fh.dao.manage.impl;

import com.fh.dao.manage.ClientDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
@Repository("clientDaoImpl")
public class ClientDaoImpl implements ClientDao{

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
    public Object getByClifname(String str, Object obj) {
        return sqlSessionTemplate.selectOne(str,obj);
    }

    @Override
    public Object findSellpById(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object deleteClient(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object deleteSellpById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }


    @Override
    public Object findCsname(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object findClino(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object findClifname(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }

    @Override
    public Object updateClientById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updateSellpById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object updateTaxinfoById(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object insertClient(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertTaxinfo(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object insertSellp(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }
}
