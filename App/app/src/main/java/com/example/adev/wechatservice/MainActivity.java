package com.example.adev.wechatservice;

import android.content.Intent;
import android.os.Handler;
import android.os.Message;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.adev.activity.BaseActivity;
import com.example.adev.activity.SetChatGroupActivity;
import com.example.adev.activity.SetConfigActivity;
import com.example.adev.activity.UploadMessageActivity;

public class MainActivity extends BaseActivity {

    private Button mBtnSetConfig;
    private Button mBtnSetGroup;
    private Button mBtnUploadMessage;
    private Button mBtnRestart;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setTitle("聊天服务");
        mBtnSetConfig = (Button)findViewById(R.id.btn_set_config);
        mBtnSetConfig.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, SetConfigActivity.class));
            }
        });
        mBtnSetGroup = (Button)findViewById(R.id.btn_set_group);
        mBtnSetGroup.setOnClickListener(clickSetGroup);
        mBtnUploadMessage = (Button)findViewById(R.id.btn_upload_message);
        mBtnUploadMessage.setOnClickListener(clickUploadMessage);

        mBtnRestart = (Button)findViewById(R.id.btn_restart);
        mBtnRestart.setOnClickListener(clickRestart);

        showLoading();
        new Thread(new Runnable() {
            @Override
            public void run() {
                syncWechatDatabase();
                mHandler.sendEmptyMessage(0);
            }
        }).start();
    }

    @Override
    protected int getLayoutResource() {
        return R.layout.activity_main;
    }

    @Override
    protected void onResume() {
        super.onResume();
        mBtnSetGroup.setText("设置聊天群：" + MyApplication.getInstances().getCurrChatGroupName());
    }

    private Handler mHandler = new Handler(){
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if(msg.what == 0) {
                hideLoading();
            }
            if(msg.what == 1) {
                showToast((String)msg.obj);
            }
        }
    };

    View.OnClickListener clickSetGroup = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            startActivity(new Intent(MainActivity.this, SetChatGroupActivity.class));
        }
    };
    View.OnClickListener clickUploadMessage = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            startActivity(new Intent(MainActivity.this, UploadMessageActivity.class));
        }
    };
    View.OnClickListener clickRestart = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
        Intent i = getBaseContext().getPackageManager().getLaunchIntentForPackage(getBaseContext().getPackageName());
                i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(i);
        }
    };

    private void syncWechatDatabase(){
        try{
            new GetWeChatInfo(this);
            WeChatDatabase.getInstance();
        }catch (Exception e){
            Message msg = new Message();
            msg.what = 1;
            msg.obj = e.getMessage();
            mHandler.sendMessage(msg);
        }
    }
}

//    Intent i = getBaseContext().getPackageManager()
//            .getLaunchIntentForPackage(getBaseContext().getPackageName());
//            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//                    startActivity(i);