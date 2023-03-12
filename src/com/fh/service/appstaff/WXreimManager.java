package com.fh.service.appstaff;

import com.fh.util.PageData;

import java.util.List;

public interface WXreimManager {
    public List<PageData> thismonthbusi(PageData pd)throws Exception;
    public List<PageData> lastmonthbusi(PageData pd)throws Exception;
    public List<PageData> getcompany(PageData pd)throws Exception;

    public void insertreimaudit(PageData pd)throws Exception;
    public void insertreimlog(PageData pd)throws Exception;
    public PageData getMaxAuditno(PageData pd)throws Exception;

    public List<PageData> subrecord(PageData pd)throws Exception;
    public PageData reimauditdetails(PageData pd)throws Exception;
    public List<PageData> reimlogdetails(PageData pd)throws Exception;
    public void updatesupsche(PageData pd)throws Exception;
    public void updatedeptsche(PageData pd)throws Exception;
    public void updatemanagersche(PageData pd)throws Exception;
    public List<PageData> getreimdetByUid(PageData pd)throws Exception;

    public List<PageData> findAdminReimAudit(PageData pd)throws Exception;
    public PageData findAdminReimAuditById(PageData pd)throws Exception;
    public void insertAdminReimAudit(PageData pd)throws Exception;
    public void updateAdminReimAudit(PageData pd)throws Exception;
    public void deleteAdminReimAudit(PageData pd)throws Exception;

    public List<PageData> findAdminReimLog(PageData pd)throws Exception;
    public PageData findAdminReimLogById(PageData pd)throws Exception;
    public void insertAdminReimLog(PageData pd)throws Exception;
    public void updateAdminReimLog(PageData pd)throws Exception;
    public void deleteAdminReimLog(PageData pd)throws Exception;

    public PageData findreimaudit(PageData pd)throws Exception;
    public List<PageData> findreimlog(PageData pd)throws Exception;
}
