package com.example.adev.wechatservice;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.text.TextUtils;

/**
 * Created by adev on 2017/5/19.
 */

public class MyApplication extends Application {

    public static MyApplication instances;
    public static MyApplication getInstances(){
        return instances;
    }

    private String mWeChatDbFile;
    private String mWeChatDbPW;

    private String mCurrChatGroupID;
    private String mCurrChatGroupName;
    private String mLastMessageTime;

    @Override
    public void onCreate() {
        super.onCreate();
        instances = this;
    }

    public String getWeChatDbFile() {
        return mWeChatDbFile;
    }

    public void setWeChatDbFile(String mWeChatDbFile) {
        this.mWeChatDbFile = mWeChatDbFile;
    }

    public String getWeChatDbPW() {
        return mWeChatDbPW;
    }

    public void setWeChatDbPW(String mWeChatDbPW) {
        this.mWeChatDbPW = mWeChatDbPW;
    }

    public String getLastMessageTime() {
        if(TextUtils.isEmpty(mLastMessageTime)) {  mLastMessageTime = GetPre("LastMessageTime" + getCurrChatGroupID());     }
        return mLastMessageTime;
    }

    public void setLastMessageTime(String mLastMessageTime) {
        this.mLastMessageTime = mLastMessageTime;
        SavePre("LastMessageTime" + getCurrChatGroupID(), mLastMessageTime);
    }

    public String getCurrChatGroupID() {
        if(TextUtils.isEmpty(mCurrChatGroupID)) {  mCurrChatGroupID = GetPre("CurrChatGroupID");     }
        return mCurrChatGroupID;
    }

    public String getCurrChatGroupName() {
        if(TextUtils.isEmpty(mCurrChatGroupName)) {  mCurrChatGroupName = GetPre("CurrChatGroupName");     }
        return mCurrChatGroupName;
    }

    public void setCurrChatGroup(String currChatGroupId, String currChatGroupName) {
        mCurrChatGroupID = currChatGroupId;
        mCurrChatGroupName = currChatGroupName;
        SavePre("CurrChatGroupID", mCurrChatGroupID);
        SavePre("CurrChatGroupName", mCurrChatGroupName);
        mLastMessageTime = "";
    }

    public void SavePre(String sName, String sValue) {
        SharedPreferences sharedPreferences= getSharedPreferences("ws",  Activity.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();      //用putString的方法保存数据
        editor.putString(sName, sValue);      //提交当前数据
        editor.commit();
    }

    public String GetPre(String sName) {
        SharedPreferences sharedPreferences= getSharedPreferences("ws",  Activity.MODE_PRIVATE);
        return sharedPreferences.getString(sName, "");
    }


}
