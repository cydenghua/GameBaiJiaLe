package com.example.adev.wechatservice;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import static android.content.Context.TELEPHONY_SERVICE;

/**
 * Created by adev on 2017/5/19.
 */

public class GetWeChatInfo {

    public static final String WX_ROOT_PATH = "/data/data/com.tencent.mm/";
    private static final String WX_SP_UIN_PATH = WX_ROOT_PATH + "shared_prefs/auth_info_key_prefs.xml";
    private static final String WX_DB_DIR_PATH = WX_ROOT_PATH + "MicroMsg";
    private static final String WX_DB_FILE_NAME = "EnMicroMsg.db";

    private String mPhoneIMEI;
    private String mCurrWxUin;
    private String mDbPassword;
    private List<File> mWxDbPathList = new ArrayList<>();

    private Context mContext;

    public GetWeChatInfo(Context context) {
        mContext = context;
        getPhoneIMEI();
        //获取文件访问权限
//        execRootCmd("chmod 777 -R " + WX_ROOT_PATH);
        execRootCmd("chmod -R 777 " + WX_ROOT_PATH);
        //获取微信uin
        getCurrWxUin(); //<int name="_auth_uin" value="209077010" />
        //获取微信数据库密码
        getDbPassword();
        //查找微信数据库
        File wxDataDir = new File(WX_DB_DIR_PATH);
        mWxDbPathList.clear();
        searchFile(wxDataDir, WX_DB_FILE_NAME);

        MyApplication.getInstances().setWeChatDbFile(mWxDbPathList.get(0).getPath());
        MyApplication.getInstances().setWeChatDbPW(mDbPassword);
    }

    private void getPhoneIMEI() {
        TelephonyManager tm = (TelephonyManager) mContext.getSystemService(TELEPHONY_SERVICE);
        mPhoneIMEI = tm.getDeviceId();
    }

    /**
     * 执行linux指令
     * @param paramString
     */
    public void execRootCmd(String paramString) {
        try {
            Process localProcess = Runtime.getRuntime().exec("su");
            Object localObject = localProcess.getOutputStream();
            DataOutputStream localDataOutputStream = new DataOutputStream((OutputStream) localObject);
            String str = String.valueOf(paramString);
            localObject = str + "\n";
            localDataOutputStream.writeBytes((String) localObject);
            localDataOutputStream.flush();
            localDataOutputStream.writeBytes("exit\n");
            localDataOutputStream.flush();
            localProcess.waitFor();
            localObject = localProcess.exitValue();
        } catch (Exception localException) {
            localException.printStackTrace();
        }
    }

    /**
     * 获取微信的uid
     * 微信的uid存储在SharedPreferences里面
     * 存储位置\data\data\com.tencent.mm\shared_prefs\auth_info_key_prefs.xml
     */
    private void getCurrWxUin() {
        mCurrWxUin = null;
        File file = new File(WX_SP_UIN_PATH);
        try {
            FileInputStream in = new FileInputStream(file);
            SAXReader saxReader = new SAXReader();
            Document document = saxReader.read(in);
            Element root = document.getRootElement();
            List<Element> elements = root.elements();
            for (Element element : elements) {
                if ("_auth_uin".equals(element.attributeValue("name"))) {
                    mCurrWxUin = element.attributeValue("value");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
//            LogUtil.log("获取微信uid失败，请检查auth_info_key_prefs文件权限");
        }
    }

    /**
     * 根据imei和uin生成的md5码，获取数据库的密码（去前七位的小写字母）
     *
     * @return
     */
    private void getDbPassword() {
        if (TextUtils.isEmpty(mPhoneIMEI) || TextUtils.isEmpty(mCurrWxUin)) {
//            LogUtil.log("初始化数据库密码失败：imei或uid为空");
            return;
        }
        String md5 = md5(mPhoneIMEI + mCurrWxUin);
        String password = md5.substring(0, 7).toLowerCase();
        mDbPassword = password;
    }

    /**
     * md5加密
     *
     * @param content
     * @return
     */
    private String md5(String content) {
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
            md5.update(content.getBytes("UTF-8"));
            byte[] encryption = md5.digest();//加密
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < encryption.length; i++) {
                if (Integer.toHexString(0xff & encryption[i]).length() == 1) {
                    sb.append("0").append(Integer.toHexString(0xff & encryption[i]));
                } else {
                    sb.append(Integer.toHexString(0xff & encryption[i]));
                }
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 递归查询微信本地数据库文件
     *
     * @param file     目录
     * @param fileName 需要查找的文件名称
     */
    private void searchFile(File file, String fileName) {
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            if (files != null) {
                for (File childFile : files) {
                    searchFile(childFile, fileName);
                }
            }
        } else {
            if (fileName.equals(file.getName())) {
                mWxDbPathList.add(file);
            }
        }
    }

}
