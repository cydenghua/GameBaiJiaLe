package com.dcode.wxnotification;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;

/**
 * Created by denghua on 2018-04-04.
 */

public class MyApplication extends Application {

    public static MyApplication instances;
    public static MyApplication getInstances(){
        return instances;
    }


    @Override
    public void onCreate() {
        super.onCreate();
        instances = this;
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
