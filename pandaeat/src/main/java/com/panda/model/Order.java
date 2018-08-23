package com.panda.model;

public class Order {
    private Integer storeid;
    private Integer seatid;
    private Integer orderid;
    private Integer userid;
    private String createtime;
    private Ordercontent ordercontent;
    private String orderprice;
    private Integer customernum;
    private short orderstatue;
    private String endtime;
    private short payway;



    public Integer getStoreid() {
        return storeid;
    }

    public Integer getSeatid() {
        return seatid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public Ordercontent getOrdercontent() {
        return ordercontent;
    }

    public String getOrderprice() {
        return orderprice;
    }

    public Integer getCustomernum() {
        return customernum;
    }

    public short getOrderstatue() {
        return orderstatue;
    }

    public String getEndtime() {
        return endtime;
    }

    public short getPayway() {
        return payway;
    }

    public void setStoreid(Integer storeid) {
        this.storeid = storeid;
    }

    public void setSeatid(Integer seatid) {
        this.seatid = seatid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public void setOrdercontent(Ordercontent ordercontent) {
        this.ordercontent = ordercontent;
    }

    public void setOrderprice(String orderprice) {
        this.orderprice = orderprice;
    }

    public void setCustomernum(Integer customernum) {
        this.customernum = customernum;
    }

    public void setOrderstatue(short orderstatue) {
        this.orderstatue = orderstatue;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public void setPayway(short payway) {
        this.payway = payway;
    }
}
