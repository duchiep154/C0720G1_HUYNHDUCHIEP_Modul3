package common;

public class Validation {
//    ^[(A-Z)||(0-9)]{3}-[(A-Z)||(0-9)]{2}-[(A-Z)||(0-9)]{2}$

    public static boolean regexID(String id) {
        return !id.matches("^([A-Z0-9]){3}(-([A-Z0-9]){2}){2}$");
    }


    public static boolean regexArea(String number) {
        return !number.matches("\\d+([.]\\d+)?") || !(Double.parseDouble(number) > 20);
    }

    public static boolean regexPrice(String number) {
        return !number.matches("\\d+([.]\\d+)?") || !(Double.parseDouble(number) > 1000000);
    }

    public static boolean regexPositiveIntegers(String number) {
        return !number.matches("\\d+") || Integer.parseInt(number) >= 16;
    }
}
