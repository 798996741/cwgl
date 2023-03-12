package com.fh.service.manage.busipj.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.manage.busipj.BusiPJService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("busiPJService")
public class BusiPJServiceImpl implements BusiPJService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;


    @Override
    public PageData findById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("Busipjapper.findById", pd);
    }

    @Override
    public PageData findnumber(PageData pd) throws Exception {
        return (PageData) dao.findForObject("Busipjapper.findnumber", pd);
    }

    @Override
    public List<PageData> findAlllistPage(Page page) throws Exception {
        return (List<PageData>) dao.findForList("Busipjapper.findAlllistPage", page);
    }

    @Override
    public void deleteById(PageData pd) throws Exception {
        dao.delete("Busipjapper.deleteById", pd);
    }

    @Override
    public void updatebusipj(PageData pd) throws Exception {
        dao.update("Busipjapper.updatebusipj", pd);
    }

    @Override
    public void insertbusipj(PageData pd) throws Exception {
        dao.save("Busipjapper.insertbusipj", pd);
    }
}
