package com.example.rabbits;

import android.os.Bundle;


import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;

import android.view.View;
import android.widget.Button;

import java.text.SimpleDateFormat;
import java.util.Date;


public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);



        setContentView(R.layout.activity_main);

        Button serial = (Button)findViewById(R.id.serial);
        Button text = (Button)findViewById(R.id.text);
        Button sms = (Button)findViewById(R.id.sms);
        Button login = (Button)findViewById(R.id.login);
        Button webread = (Button)findViewById(R.id.webread);
        TextView textView=findViewById(R.id.date);
        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
        String currentDateandTime = sdf.format(new Date());
        textView.setText(currentDateandTime);










        Button buttonOne = findViewById(R.id.buttonOne);
        buttonOne.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {


                Intent activity2Intent = new Intent(getApplicationContext(), second.class);
                startActivity(activity2Intent);
            }

        });

        Button console = findViewById(R.id.console);
        console.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {


                Intent activity2Intent = new Intent(getApplicationContext(), console.class);
                startActivity(activity2Intent);
            }

        });




        serial.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent activity2Intent = new Intent(getApplicationContext(), serial.class);
                startActivity(activity2Intent);
            }
        });

        text.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent activity2Intent = new Intent(getApplicationContext(), text.class);
                startActivity(activity2Intent);
            }
        });

        sms.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent activity2Intent = new Intent(getApplicationContext(), sms.class);
                startActivity(activity2Intent);
            }
        });

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent activity2Intent = new Intent(getApplicationContext(), login.class);
                startActivity(activity2Intent);
            }
        });

        webread.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent activity2Intent = new Intent(getApplicationContext(), webread.class);
                startActivity(activity2Intent);
            }
        });














    }
}
