package com.example.demo_screens;

import androidx.annotation.NonNull;

import java.util.Timer;
import java.util.TimerTask;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    public static final String STREAM = "com.functionarylabs.eventchannelsample/stream";
    private static final String START_AGAIN_ = "com.functionarylabs/start";

    public static final String TAG = "Demo";
    int delay = 0;
    int period = 5000;
    Timer timer;
    int number = 0;
    EventChannel.EventSink channelevents;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

//Event Method intlization
        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), STREAM).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object args, EventChannel.EventSink events) {
                        Log.e(TAG, "On Listen Fired");
                            channelevents = events;
                            intlizeTimer();


                    }

                    @Override
                    public void onCancel(Object args) {
                        cancelTimer();

                    }
                }
        );
        //Method channel to again start the timer
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), START_AGAIN_).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method.equals("start_again")) {
                            updateNumber();
                            intlizeTimer();
                            result.success("Started Successfully");
                        } else {
                            result.error("1", "Platform Exception", "");
                        }
                    }
                }
        );
    }


    //Timer to execute after every 5 second
    void intlizeTimer() {
        Log.e(TAG, "Timer Fired");
        if ((timer == null)) {
            timer = new Timer();

        }
        timer.scheduleAtFixedRate(new TimerTask()
        {
            public void run() {
                Log.e(TAG, "Numbers Fired");
                MainActivity.this.runOnUiThread(
                        new Runnable() {
                            @Override
                            public void run() {
                                genrateNumbers(channelevents);
                            }
                        }
                );

            }
        }, delay, period);
    }


    //Cancelling the timer
    private void cancelTimer() {
        updateNumber();
        if ((timer != null)) {
            timer.cancel();
            timer = null;
        }
    }


    //Genrating number to update in flutter progressbar
    private void genrateNumbers(EventChannel.EventSink events) {
        Log.e(TAG, "Number Calculation");

        if (number <= 100) {
            number += 1;
            Log.e(TAG, "Number Value" + number);
            events.success(number);

        } else {

            cancelTimer();
        }


    }

    void updateNumber() {
        number =0;
    }


}
