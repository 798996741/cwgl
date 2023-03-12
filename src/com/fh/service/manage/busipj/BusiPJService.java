package com.fh.service.manage.busipj;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

public interface BusiPJService {
    public PageData findById(PageData pd) throws Exception;
    public PageData findnumber(PageData pd) throws Exception;
    public List<PageData> findAlllistPage(Page page) throws Exception;
    public void deleteById(PageData pd) throws Exception;
    public void updatebusipj(PageData pd) throws Exception;
    public void insertbusipj(PageData pd) throws Exception;
}
