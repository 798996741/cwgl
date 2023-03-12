package com.fh.service.finance.reim.impl;

import com.fh.dao.DAO;
import com.fh.service.finance.reim.ReimdetService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service(   "reimdetServiceImpl")
public class ReimdetServiceImpl implements ReimdetService {
    @Resource(name = "daoSupport")
    private DAO dao;

    @Override
    public List<PageData> FindAllList(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.FindAllList",pd);
    }

    @Override
    public List<PageData> getclassname(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getclassname",pd);
    }

    @Override
    public List<PageData> getOneclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getOneclass",pd);
    }

    @Override
    public List<PageData> getTowclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getTowclass",pd);
    }

    @Override
    public List<PageData> getThreeclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getThreeclass",pd);
    }

    @Override
    public List<PageData> getfourclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getfourclass",pd);
    }

    @Override
    public List<PageData> changefourclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.changefourclass",pd);
    }

    @Override
    public List<PageData> changethreeclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.changethreeclass",pd);
    }

    @Override
    public List<PageData> changetwoclass(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.changetwoclass",pd);
    }

    @Override
    public List<PageData> getPdec(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getPdec",pd);
    }

    @Override
    public List<PageData> getcsname(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getcsname",pd);
    }

    @Override
    public List<PageData> getname(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getname",pd);
    }

    @Override
    public List<PageData> getReimname(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getReimname",pd);
    }

    @Override
    public List<PageData> getReimstat(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.getReimstat",pd);
    }

    @Override
    public List<PageData> shWarn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.shWarn",pd);
    }

    @Override
    public List<PageData> sh2Warn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.sh2Warn",pd);
    }

    @Override
    public List<PageData> bxWarn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimdetMapper.bxWarn",pd);
    }

    @Override
    public PageData getUser(PageData pd) throws Exception {
        return (PageData) dao.findForObject("ReimdetMapper.getUser",pd);
    }

    @Override
    public PageData findReimdetById(PageData pd) throws Exception {
        return (PageData)dao.findForObject("ReimdetMapper.findReimdetById",pd);
    }


    @Override
    public void updateReimdet(PageData pd) throws Exception {
        dao.update("ReimdetMapper.updateReimdet",pd);
    }

    @Override
    public void updateIsreim(PageData pd) throws Exception {
        dao.update("ReimdetMapper.updateIsreim",pd);
    }

    @Override
    public void deleteReimdetbyid(PageData pd) throws Exception {
        dao.delete("ReimdetMapper.deleteReimdetbyid", pd);
    }

    @Override
    public void insertReimdet(PageData pd) throws Exception {
        dao.save("ReimdetMapper.insertReimdet", pd);
    }

}
