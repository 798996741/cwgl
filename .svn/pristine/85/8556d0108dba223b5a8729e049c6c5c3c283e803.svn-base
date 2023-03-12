package com.fh.service.manage.reimfy;

import com.fh.entity.AreaManage;
import com.fh.entity.Page;
import com.fh.pojo.tbreimfy;
import com.fh.util.PageData;

import java.util.List;

public interface ReimfyService {
    List<PageData> findReimfy(PageData pd) throws Exception;
    List<PageData> list(Page page) throws Exception;
    List<tbreimfy> listByEnCode(String encode) throws Exception;
    List<tbreimfy> listByParentId(String parentid) throws Exception;
    PageData findReimfyByEncode(PageData pd) throws Exception;
    PageData findReimfyById(PageData pd) throws Exception;
    public List<tbreimfy> listTree(String parentId, String action) throws Exception;
    public List<tbreimfy> listTreeSelf(String parentId, String action, int count) throws Exception;

    void updateReimfy(PageData pd) throws Exception;
    void insertReimfy(PageData pd) throws Exception;
    void deleteReimfy(PageData pd) throws Exception;


}
