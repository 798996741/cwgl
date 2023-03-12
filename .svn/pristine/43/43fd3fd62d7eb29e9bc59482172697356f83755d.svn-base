package com.fh.dao.manage.impl;

import com.fh.dao.manage.PMDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
@Repository("pmDaoImpl")
public class PMDaoImpl implements PMDao {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public Object findAllList(String str) {
        return sqlSessionTemplate.selectList(str);
    }

    @Override
    public Object findPM(String str, Object obj) {
        return sqlSessionTemplate.selectOne(str,obj);
    }

    @Override
    public Object deletePMById(String str, Object obj) {
        return sqlSessionTemplate.delete(str,obj);
    }

    @Override
    public Object updatePM(String str, Object obj) {
        return sqlSessionTemplate.update(str,obj);
    }

    @Override
    public Object insertPM(String str, Object obj) {
        return sqlSessionTemplate.insert(str,obj);
    }

    @Override
    public Object findPno(String str, Object obj) {
        return sqlSessionTemplate.selectList(str,obj);
    }
}
