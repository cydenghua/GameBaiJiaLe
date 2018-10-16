package com.example.adev.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.adev.wechatservice.MyApplication;
import com.example.adev.wechatservice.R;

public class SetConfigActivity extends BaseActivity {

    private Button mBtnSave;
    private EditText mEtServerIp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mBtnSave = (Button)findViewById(R.id.btn_save);
        mBtnSave.setOnClickListener(clickSave);

        mEtServerIp = (EditText)findViewById(R.id.et_server_ip);
        mEtServerIp.setText(MyApplication.getInstances().GetPre("SERVER_IP"));

    }

    @Override
    protected int getLayoutResource() {
        return R.layout.activity_set_config;
    }

    View.OnClickListener clickSave = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            MyApplication.getInstances().SavePre("SERVER_IP", mEtServerIp.getText().toString().trim());
            showToast("保存成功");
        }
    };
}
