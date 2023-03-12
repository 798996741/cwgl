package com.fh.service.manage.reimfy.impl;

import com.fh.dao.DAO;
import com.fh.entity.Page;
import com.fh.pojo.tbreimfy;
import com.fh.service.manage.reimfy.ReimfyService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("reimfyServiceImpl")
public class ReimfyServiceImpl implements ReimfyService{
    @Resource(name = "daoSupport")
    private DAO dao;


    @Override
    public List<PageData> findReimfy(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("ReimfyMapper.findReimfy",pd);
    }

    @Override
    public List<PageData> list(Page page) throws Exception {
        return (List<PageData>) dao.findForList("ReimfyMapper.datalistPage",page);
    }

    @Override
    public List<tbreimfy> listByEnCode(String encode) throws Exception {
        return (List<tbreimfy>) dao.findForList("ReimfyMapper.listByEnCode", encode);
    }

    @Override
    public List<tbreimfy> listByParentId(String parentid) throws Exception {
        return (List<tbreimfy>) dao.findForList("ReimfyMapper.listByParentId", parentid);
    }

    @Override
    public PageData findReimfyByEncode(PageData pd) throws Exception {
        return (PageData) dao.findForObject("ReimfyMapper.findReimfyByEncode", pd);
    }

    @Override
    public PageData findReimfyById(PageData pd) throws Exception {
        return (PageData) dao.findForObject("ReimfyMapper.findReimfyById", pd);
    }

    @Override
    public List<tbreimfy> listTree(String parentId, String action) throws Exception {
        List<tbreimfy> valueList = this.listByParentId(parentId);
        for (tbreimfy tbreimfy : valueList) {
            if("hospital".equals(action)){
                tbreimfy.setSubtbreimfy(this.listTree(tbreimfy.getReimfyid(),action));
                tbreimfy.setTarget("treeFrame");
            }else {
                tbreimfy.setTreeurl("reimfy/findReimfy.do?reimfyid="+tbreimfy.getReimfyid());
                tbreimfy.setSubtbreimfy(this.listTree(tbreimfy.getReimfyid(), ""));
                tbreimfy.setTarget("treeFrame");
            }
        }
        return valueList;
    }

    @Override
    public List<tbreimfy> listTreeSelf(String parentId, String action, int count) throws Exception {
        List<tbreimfy> valueList = null;
        if(count == 1){
            valueList = this.listByEnCode(parentId);
            for (tbreimfy tbreimfy : valueList) {
                if("hospital".equals(action)){
                    count++;
                    tbreimfy.setSubtbreimfy(this.listTreeSelf(tbreimfy.getReimfyid(),action,count));
                    tbreimfy.setTarget("treeFrame");
                }else {
                    tbreimfy.setTreeurl("reimfy/findReimfy.do?reimfyid="+tbreimfy.getReimfyid());
                    tbreimfy.setSubtbreimfy(this.listTreeSelf(tbreimfy.getReimfyid(),"",count));
                    tbreimfy.setTarget("treeFrame");
                }
            }
        }else {
            valueList = this.listByParentId(parentId);
            for (tbreimfy tbreimfy : valueList) {
                if("hospital".equals(action)){
                    tbreimfy.setSubtbreimfy(this.listTreeSelf(tbreimfy.getReimfyid(),action,count));
                    tbreimfy.setTarget("treeFrame");
                }else {
                    tbreimfy.setTreeurl("reimfy/findReimfy.do?reimfyid="+tbreimfy.getReimfyid());
                    tbreimfy.setSubtbreimfy(this.listTreeSelf(tbreimfy.getReimfyid(),"",count));
                    tbreimfy.setTarget("treeFrame");
                }
            }
        }
        return valueList;
    }

    @Override
    public void updateReimfy(PageData pd) throws Exception {
        dao.update("ReimfyMapper.updateReimfy",pd);
    }

    @Override
    public void insertReimfy(PageData pd) throws Exception {
        dao.save("ReimfyMapper.insertReimfy",pd);
    }

    @Override
    public void deleteReimfy(PageData pd) throws Exception {
        dao.delete("ReimfyMapper.deleteReimfy",pd);
    }
}
