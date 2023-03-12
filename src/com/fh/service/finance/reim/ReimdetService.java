package com.fh.service.finance.reim;

import com.fh.util.PageData;

import java.util.HashMap;
import java.util.List;

public interface ReimdetService {
    public List<PageData> FindAllList(PageData pd) throws Exception;
    public List<PageData> getclassname(PageData pd) throws Exception;
    public List<PageData> getOneclass(PageData pd) throws Exception;
    public List<PageData> getTowclass(PageData pd) throws Exception;
    public List<PageData> getThreeclass(PageData pd) throws Exception;
    public List<PageData> getfourclass(PageData pd) throws Exception;
    public List<PageData> changefourclass(PageData pd) throws Exception;
    public List<PageData> changethreeclass(PageData pd) throws Exception;
    public List<PageData> changetwoclass(PageData pd) throws Exception;

    public List<PageData> getPdec(PageData pd) throws Exception;
    public List<PageData> getcsname(PageData pd) throws Exception;
    public List<PageData> getname(PageData pd) throws Exception;
    public List<PageData> getReimname(PageData pd) throws Exception;
    public List<PageData> getReimstat(PageData pd) throws Exception;
    public List<PageData> shWarn(PageData pd) throws Exception;
    public List<PageData> sh2Warn(PageData pd) throws Exception;
    public List<PageData> bxWarn(PageData pd) throws Exception;
    public PageData getUser(PageData pd) throws Exception;
    public PageData findReimdetById(PageData pd) throws Exception;
    public void updateReimdet(PageData pd) throws Exception;
    public void updateIsreim(PageData pd) throws Exception;
    public void deleteReimdetbyid(PageData pd) throws Exception;
    public void insertReimdet(PageData pd) throws Exception;

}
