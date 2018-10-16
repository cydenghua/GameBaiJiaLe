package com.example.adev.entity;


import android.text.TextUtils;

/**
 * Created by adev on 2017/4/25.
 */

public class WXMessageData {

    private Long id;
    private long msgId;
    private long msgSvrId;
    private int type;
    private int status;
    private int isSend;
    private long isShowTimer;
    private long createtime;
    private String talker;
    private String content;
    private String imgPath;
    private String reserved;
    private String transContent;
    private String transBrandWording;
    private long talkerId;
    private String bizClientMsgId;
    private long bizChatId;
    private String bizChatUserId;
    private long msgSeq;
    private int flag;

    private String userName;
    private String nickName;

    public WXMessageData(Long id, long msgId, long msgSvrId, int type, int status,
                         int isSend, long isShowTimer, long createtime, String talker,
                         String content, String imgPath, String reserved, String transContent,
                         String transBrandWording, long talkerId, String bizClientMsgId,
                         long bizChatId, String bizChatUserId, long msgSeq, int flag,
                         String userName, String nickName) {
        this.id = id;
        this.msgId = msgId;
        this.msgSvrId = msgSvrId;
        this.type = type;
        this.status = status;
        this.isSend = isSend;
        this.isShowTimer = isShowTimer;
        this.createtime = createtime;
        this.talker = talker;
        this.content = content;
        this.imgPath = imgPath;
        this.reserved = reserved;
        this.transContent = transContent;
        this.transBrandWording = transBrandWording;
        this.talkerId = talkerId;
        this.bizClientMsgId = bizClientMsgId;
        this.bizChatId = bizChatId;
        this.bizChatUserId = bizChatUserId;
        this.msgSeq = msgSeq;
        this.flag = flag;
        this.userName = userName;
        this.nickName = nickName;
    }

    public WXMessageData() {
    }
    public Long getId() {
        return this.id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public long getMsgId() {
        return this.msgId;
    }
    public void setMsgId(long msgId) {
        this.msgId = msgId;
    }
    public long getMsgSvrId() {
        return this.msgSvrId;
    }
    public void setMsgSvrId(long msgSvrId) {
        this.msgSvrId = msgSvrId;
    }
    public int getType() {
        return this.type;
    }
    public void setType(int type) {
        this.type = type;
    }
    public int getStatus() {
        return this.status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public int getIsSend() {
        return this.isSend;
    }
    public void setIsSend(int isSend) {
        this.isSend = isSend;
    }
    public long getIsShowTimer() {
        return this.isShowTimer;
    }
    public void setIsShowTimer(long isShowTimer) {
        this.isShowTimer = isShowTimer;
    }
    public long getCreatetime() {
        return this.createtime;
    }
    public void setCreatetime(long createtime) {
        this.createtime = createtime;
    }
    public String getTalker() {
        if(TextUtils.isEmpty(this.talker)) { return "";}
        return this.talker;
    }
    public void setTalker(String talker) {
        this.talker = talker;
    }
    public String getContent() {
        if(TextUtils.isEmpty(this.content)) { return "";}
        return this.content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getImgPath() {
        if(TextUtils.isEmpty(this.imgPath)) { return "";}
        return this.imgPath;
    }
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    public String getReserved() {
        if(TextUtils.isEmpty(this.reserved)) { return "";}
        return this.reserved;
    }
    public void setReserved(String reserved) {
        this.reserved = reserved;
    }
    public String getTransContent() {
        if(TextUtils.isEmpty(this.transContent)) { return "";}
        return this.transContent;
    }
    public void setTransContent(String transContent) {
        this.transContent = transContent;
    }
    public String getTransBrandWording() {
        if(TextUtils.isEmpty(this.transBrandWording)) { return "";}
        return this.transBrandWording;
    }
    public void setTransBrandWording(String transBrandWording) {
        this.transBrandWording = transBrandWording;
    }
    public long getTalkerId() {
        return this.talkerId;
    }
    public void setTalkerId(long talkerId) {
        this.talkerId = talkerId;
    }
    public String getBizClientMsgId() {
        if(TextUtils.isEmpty(this.bizClientMsgId)) { return "";}
        return this.bizClientMsgId;
    }
    public void setBizClientMsgId(String bizClientMsgId) {
        this.bizClientMsgId = bizClientMsgId;
    }
    public long getBizChatId() {
        return this.bizChatId;
    }
    public void setBizChatId(long bizChatId) {
        this.bizChatId = bizChatId;
    }
    public String getBizChatUserId() {
        if(TextUtils.isEmpty(this.bizChatUserId)) { return "";}
        return this.bizChatUserId;
    }
    public void setBizChatUserId(String bizChatUserId) {
        this.bizChatUserId = bizChatUserId;
    }
    public long getMsgSeq() {
        return this.msgSeq;
    }
    public void setMsgSeq(long msgSeq) {
        this.msgSeq = msgSeq;
    }
    public int getFlag() {
        return this.flag;
    }
    public void setFlag(int flag) {
        this.flag = flag;
    }
    public String getUserName() {
        if(TextUtils.isEmpty(this.userName)) { return "";}
        return this.userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getNickName() {
        if(TextUtils.isEmpty(this.nickName)) { return "";}
        return this.nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    
}
