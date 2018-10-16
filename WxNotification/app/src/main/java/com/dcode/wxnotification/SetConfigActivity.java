package com.dcode.wxnotification;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SetConfigActivity extends AppCompatActivity {

    private Button mBtnSave;
    private EditText mEtServerIp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_set_config);

        mBtnSave = findViewById(R.id.btn_save);
        mBtnSave.setOnClickListener(clickSave);

        mEtServerIp = findViewById(R.id.et_server_ip);
        mEtServerIp.setText(MyApplication.getInstances().GetPre("SERVER_IP"));

        if (mEtServerIp.getText().toString().isEmpty() ) {
            mEtServerIp.setText("192.168.3.55");
        }
    }

    View.OnClickListener clickSave = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            MyApplication.getInstances().SavePre("SERVER_IP", mEtServerIp.getText().toString().trim());
            Toast.makeText(SetConfigActivity.this, "保存成功", Toast.LENGTH_LONG).show();

            Intent it = new Intent(SetConfigActivity.this, MainActivity.class);
            startActivity(it);
            finish();
        }
    };
}
