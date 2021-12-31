/**
 * Created by Brandon Levonn McClain 26 Dec 2019 .
 */
package com.androiddeft.master;


import android.media.MediaPlayer;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ImageButton;

public class Letters extends AppCompatActivity {
    ImageButton letter_a;
    ImageButton letter_b;
    ImageButton letter_c;
    ImageButton letter_d;
    ImageButton letter_e;
    ImageButton letter_f;
    ImageButton letter_g;
    ImageButton letter_h;
    ImageButton letter_i;
    ImageButton letter_j;
    ImageButton letter_k;
    ImageButton letter_l;
    ImageButton letter_m;
    ImageButton letter_n;
    ImageButton letter_o;
    ImageButton letter_p;
    ImageButton letter_q;
    ImageButton letter_r;
    ImageButton letter_s;
    ImageButton letter_t;
    ImageButton letter_u;
    ImageButton letter_v;
    ImageButton letter_w;
    ImageButton letter_x;
    ImageButton letter_y;
    ImageButton letter_z;


    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_letters);



        letter_a = (ImageButton) findViewById(R.id.letter_a);
        letter_b = (ImageButton) findViewById(R.id.letter_b);
        letter_c = (ImageButton) findViewById(R.id.letter_c);
        letter_d = (ImageButton) findViewById(R.id.letter_d);
        letter_e = (ImageButton) findViewById(R.id.letter_e);
        letter_f = (ImageButton) findViewById(R.id.letter_f);
        letter_g = (ImageButton) findViewById(R.id.letter_g);
        letter_h = (ImageButton) findViewById(R.id.letter_h);
        letter_i = (ImageButton) findViewById(R.id.letter_i);
        letter_j = (ImageButton) findViewById(R.id.letter_j);
        letter_k = (ImageButton) findViewById(R.id.letter_k);
        letter_l = (ImageButton) findViewById(R.id.letter_l);
        letter_m = (ImageButton) findViewById(R.id.letter_m);
        letter_n = (ImageButton) findViewById(R.id.letter_n);
        letter_o = (ImageButton) findViewById(R.id.letter_o);
        letter_p = (ImageButton) findViewById(R.id.letter_p);
        letter_q = (ImageButton) findViewById(R.id.letter_q);
        letter_r = (ImageButton) findViewById(R.id.letter_r);
        letter_s = (ImageButton) findViewById(R.id.letter_s);
        letter_t = (ImageButton) findViewById(R.id.letter_t);
        letter_u = (ImageButton) findViewById(R.id.letter_u);
        letter_v = (ImageButton) findViewById(R.id.letter_v);
        letter_w = (ImageButton) findViewById(R.id.letter_w);
        letter_x = (ImageButton) findViewById(R.id.letter_x);
        letter_y = (ImageButton) findViewById(R.id.letter_y);
        letter_z = (ImageButton) findViewById(R.id.letter_z);



        final MediaPlayer mpa = MediaPlayer.create(this, R.raw.letter_a);
        letter_a.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpa.start();
            }


    });

        final MediaPlayer mpb = MediaPlayer.create(this, R.raw.letter_b);
        letter_b.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpb.start();
            }


        });

        final MediaPlayer mpc = MediaPlayer.create(this, R.raw.letter_c);
        letter_c.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpc.start();
            }


        });

        final MediaPlayer mpd = MediaPlayer.create(this, R.raw.letter_d);
        letter_d.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpd.start();
            }


        });

        final MediaPlayer mpe = MediaPlayer.create(this, R.raw.letter_e);
        letter_e.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpe.start();
            }


        });

        final MediaPlayer mpf = MediaPlayer.create(this, R.raw.letter_f);
        letter_f.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpf.start();
            }


        });

        final MediaPlayer mpg = MediaPlayer.create(this, R.raw.letter_g);
        letter_g.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpg.start();
            }


        });

        final MediaPlayer mph = MediaPlayer.create(this, R.raw.letter_h);
        letter_h.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mph.start();
            }


        });

        final MediaPlayer mpi = MediaPlayer.create(this, R.raw.letter_i);
        letter_i.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpi.start();
            }


        });

        final MediaPlayer mpj = MediaPlayer.create(this, R.raw.letter_j);
        letter_j.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpj.start();
            }


        });

        final MediaPlayer mpk = MediaPlayer.create(this, R.raw.letter_k);
        letter_k.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpk.start();
            }


        });

        final MediaPlayer mpl = MediaPlayer.create(this, R.raw.letter_l);
        letter_l.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpl.start();
            }


        });

        final MediaPlayer mpm = MediaPlayer.create(this, R.raw.letter_m);
        letter_m.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpm.start();
            }


        });

        final MediaPlayer mpn = MediaPlayer.create(this, R.raw.letter_n);
        letter_n.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpn.start();
            }


        });

        final MediaPlayer mpo = MediaPlayer.create(this, R.raw.letter_o);
        letter_o.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpo.start();
            }


        });

        final MediaPlayer mpp = MediaPlayer.create(this, R.raw.letter_p);
        letter_p.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpp.start();
            }


        });

        final MediaPlayer mpq = MediaPlayer.create(this, R.raw.letter_q);
        letter_q.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpq.start();
            }


        });

        final MediaPlayer mpr = MediaPlayer.create(this, R.raw.letter_r);
        letter_r.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpr.start();
            }


        });

        final MediaPlayer mps = MediaPlayer.create(this, R.raw.letter_s);
        letter_s.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mps.start();
            }


        });

        final MediaPlayer mpt = MediaPlayer.create(this, R.raw.letter_t);
        letter_t.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpt.start();
            }


        });

        final MediaPlayer mpu = MediaPlayer.create(this, R.raw.letter_u);
        letter_u.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpu.start();
            }


        });

        final MediaPlayer mpv = MediaPlayer.create(this, R.raw.letter_v);
        letter_v.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpv.start();
            }


        });

        final MediaPlayer mpw = MediaPlayer.create(this, R.raw.letter_w);
        letter_w.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpw.start();
            }


        });

        final MediaPlayer mpx = MediaPlayer.create(this, R.raw.letter_x);
        letter_x.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpx.start();
            }


        });

        final MediaPlayer mpy = MediaPlayer.create(this, R.raw.letter_y);
        letter_y.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpy.start();
            }


        });

        final MediaPlayer mpz = MediaPlayer.create(this, R.raw.letter_z);
        letter_z.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                mpz.start();
            }


        });

        }
    }
















