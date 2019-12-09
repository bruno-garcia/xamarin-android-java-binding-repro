package com.brunogarcia;

import android.util.*;

public class Sample {
    private static String TAG = "Sample";
    public static class Options {
        String getValue() { return "value"; }
    }
    public static void callDoSomething() {
        doSomething(o -> Log.d(TAG, o.getValue()));
    }
    public static void doSomething(ConfigureOptions callback) {
        Options o = new Options();
        callback.configure(o);
    }
    public interface ConfigureOptions {
        void configure(Options options);
    }
}