package common;

public class Validation {

    public static boolean regexID(String id) {
        return !id.matches("^(SP-)(\\d{3})$");
    }

    public static boolean regexPositiveNumbers(String number) {
        return !number.matches("\\d+([.]\\d+)?") || !(Float.parseFloat(number) >= 0);
    }

    public static boolean regexPositiveIntegers(String number) {
        return !number.matches("\\d+") || Integer.parseInt(number) < 0;
    }
}
