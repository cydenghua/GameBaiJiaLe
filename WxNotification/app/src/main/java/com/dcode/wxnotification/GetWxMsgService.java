package com.dcode.wxnotification;

import android.accessibilityservice.AccessibilityService;
import android.content.Intent;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;

import java.util.List;

/**
 * Created by denghua on 2018-02-01.
 */

public class GetWxMsgService extends AccessibilityService {
    @Override
    public void onAccessibilityEvent(AccessibilityEvent accessibilityEvent) {

        int eventType = accessibilityEvent.getEventType();
        if(eventType == AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED) {
            List<CharSequence> texts = accessibilityEvent.getText();
            for (CharSequence s :texts) {
//                Log.e("DDDDDDD", "this is notice: "  + s);
                Intent intent = new Intent();
                intent.setAction("GetMsg");
                intent.putExtra("Msg", s);
                intent.putExtra("MsgTime", accessibilityEvent.getEventTime());
                sendOrderedBroadcast(intent,null);
            }
        }

    }

    @Override
    public void onInterrupt() {

    }


}
