package utils;

public class SMSTemplates {
    // public static String getSignupMobileVerificationMessage(String name, String otp) {
    //     String msg = "Hello "+name+" Your OTP for mobile verification is: "+otp;

    //     return msg;
    // }
    public static String getSignupMobileVerificationMessage(String otp) {
        String msg = "Hello User Your OTP for mobile verification is: "+otp;

        return msg;
    }
}
