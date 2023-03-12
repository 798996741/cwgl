package com.fh.service.manage.pm.impl;

import com.fh.dao.manage.PMDao;
import com.fh.pojo.tbpm;
import com.fh.service.manage.pm.PMService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("pmServiceImpl")
public class PMServiceImpl implements PMService {

    @Resource(name = "pmDaoImpl")
    private PMDao pmDao;

    @Override
    public List<tbpm> findAllList() {
        return (List<tbpm>)pmDao.findAllList("PMMapper.findAllList");
    }

    @Override
    public tbpm findPM(tbpm tbpm) {
        return (tbpm) pmDao.findPM("PMMapper.findPM",tbpm);
    }

    @Override
    public void deletePMById(tbpm tbpm) {
        pmDao.deletePMById("PMMapper.deletePMById",tbpm.getPmid());
    }

    @Override
    public void updatePM(tbpm tbpm) {
        pmDao.updatePM("PMMapper.updatePM",tbpm);

    }

    @Override
    public void insertPM(tbpm tbpm) {
        pmDao.insertPM("PMMapper.insertPM",tbpm);
    }

    @Override
    public List<PageData> findPno(PageData pd) {
        return (List<PageData>)pmDao.findPno("PMMapper.findPno",pd);
    }


}
