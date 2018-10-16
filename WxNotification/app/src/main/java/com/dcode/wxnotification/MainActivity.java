package com.dcode.wxnotification;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Toast;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {

    private LinearLayout mOpenLayout;
    private LinearLayout mSetLayout;
    private ListView mListView;
    private List<String> mMsgList;
    private ArrayAdapter<String> mAdapter;


    private String mServerIp;
    private OkHttpClient mOkHttpClient;

    private SimpleDateFormat mDateFormat;
    private SimpleDateFormat mDateFormat2;


    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String s = intent.getStringExtra("Msg");
//            Toast.makeText(MainActivity.this, s, Toast.LENGTH_LONG).show();
//            Log.e("dddddddd", s);
            addMsg(s);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mListView = findViewById(R.id.list_msg);
        mOpenLayout = findViewById(R.id.layout_control_accessibility);
        mOpenLayout.setOnClickListener(clickOpen);
        mSetLayout = findViewById(R.id.layout_control_set);
        mSetLayout.setOnClickListener(clickSet);

        mMsgList = new ArrayList<String>();
        mAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, mMsgList);
        mListView.setAdapter(mAdapter);

        IntentFilter filter = new IntentFilter();
        filter.addAction("GetMsg");
        this.registerReceiver(mReceiver, filter);


        mServerIp = MyApplication.getInstances().GetPre("SERVER_IP");

        //创建okHttpClient对象
        OkHttpClient.Builder builder = new OkHttpClient.Builder();
        builder.connectTimeout(6, TimeUnit.SECONDS);
        mOkHttpClient = builder.build();

        mDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mDateFormat2 = new SimpleDateFormat("HH点mm分");
    }

    @Override
    protected void onDestroy() {
        this.unregisterReceiver(mReceiver);
        super.onDestroy();
    }

    private View.OnClickListener clickOpen = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            try {
                Intent accessibleIntent = new Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS);
                startActivity(accessibleIntent);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    };

    private View.OnClickListener clickSet = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            Intent it = new Intent(MainActivity.this, SetConfigActivity.class);
            startActivity(it);
            finish();
        }
    };

    private void addMsg(String sMsg){
        mMsgList.add(0,sMsg);
        mAdapter.notifyDataSetChanged();
        sendMsg(sMsg);
    }

    private void sendMsg(final String msgStr){

        String msgFrom = "";
        String msgText = "";
        String[] msgInfo = msgStr.split(":");
        msgFrom = msgInfo[0];
        if (msgInfo.length > 1)  msgText = msgInfo[1];

        msgFrom = getEncodeStr(msgFrom);
        msgText = getEncodeStr(msgText);
        String url = "http://" + mServerIp + ":9897/uploadMsg/";

        FormBody.Builder builder = new FormBody.Builder();
//        builder.add("Message", mGson.toJson(msg));
        builder.add("msgId", ""+ System.currentTimeMillis()/1000);
//        builder.add("msgSvrId", ""+msg.getMsgSvrId());
//        builder.add("type", ""+msg.getType());
//        builder.add("status", ""+msg.getStatus());
//        builder.add("isSend", ""+msg.getIsSend());
//        builder.add("isShowTimer", ""+msg.getIsShowTimer());
        builder.add("createtime", mDateFormat.format(new Date(System.currentTimeMillis())));
        builder.add("createtimeL", ""+System.currentTimeMillis());
        builder.add("talker", msgFrom);
        builder.add("content", msgText);
//        builder.add("imgPath", msg.getImgPath());
//        builder.add("reserved", msg.getReserved());
//        builder.add("transContent", msg.getTransContent());
//        builder.add("transBrandWording", msg.getTransBrandWording());
//        builder.add("talkerId", ""+msg.getTalkerId());
//        builder.add("bizClientMsgId", msg.getBizClientMsgId());
//        builder.add("bizChatId", ""+msg.getBizChatId());
//        builder.add("bizChatUserId", msg.getBizChatUserId());
//        builder.add("msgSeq", ""+msg.getMsgSeq());
//        builder.add("flag", ""+msg.getFlag());
        builder.add("userName", msgFrom);
        builder.add("nickName", msgFrom);
        RequestBody requestBody = builder.build();
        final okhttp3.Request request = new okhttp3.Request.Builder()
                .url(url).post(requestBody).build();
        mOkHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
//                mAdapter.add("上传失败：" + e.toString());
                mMsgList.add(0, "上传失败：" + e.toString() + " : for ：" + msgStr);
                mHandler.sendEmptyMessage(1);
            }
            @Override
            public void onResponse(Call call, Response response) throws IOException {
                Log.e("dddddddd", "success:" + msgStr);
            }
        });

    }

    private String getEncodeStr(String inStr) {
        String res = "";
        if (TextUtils.isEmpty(inStr)) { inStr = ""; }
        try {
            res = URLEncoder.encode(inStr, "Utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            res = "";
        }
        return  res;
    }

    private Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if(msg.what == 1) {
                mAdapter.notifyDataSetChanged();
            }
        }
    };

}
