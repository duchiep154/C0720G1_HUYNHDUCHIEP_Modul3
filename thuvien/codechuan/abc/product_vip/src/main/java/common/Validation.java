package common;

public class Validation {
//    public static boolean regexID(String id) {
//        return !id.matches("^(LA-)(\\d{3})$");
//    }

    // Là số thực lớn hơn 0
//    public static boolean regexAreaAndPrice(String number) {
//        return !number.matches("\\d+([.]\\d+)?") || !(Double.parseDouble(number) >= 0);
//    }

//    public static boolean regexName(String name) {
//        return !name.matches("^[^a-zA-Z0-9]?$");
//    }
//    ^[\p{L}'][ \p{L}'-]*[\p{L}]$



    public static boolean regexPrice(String number) {
        return !number.matches("\\d+([.]\\d+)?") || !(Integer.parseInt(number) >= 0);
    }

    // Là số nguyên dương
    public static boolean regexPositiveIntegers(String number) {
        return !number.matches("\\d+") || Integer.parseInt(number) < 0;
    }
}
