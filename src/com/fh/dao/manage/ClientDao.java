package com.fh.dao.manage;

public interface ClientDao {
    public Object findAllList(String str, Object obj);
    public Object findById(String str, Object obj);
    public Object getByClifname(String str, Object obj);
    public Object findSellpById(String str, Object obj);
    public Object deleteClient(String str, Object obj);
    public Object deleteSellpById(String str, Object obj);
    public Object findCsname(String str, Object obj);
    public Object findClino(String str, Object obj);
    public Object findClifname(String str, Object obj);
    public Object updateClientById(String str, Object obj);
    public Object updateSellpById(String str, Object obj);
    public Object updateTaxinfoById(String str, Object obj);
    public Object insertClient(String str, Object obj);
    public Object insertTaxinfo(String str, Object obj);
    public Object insertSellp(String str, Object obj);



}
