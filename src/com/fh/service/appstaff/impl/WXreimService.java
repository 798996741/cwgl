package com.fh.service.appstaff.impl;

import com.fh.dao.DaoSupport;
import com.fh.service.appstaff.WXreimManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("WXreimService")
public class WXreimService implements WXreimManager {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<PageData> thismonthbusi(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.thismonthbusi",pd);
    }

    @Override
    public List<PageData> lastmonthbusi(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.lastmonthbusi",pd);
    }

    @Override
    public List<PageData> getcompany(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.getcompany",pd);
    }

    @Override
    public void insertreimaudit(PageData pd) throws Exception {
        dao.save("WXReimMapper.insertreimaudit",pd);
    }

    @Override
    public void insertreimlog(PageData pd) throws Exception {
        dao.save("WXReimMapper.insertreimlog",pd);
    }

    @Override
    public PageData getMaxAuditno(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXReimMapper.getMaxAuditno",pd);
    }

    @Override
    public List<PageData> subrecord(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.subrecord",pd);
    }

    @Override
    public PageData reimauditdetails(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXReimMapper.reimauditdetails",pd);
    }

    @Override
    public List<PageData> reimlogdetails(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.reimlogdetails",pd);
    }

    @Override
    public void updatesupsche(PageData pd) throws Exception {
        dao.update("WXReimMapper.updatesupsche",pd);
    }

    @Override
    public void updatedeptsche(PageData pd) throws Exception {
        dao.update("WXReimMapper.updatedeptsche",pd);
    }

    @Override
    public void updatemanagersche(PageData pd) throws Exception {
        dao.update("WXReimMapper.updatemanagersche",pd);
    }

    @Override
    public List<PageData> getreimdetByUid(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.getreimdetByUid",pd);
    }

    @Override
    public List<PageData> findAdminReimAudit(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.findAdminReimAudit",pd);
    }

    @Override
    public PageData findAdminReimAuditById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXReimMapper.findAdminReimAuditById",pd);
    }

    @Override
    public void insertAdminReimAudit(PageData pd) throws Exception {
        dao.save("WXReimMapper.insertAdminReimAudit",pd);
    }

    @Override
    public void updateAdminReimAudit(PageData pd) throws Exception {
        dao.update("WXReimMapper.updateAdminReimAudit",pd);
    }

    @Override
    public void deleteAdminReimAudit(PageData pd) throws Exception {
        dao.delete("WXReimMapper.deleteAdminReimAudit",pd);
    }

    @Override
    public List<PageData> findAdminReimLog(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.findAdminReimLog",pd);
    }

    @Override
    public PageData findAdminReimLogById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXReimMapper.findAdminReimLogById",pd);
    }

    @Override
    public void insertAdminReimLog(PageData pd) throws Exception {
        dao.save("WXReimMapper.insertAdminReimLog",pd);
    }

    @Override
    public void updateAdminReimLog(PageData pd) throws Exception {
        dao.update("WXReimMapper.updateAdminReimLog",pd);
    }

    @Override
    public void deleteAdminReimLog(PageData pd) throws Exception {
        dao.delete("WXReimMapper.deleteAdminReimLog",pd);
    }

    @Override
    public PageData findreimaudit(PageData pd) throws Exception {
        return (PageData) dao.findForObject("WXReimMapper.findreimaudit",pd);
    }

    @Override
    public List<PageData> findreimlog(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("WXReimMapper.findreimlog",pd);
    }


}
