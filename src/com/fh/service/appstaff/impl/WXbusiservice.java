package com.fh.service.appstaff.impl;

import com.fh.dao.DaoSupport;
import com.fh.service.appstaff.WXbusiManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("WXbusiservice")
public class WXbusiservice implements WXbusiManager {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public void updatesche(PageData pd) throws Exception {
        dao.update("WXBusiMapper.updatesche",pd);
    }

    @Override
    public void updatemanagersche(PageData pd) throws Exception {
        dao.update("WXBusiMapper.updatemanagersche",pd);
    }

    @Override
    public void insertbusiaudit(PageData pd) throws Exception {
        dao.save("WXBusiMapper.insertbusiaudit",pd);
    }

    @Override
    public void insertbusilog(PageData pd) throws Exception {
        dao.save("WXBusiMapper.insertbusilog",pd);
    }

    @Override
    public void insertwxuser(PageData pd) throws Exception {
        dao.save("WXBusiMapper.insertwxuser",pd);
    }

    @Override
    public List<PageData> getisleader(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getisleader",pd);
    }

    @Override
    public List<PageData> getbusilogy(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogy",pd);
    }

    @Override
    public List<PageData> getbusilogn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogn",pd);
    }

    @Override
    public List<PageData> getbusilogauditory(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogauditory",pd);
    }

    @Override
    public List<PageData> getbusilogauditorn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogauditorn",pd);
    }

    @Override
    public List<PageData> getbusilogmanagerauditn(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogmanagerauditn",pd);
    }

    @Override
    public List<PageData> getbusilogmanageraudity(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.getbusilogmanageraudity",pd);
    }


    @Override
    public PageData getMaxAuditno(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXBusiMapper.getMaxAuditno",pd);
    }

    @Override
    public PageData findbusiauditById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXBusiMapper.findbusiauditById",pd);
    }

    @Override
    public List<PageData> findbusilogById(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.findbusilogById",pd);
    }

    @Override
    public List<PageData> findByauditor(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXBusiMapper.findByauditor",pd);
    }

    @Override
    public PageData findwxuserbyid(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXBusiMapper.findwxuserbyid",pd);
    }
}
