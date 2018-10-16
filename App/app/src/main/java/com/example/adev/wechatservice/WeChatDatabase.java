package com.example.adev.wechatservice;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;

import com.example.adev.entity.WXContactData;
import com.example.adev.entity.WXMessageData;

import net.sqlcipher.Cursor;
import net.sqlcipher.database.SQLiteDatabase;
import net.sqlcipher.database.SQLiteDatabaseHook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by adev on 2017/5/19.
 */

public class WeChatDatabase {

    private String mDbFile;
    private String mDBPassWord;
    private String mLocalDbFile;

    private SQLiteDatabase mDB;

    private static WeChatDatabase ourInstance;

    public static WeChatDatabase getInstance() {
        if (null == ourInstance)  ourInstance = new WeChatDatabase();
        return ourInstance;
    }

    private WeChatDatabase() {
        mDbFile = MyApplication.getInstances().getWeChatDbFile();
        mDBPassWord = MyApplication.getInstances().getWeChatDbPW();
        mLocalDbFile = MyApplication.getInstances().getFilesDir() + "/local_message.db";
        refreshDatabase();
    }

    public static final String WX_ROOT_PATH = "/data/data/com.tencent.mm/";
    private static final String WX_SP_UIN_PATH = WX_ROOT_PATH + "shared_prefs/auth_info_key_prefs.xml";
    private static String path = Environment.getExternalStorageDirectory().toString();
    public void refreshDatabase() {
        copyFile(mDbFile, mLocalDbFile);
//        copyFile(mDbFile, path+"/amap/aa.db");
//        copyFile(WX_SP_UIN_PATH, path+"/amap/xx.xml");
        if(mDB != null && mDB.isOpen()) { mDB.close(); }

        Context context = MyApplication.getInstances();
        SQLiteDatabase.loadLibs(context);
        SQLiteDatabaseHook hook = new SQLiteDatabaseHook() {
            public void preKey(SQLiteDatabase database) {
            }
            public void postKey(SQLiteDatabase database) {
                database.rawExecSQL("PRAGMA cipher_migrate;"); //兼容2.0的数据库
            }
        };

        try {         //打开数据库连接
            mDB = SQLiteDatabase.openOrCreateDatabase(mLocalDbFile, mDBPassWord, null, hook);
        } catch (Exception e) {
            Log.e("ddddd", "读取数据库信息失败" + e.toString());
        }
    }

