package com.fh.service.manage.supplier.impl;

import com.fh.dao.manage.SupplierDao;
import com.fh.service.manage.supplier.SupplierService;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("supplierServiceImpl")
@Transactional
public class SupplierServiceImpl implements SupplierService {
    @Resource(name = "supplierDaoImpl")
    private SupplierDao supplierDao;


    @Override
    public List<PageData> findAllList(PageData pd) {
        return (List<PageData>)supplierDao.findAllList("SupplierMapper.findAllList",pd);
    }

    @Override
    public PageData findById(PageData pd) {
        return (PageData)supplierDao.findById("SupplierMapper.findById",pd);
    }

    @Override
    public PageData getBySupfname(PageData pd) throws Exception {
        return (PageData)supplierDao.getBySupfname("SupplierMapper.getBySupfname",pd);
    }

    @Override
    public List<PageData> findPuecById(PageData pd) {
        return (List<PageData>)supplierDao.findPuecById("SupplierMapper.findPurcById",pd);
    }

    @Override
    public List<PageData> findCsname(PageData pd) {
        return (List<PageData>)supplierDao.findCsname("SupplierMapper.findCsname",pd);
    }

    @Override
    public List<PageData> findSupno(PageData pd) {
        return (List<PageData>)supplierDao.findSupno("SupplierMapper.findSupno",pd);
    }

    @Override
    public List<PageData> findSupfname(PageData pd) {
        return (List<PageData>)supplierDao.findSupfname("SupplierMapper.findSupfname",pd);
    }

    @Override
    public void insertSupplier(PageData pd) {
        supplierDao.insertSupplier("SupplierMapper.insertSupplier",pd);
    }

    @Override
    public void insertTxaInfo(PageData pd) {
        supplierDao.insertTxaInfo("SupplierMapper.insertTaxinfo",pd);
    }

    @Override
    public void insertPurchase(PageData pd) {
        supplierDao.insertPurchase("SupplierMapper.insertPurchase",pd);
    }

    @Override
    public void deleteSupplierById(PageData pd) {
        supplierDao.deleteSupplierById("SupplierMapper.deleteSupplierById",pd);
    }

    @Override
    public void deletePurById(PageData pd) {
        supplierDao.deletePurById("SupplierMapper.deletePurById",pd);
    }

    @Override
    public void updateSupplier(PageData pd) {
        supplierDao.updateSupplierById("SupplierMapper.updateSupplierById",pd);
    }

    @Override
    public void updateTxaInfoById(PageData pd) {
        supplierDao.updateTxaInfoById("SupplierMapper.updateTxaInfoById",pd);
    }

    @Override
    public void updatePurchaseById(PageData pd) {
        supplierDao.updatePurchaseById("SupplierMapper.updatePurchaseById",pd);
    }
}
