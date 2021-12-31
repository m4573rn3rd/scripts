package com.example.rabbits;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.media.MediaPlayer;

import android.os.Bundle;



import android.view.View;




public class second extends AppCompatActivity {





    @Override

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_second);





    }



    public void playSong(View v){


    }



    public void pauseSong(View v) {

        mp.pause();

    }



    public void stopSong(View v) {

        mp.stop();

        mp=MediaPlayer.create(this, R.raw.abc123);

    }

}
