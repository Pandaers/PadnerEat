package com.panda.model;

public class Store {
    private Integer storeid;
    private Integer createtime;
    private String nickname;
    private String avatar;
    private String mobile;
    private Integer ordernum;
    private String orderprice;
    private Integer usernum;



    public Integer getStoreid() {
        return storeid;
    }

    public Integer getCreatetime() {
        return createtime;
    }

    public String getNickname() {
        return nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getMobile() {
        return mobile;
    }

    public Integer getOrdernum() {
        return ordernum;
    }

    public String getOrderprice() {
        return orderprice;
    }

    public Integer getUsernum() {
        return usernum;
    }

    public void setStoreid(Integer storeid) {
        this.storeid = storeid;
    }

    public void setCreatetime(Integer createtime) {
        this.createtime = createtime;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    public void setOrderprice(String orderprice) {
        this.orderprice = orderprice;
    }

    public void setUsernum(Integer usernum) {
        this.usernum = usernum;
    }
}
