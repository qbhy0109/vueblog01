package com.markerhub.util;

import java.util.Random;

public class RandomName {
    public static String generateRandomName(int length, boolean onlyNum){
        String str = onlyNum?"0123456789":
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<length;i++){
            sb.append(str.charAt(random.nextInt(str.length())));
        }
        return sb.toString();
    }
}
