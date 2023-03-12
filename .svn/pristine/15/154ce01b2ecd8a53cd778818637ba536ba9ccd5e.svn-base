package com.fh.pojo;

import java.util.HashMap;
import java.util.Map;

public class Product {
    private String id;
    private String name;
    private String price;
    private String detail;

    public Product() {

    }

    public Product(String id, String name, String price, String detail) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.detail = detail;
    }

    public Map toMap(){
        HashMap<String, Object> map = new HashMap();
        map.put("id",id);
        map.put("name",name);
        map.put("price",price);
        map.put("detail",detail);
        return map;
    }
}
