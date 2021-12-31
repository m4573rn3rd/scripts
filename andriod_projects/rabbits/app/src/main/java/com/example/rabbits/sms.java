package com.example.rabbits;
import android.content.Intent;
import android.net.Uri;
import android.provider.Telephony;

import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;



import android.content.Intent;
import android.net.Uri;
import android.provider.Telephony;

import android.os.Bundle;
import android.telephony.SmsManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class sms extends AppCompatActivity {

        private EditText txtMobile;
        private EditText txtMessage;
        private Button btnSms;
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_sms);
            Button smsread = (Button)findViewById(R.id.smsread);
            txtMobile = (EditText)findViewById(R.id.mblTxt);
            txtMessage = (EditText)findViewById(R.id.msgTxt);
            btnSms = (Button)findViewById(R.id.btnSend);
            btnSms.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try{
                        SmsManager smgr = SmsManager.getDefault();
                        smgr.sendTextMessage(txtMobile.getText().toString(),null,txtMessage.getText().toString(),null,null);
                        Toast.makeText(sms.this, "SMS Sent Successfully", Toast.LENGTH_SHORT).show();
                    }
                    catch (Exception e){
                       Toast.makeText(sms.this, "SMS Failed to Send, Please try again", Toast.LENGTH_SHORT).show();
                    }
                }
            });

            smsread.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent activity2Intent = new Intent(getApplicationContext(), smsread.class);
                    startActivity(activity2Intent);
                }
            });
        }
    }