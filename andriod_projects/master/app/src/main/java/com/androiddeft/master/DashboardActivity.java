/**
 * Created by Brandon Levonn McClain 26 Dec 2019 .
 */

package com.androiddeft.master;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DashboardActivity extends AppCompatActivity {
    private SessionHandler session;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);
        session = new SessionHandler(getApplicationContext());
        User user = session.getUserDetails();
        TextView welcomeText = findViewById(R.id.welcomeText);


        TextView textView=findViewById(R.id.date);
        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
        String currentDateandTime = sdf.format(new Date());
        textView.setText(currentDateandTime);

        welcomeText.setText("Welcome "+user.getFullName()+", your session will expire on "+user.getSessionExpiryDate());

        Button logoutBtn = findViewById(R.id.btnLogout);
        Button tools = findViewById(R.id.tools);
        Button letters = findViewById(R.id.letters);
        Button cb = findViewById(R.id.cb);
        Button tx = findViewById(R.id.main);

        logoutBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                session.logoutUser();
                Intent i = new Intent(DashboardActivity.this, LoginActivity.class);
                startActivity(i);
                finish();

            }
        });


        tools.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent t = new Intent(DashboardActivity.this, Tools.class);
                startActivity(t);
                finish();
            }
        });

        letters.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent abc = new Intent(DashboardActivity.this, Letters.class);
                startActivity(abc);
                finish();
            }
        });

        cb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent m = new Intent(DashboardActivity.this, Chatbot.class);
                startActivity(m);
                finish();
            }
        });

        tx.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent n = new Intent(DashboardActivity.this, MainActivity.class);
                startActivity(n);
                finish();
            }
        });


    }
}
