package com.fh.service.finance.busi.impl;

import com.fh.dao.DAO;
import com.fh.service.finance.busi.BusiapplyService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("busiapplyServiceImpl")
public class BusiapplyServiceImpl implements BusiapplyService {
    @Resource(name = "daoSupport")
    private DAO dao;

    @Override
    public List<PageData> FindAllList(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("BusiApplyMapper.FindAllList",pd);
    }

    @Override
    public List<PageData> findlogById(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("BusiApplyMapper.findlogById",pd);
    }
}
