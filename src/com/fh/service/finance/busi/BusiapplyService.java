package com.fh.service.finance.busi;

import com.fh.util.PageData;

import java.util.List;

public interface BusiapplyService {
    public List<PageData> FindAllList(PageData pd) throws Exception;
    public List<PageData> findlogById(PageData pd) throws Exception;
}
