package utils;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSSender {
    public static final String ACCOUNT_SID = "ACa87919901aeb0ace17762db0603ed0e6";
    public static final String AUTH_TOKEN = "95f42dda050b64b67ed9842aed56ecd9";
    public static final String fromPhone = "+12137725106";

    public static void sendSMS(String toPhone, String msg) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("+91"+toPhone),
                new com.twilio.type.PhoneNumber(fromPhone),
                msg)
            .create();

        System.out.println(message.getSid());
    }
}
