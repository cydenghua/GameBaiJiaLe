package com.example.adev.activity;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.example.adev.entity.WXContactData;
import com.example.adev.wechatservice.MyApplication;
import com.example.adev.wechatservice.R;
import com.example.adev.wechatservice.WeChatDatabase;
import com.example.adev.widget.quickadapter.BaseAdapterHelper;
import com.example.adev.widget.quickadapter.QuickAdapter;

public class SetChatGroupActivity extends AppCompatActivity {

    private ListView mListView;
    private QuickAdapter<WXContactData> mAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_set_chat_group);
        setTitle("设置聊天群");

        mListView = (ListView)findViewById(R.id.list);

        mAdapter = new QuickAdapter<WXContactData>(this, R.layout.activity_set_chat_group_item) {
            @Override
            protected void convert(BaseAdapterHelper helper, WXContactData item) {
                helper.setText(R.id.tv_name, item.getNickName());
            }
        };

        mListView.setAdapter(mAdapter);

        mAdapter.replaceAll(WeChatDatabase.getInstance().getWxContact());

        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, final int position, long id) {
                AlertDialog.Builder builder = new AlertDialog.Builder(SetChatGroupActivity.this);
                builder.setMessage("确认选择： " + mAdapter.getItem(position).getNickName() + " ？");
                builder.setTitle("提示");
                builder.setPositiveButton("确认", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        MyApplication.getInstances().setCurrChatGroup(mAdapter.getItem(position).getUserName(), mAdapter.getItem(position).getNickName());
                        setTitle("设置群,当前：" + mAdapter.getItem(position).getNickName());
                        SetChatGroupActivity.this.finish();
                    }
                });
                builder.setNegativeButton("取消", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                builder.create().show();
            }
        });
    }
}
