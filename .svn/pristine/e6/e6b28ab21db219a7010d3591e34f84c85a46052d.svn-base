package com.fh.service.app.impl;

import com.fh.dao.DAO;
import com.fh.service.app.LeaveService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("leaveServiceImpl")
public class LeaveServiceImpl implements LeaveService {
    @Resource(name = "daoSupport")
    private DAO dao;
    @Override
    public PageData findLeaveById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("LeaveMapper.findLeaveById",pd);
    }

    @Override
    public PageData findUserByUserid(PageData pd) throws Exception {
        return (PageData) dao.findForObject("LeaveMapper.findUserByUserid",pd);
    }

    @Override
    public PageData findDepartment(PageData pd) throws Exception {
        return (PageData) dao.findForObject("LeaveMapper.findDepartment",pd);
    }

    @Override
    public List<PageData> findName(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("LeaveMapper.findName",pd);
    }

    @Override
    public PageData findLastLeave(PageData pd) throws Exception {
        return (PageData) dao.findForObject("LeaveMapper.findLastLeave",pd);
    }

    @Override
    public List<PageData> findUser(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("LeaveMapper.findUser",pd);
    }

    @Override
    public void insertLeave(PageData pd) throws Exception {
        dao.save("LeaveMapper.insertLeave",pd);
    }

    @Override
    public void updateLeave(PageData pd) throws Exception {
        dao.update("LeaveMapper.updateLeave",pd);
    }
}
