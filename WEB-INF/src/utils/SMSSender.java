package utils;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSSender {


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
