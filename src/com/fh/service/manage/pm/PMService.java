package com.fh.service.manage.pm;

import com.fh.pojo.tbpm;
import com.fh.util.PageData;

import java.util.List;

public interface PMService {
    public List<tbpm> findAllList();

    public tbpm findPM(tbpm tbpm);

    public void deletePMById(tbpm tbpm);

    public void updatePM(tbpm tbpm);

    public void insertPM(tbpm tbpm);

    public List<PageData> findPno(PageData pd);
}