    /**
     * 复制单个文件
     * @param oldPath String 原文件路径 如：c:/fqf.txt
     * @param newPath String 复制后路径 如：f:/fqf.txt
     * @return boolean
     */
    public void copyFile(String oldPath, String newPath) {
        try {
            int byteRead = 0;
            File oldFile = new File(oldPath);
            if (oldFile.exists()) { //文件存在时
                InputStream inStream = new FileInputStream(oldPath); //读入原文件
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];
                while ((byteRead = inStream.read(buffer)) != -1) {
                    fs.write(buffer, 0, byteRead);
                }
                inStream.close();
            }
        } catch (Exception e) {
            System.out.println("复制单个文件操作出错");
            e.printStackTrace();

        }
    }

    public List<WXContactData> getWxContact() {
        List<WXContactData> list = new ArrayList<>();
        try {         //打开数据库连接
            Cursor c1 = mDB.rawQuery("select * from  rcontact", null);
            while (c1.moveToNext()) {
                String userName = c1.getString(c1.getColumnIndex("username"));
                String nickName = c1.getString(c1.getColumnIndex("nickname"));
                if (userName.contains("@chatroom")) {
                    list.add(new WXContactData(userName, nickName));
                }
            }
            c1.close();
        } catch (Exception e) {
            Log.e("ddddd", "读取数据库信息失败" + e.toString());
        }
        return list;
    }


    public List<WXMessageData> getWxMessageList(long lastTime){
        List<WXMessageData> list = new ArrayList<>();
        String sChatRoom = MyApplication.getInstances().getCurrChatGroupID();
        if(TextUtils.isEmpty(sChatRoom)) { return  list; }

        refreshContactMap();
        String sUserName = "";
        try {
            Cursor c1 = mDB.rawQuery("select * from  message where createTime > " + lastTime + " and talker = '" + sChatRoom + "'", null);
            while (c1.moveToNext()) {
                WXMessageData data = new WXMessageData();
                data.setMsgId(c1.getLong(c1.getColumnIndex("msgId")));
                data.setMsgSvrId(c1.getLong(c1.getColumnIndex("msgSvrId")));
                data.setType(c1.getInt(c1.getColumnIndex("type")));
                data.setStatus(c1.getInt(c1.getColumnIndex("status")));
                data.setIsSend(c1.getInt(c1.getColumnIndex("isSend")));
                data.setIsShowTimer(c1.getLong(c1.getColumnIndex("isShowTimer")));
                data.setCreatetime(c1.getLong(c1.getColumnIndex("createTime")));
                data.setTalker(c1.getString(c1.getColumnIndex("talker")));
                data.setContent(c1.getString(c1.getColumnIndex("content")));
                data.setImgPath(c1.getString(c1.getColumnIndex("imgPath")));
                data.setReserved(c1.getString(c1.getColumnIndex("reserved")));
                data.setTransContent(c1.getString(c1.getColumnIndex("transContent")));
                data.setTransBrandWording(c1.getString(c1.getColumnIndex("transBrandWording")));
                data.setTalkerId(c1.getLong(c1.getColumnIndex("talkerId")));
                data.setBizClientMsgId(c1.getString(c1.getColumnIndex("bizClientMsgId")));
                data.setBizChatId(c1.getLong(c1.getColumnIndex("bizChatId")));
                data.setBizChatUserId(c1.getString(c1.getColumnIndex("bizChatUserId")));
                data.setMsgSeq(c1.getLong(c1.getColumnIndex("msgSeq")));
                data.setFlag(c1.getInt(c1.getColumnIndex("flag")));

                if (!TextUtils.isEmpty(data.getContent()) && data.getContent().indexOf(":")>1) {
                    sUserName = data.getContent().substring(0, data.getContent().indexOf(":"));
                    data.setUserName(sUserName);
                    data.setNickName(mMapContact.get(sUserName));
                    data.setContent(data.getContent().substring(data.getContent().indexOf(":")+2, data.getContent().length()));
                }

                list.add(data);
            }
            c1.close();
        } catch (Exception e) {
            Log.e("ddddd", "读取数据库信息失败" + e.toString());
        }
        return list;
    }


    private Map<String, String> mMapContact = new HashMap<>();
    private void refreshContactMap() {
        mMapContact.clear();
        List<WXContactData> list = getWxContactList();
        for (WXContactData user :list) {
            if (TextUtils.isEmpty(user.getConRemark())) {
                mMapContact.put(user.getUserName(), user.getNickName());
            }else {
                mMapContact.put(user.getUserName(), user.getConRemark()+"(" + user.getNickName()+")");
            }
        }
    }

    public List<WXContactData> getWxContactList() {
        List<WXContactData> list = new ArrayList<>();
        try {
            Cursor c1 = mDB.rawQuery("select * from rcontact where type not in(33, 2) and length(nickname) >0 and verifyFlag = 0 order by type", null);
            while (c1.moveToNext()) {
                WXContactData data = new WXContactData();
                data.setUserName(c1.getString(c1.getColumnIndex("username")));
                data.setNickName(c1.getString(c1.getColumnIndex("nickname")));
                data.setConRemark(c1.getString(c1.getColumnIndex("conRemark")));

                list.add(data);
            }
            c1.close();
        } catch (Exception e) {
            Log.e("ddddd", "读取数据库信息失败" + e.toString());
        }
        return list;
    }
}
