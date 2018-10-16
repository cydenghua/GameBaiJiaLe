package com.example.adev.activity;

import android.os.Handler;
import android.os.Message;
import android.provider.Settings;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.adev.entity.WXMessageData;
import com.example.adev.wechatservice.MyApplication;
import com.example.adev.wechatservice.R;
import com.example.adev.wechatservice.WeChatDatabase;
import com.example.adev.widget.quickadapter.BaseAdapterHelper;
import com.example.adev.widget.quickadapter.QuickAdapter;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import okhttp3.Response;

public class UploadMessageActivity extends BaseActivity {

    private static final int REFRESH_LIST = 100;
    private static final int UPLOAD_MSG = 101;
    private static final int LOAD_WX_DB = 102;

    private QuickAdapter<String> mAdapter;
    private List<String> mData = new ArrayList<>() ;

    private String mServerIp;
    private OkHttpClient mOkHttpClient;
    private SimpleDateFormat mDateFormat;
    private SimpleDateFormat mDateFormat2;
    private ListView mListView;
    private Button mBtnUp;
    private TextView mTv;
    private long mLastTime = 0L;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setTitle("上传消息");
        mServerIp = MyApplication.getInstances().GetPre("SERVER_IP");
        mDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        mDateFormat2 = new SimpleDateFormat("HH点mm分");
        mListView = (ListView)findViewById(R.id.list);
        mBtnUp = (Button)findViewById(R.id.btn_upload);
        mTv = (TextView)findViewById(R.id.tv_info);

        mAdapter = new QuickAdapter<String>(this, R.layout.activity_upload_message_item) {
            @Override
            protected void convert(BaseAdapterHelper helper, String item) {
                helper.setText(R.id.text, item);
            }
        };
        mListView.setAdapter(mAdapter);

        mBtnUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mBtnUp.setVisibility(View.INVISIBLE);
                try {
                    uploadMessage();
                }finally {
                    mBtnUp.setVisibility(View.VISIBLE);
                }
            }
        });

        //创建okHttpClient对象
        OkHttpClient.Builder builder = new OkHttpClient.Builder();
        builder.connectTimeout(60, TimeUnit.SECONDS);
        mOkHttpClient = builder.build();

        mHandler.sendEmptyMessageDelayed(LOAD_WX_DB, 1000);
    }

    @Override
    protected int getLayoutResource() {
        return R.layout.activity_upload_message;
    }

    private void reloadWXDB(){
        if(TextUtils.isEmpty(mServerIp)) {
            showToast("服务端地址不能为空。");
            mTv.setText("服务端地址不能为空！！！");
            return;
        }
        mTv.setText("复制微信消息...");
        new Thread(new Runnable() {
            @Override
            public void run() {
                WeChatDatabase.getInstance().refreshDatabase();
                mHandler.sendEmptyMessage(UPLOAD_MSG);
            }
        }).start();
    }

    private int mCurrMsgCount = 0;
    private int mCurrUploadMsgCount = 0;
    private void uploadMessage() {
        mTv.setText("开始上传消息...");
        mSendErr = false;
        mCurrUploadMsgCount = 0;
        if(mLastTime < 1) { mLastTime = System.currentTimeMillis() - 100 * 60 * 1000; }  //十分钟
        List<WXMessageData> msgList = WeChatDatabase.getInstance().getWxMessageList(mLastTime);
        mCurrMsgCount = msgList.size();
        for (WXMessageData msg : msgList) {
            sendMsgToServer(msg);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        if(mCurrMsgCount<1) {
            mTv.setText("没有新消息...");
            mHandler.sendEmptyMessageDelayed(LOAD_WX_DB, 1000);
        }
    }

    private boolean mSendErr = false;
    private void sendMsgToServer(final WXMessageData msg) {
        if(mSendErr) return;
        Log.i("XXX REQUEST,", "upload msg = " + msg.getId() + msg.getContent());
        if(!TextUtils.isEmpty(msg.getImgPath())){      msg.setContent("[图片、语音、其他]");      }
        String url = "http://" + mServerIp + ":9897/uploadMsg/";
        FormBody.Builder builder = new FormBody.Builder();
//        builder.add("Message", mGson.toJson(msg));
        builder.add("msgId", ""+msg.getMsgId());
        builder.add("msgSvrId", ""+msg.getMsgSvrId());
        builder.add("type", ""+msg.getType());
        builder.add("status", ""+msg.getStatus());
        builder.add("isSend", ""+msg.getIsSend());
        builder.add("isShowTimer", ""+msg.getIsShowTimer());
        builder.add("createtime", mDateFormat.format(new Date(msg.getCreatetime())));
        builder.add("createtimeL", ""+msg.getCreatetime());
        builder.add("talker", msg.getTalker());
        builder.add("content", getEncodeStr(msg.getContent()));
        builder.add("imgPath", msg.getImgPath());
        builder.add("reserved", msg.getReserved());
        builder.add("transContent", msg.getTransContent());
        builder.add("transBrandWording", msg.getTransBrandWording());
        builder.add("talkerId", ""+msg.getTalkerId());
        builder.add("bizClientMsgId", msg.getBizClientMsgId());
        builder.add("bizChatId", ""+msg.getBizChatId());
        builder.add("bizChatUserId", msg.getBizChatUserId());
        builder.add("msgSeq", ""+msg.getMsgSeq());
        builder.add("flag", ""+msg.getFlag());
        builder.add("userName", msg.getUserName());
        builder.add("nickName", getEncodeStr(msg.getNickName()));
        RequestBody requestBody = builder.build();
        final okhttp3.Request request = new okhttp3.Request.Builder()
                .url(url).post(requestBody).build();
        mOkHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                mData.add("上传失败：" + e.toString());
                mHandler.sendEmptyMessage(REFRESH_LIST);
                if (mSendErr) return;
                mLastTime = System.currentTimeMillis() - 5*60 * 1000;   //5分钟
                mSendErr = true;
                mHandler.sendEmptyMessageDelayed(LOAD_WX_DB, 10000);
                sendRefreshMsg();
            }
            @Override
            public void onResponse(Call call, Response response) throws IOException {
                mData.add(mDateFormat2.format(msg.getCreatetime()) + " " + msg.getNickName() + ": " + msg.getContent());
                mLastTime = msg.getCreatetime();
                mHandler.sendEmptyMessage(REFRESH_LIST);
                mCurrUploadMsgCount++;
                if(mCurrMsgCount == mCurrUploadMsgCount) {
                    mHandler.sendEmptyMessageDelayed(LOAD_WX_DB, 3000);
                    sendRefreshMsg();
                }
            }
        });
    }

    private void sendRefreshMsg() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        String url = "http://" + mServerIp + ":9897/refreshMsg/";
        FormBody.Builder builder = new FormBody.Builder();
//        builder.add("nickName", getEncodeStr(msg.getNickName()));
        RequestBody requestBody = builder.build();
        final okhttp3.Request request = new okhttp3.Request.Builder()
                .url(url).post(requestBody).build();
        mOkHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
            }
            @Override
            public void onResponse(Call call, Response response) throws IOException {
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
            if(msg.what == REFRESH_LIST) {
                mAdapter.replaceAll(mData);
                mAdapter.notifyDataSetChanged();
                mListView.smoothScrollToPosition(mAdapter.getCount()-1);
                mTv.setText("上传完成：" + mCurrUploadMsgCount + ", 总计：" + mCurrMsgCount);
            }

            if(msg.what == UPLOAD_MSG) {
                uploadMessage();
            }
            if(msg.what == LOAD_WX_DB) {
                reloadWXDB();
            }
        }
    };


}
