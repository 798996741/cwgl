package com.fh.service.appstaff;

import com.fh.util.PageData;

import java.util.List;

public interface WXbusiManager {
    public void updatesche(PageData pd)throws Exception;
    public void updatemanagersche(PageData pd)throws Exception;
    public void insertbusiaudit(PageData pd)throws Exception;
    public void insertbusilog(PageData pd)throws Exception;
    public void insertwxuser(PageData pd)throws Exception;
    public List<PageData> getisleader(PageData pd)throws Exception;
    public List<PageData> getbusilogy(PageData pd)throws Exception;
    public List<PageData> getbusilogn(PageData pd)throws Exception;
    public List<PageData> getbusilogauditory(PageData pd)throws Exception;
    public List<PageData> getbusilogauditorn(PageData pd)throws Exception;
    public List<PageData> getbusilogmanagerauditn(PageData pd)throws Exception;
    public List<PageData> getbusilogmanageraudity(PageData pd)throws Exception;
    public PageData getMaxAuditno(PageData pd)throws Exception;
    public PageData findbusiauditById(PageData pd)throws Exception;
    public List<PageData> findbusilogById(PageData pd)throws Exception;
    public List<PageData> findByauditor(PageData pd)throws Exception;
    public PageData findwxuserbyid(PageData pd)throws Exception;
}
