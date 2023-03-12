package com.fh.service.app;

import com.fh.util.PageData;

import java.util.List;

public interface LeaveService {
    public PageData findLeaveById(PageData pd) throws Exception;
    public PageData findUserByUserid(PageData pd) throws Exception;
    public PageData findDepartment(PageData pd) throws Exception;
    public List<PageData> findName(PageData pd) throws Exception;
    public PageData findLastLeave(PageData pd) throws Exception;
    public List<PageData> findUser(PageData pd) throws Exception;
    public void insertLeave(PageData pd) throws Exception;
    public void updateLeave(PageData pd) throws Exception;
}
