package com.amiko.ymd.hash;

import java.security.MessageDigest;

public class ShaPassword {
 
    public static String sha256(int a) {
 
        String base =  Integer.toString(a);;
 
        try{
 
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();
 
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
 
            //출력
            return hexString.toString();
 
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
 
    }
 
}