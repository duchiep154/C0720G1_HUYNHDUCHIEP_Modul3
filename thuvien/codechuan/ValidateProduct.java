package common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidateProduct {
    private static final String POSITIVE_INTEGER="^[\\d]+$";
    private static final String POSITIVE_NUMBER="^[\\d]+(\\.)?[\\d]*$";
    public static boolean checkPositiveInteger(String number){
        Pattern pattern= Pattern.compile(POSITIVE_INTEGER);
        Matcher matcher=pattern.matcher(number);
        return matcher.matches();
    }
    public static boolean checkPositiveNumber(String number){
        Pattern pattern= Pattern.compile(POSITIVE_NUMBER);
        Matcher matcher=pattern.matcher(number);
        return matcher.matches();
    }
}
