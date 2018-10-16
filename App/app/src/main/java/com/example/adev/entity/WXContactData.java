package com.example.adev.entity;

/**
 * Created by adev on 2017/4/25.
 */

public class WXContactData {

    private String UserName;
    private String NickName;
    private String ConRemark;

    public WXContactData() {
    }
    public WXContactData(String userName, String nickName) {
        UserName = userName;
        NickName = nickName;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getNickName() {
        return NickName;
    }

    public void setNickName(String nickName) {
        NickName = nickName;
    }

    public String getConRemark() {
        return ConRemark;
    }

    public void setConRemark(String conRemark) {
        ConRemark = conRemark;
    }

}
