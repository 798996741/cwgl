package com.fh.service.finance.sell.impl;

import com.fh.dao.DAO;
import com.fh.service.finance.sell.DownUpLoadService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("downUpLoadServiceImpl")
public class DownUpLoadServiceImpl implements DownUpLoadService{
    @Resource(name = "daoSupport")
    private DAO dao;


    @Override
    public void insertfile(PageData pd) throws Exception {
        dao.save("DownUpLoadMapper.insertfile", pd);
    }

    @Override
    public List<PageData> getfile(PageData pd) throws Exception {
        return (List<PageData>)dao.findForList("DownUpLoadMapper.getFile",pd);
    }

    @Override
    public PageData getTimes(PageData pd) throws Exception {
        return (PageData)dao.findForObject("DownUpLoadMapper.getTimes",pd);
    }

    @Override
    public void deleteFile(PageData pd) throws Exception {
        dao.delete("DownUpLoadMapper.deleteFile",pd);
    }
}
