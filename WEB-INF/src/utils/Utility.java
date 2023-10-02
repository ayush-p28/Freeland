package utils;

import java.io.*;
import java.net.URL;
import java.net.HttpURLConnection;

import javax.json.Json;
import javax.json.JsonReader;
import javax.json.JsonObject;

import java.util.Random;

public class Utility {
    public static String secretKey;
    public static Random random = new Random();

    public static boolean isHuman(String gResponse) {       
        String url = "https://www.google.com/recaptcha/api/siteverify"+"?secret="+secretKey+"&response="+gResponse;
        String method = "POST";
        
        InputStream is = Utility.sendRequest(url, method);        

        JsonReader reader = Json.createReader(is);
        JsonObject obj = reader.readObject();
        
        return  obj.getBoolean("success");
    }

    public static String generateOTP() {
        int val = 999999 - random.nextInt(900000);

        return Integer.toString(val);
    }


    public static InputStream sendRequest(String url, String method)  {        
        InputStream is = null;

        try {
            URL reqUrl = new URL(url);
            
            HttpURLConnection con = (HttpURLConnection)reqUrl.openConnection();
    
            con.setRequestMethod(method);
            con.setDoOutput(true);
    
            DataOutputStream os = new DataOutputStream(con.getOutputStream());
    
            os.flush();
            os.close();
    
            int respCode = con.getResponseCode();    
            
            if(respCode == HttpURLConnection.HTTP_OK) {
                is = con.getInputStream();
            } else {
                is = con.getErrorStream();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return is;
    }
}
