package common;

public class Validation {
    public static boolean regexIDCustomer(String id) {
        return (id.matches("^(KH-)\\d{4}$"));
    }

    public static boolean regexIDService(String id) {
        return (id.matches("^(DV-)\\d{4}$"));
    }

    public static boolean regexPhoneNumber(String phoneNumber) {
        return !phoneNumber.matches("^(090|091|\\(84\\)(\\+90|\\+91))(\\d{7})$");
    }

    public static boolean regexIDCard(String idCard) {
        return !idCard.matches("^(\\d{9})|(\\d{12})$");
    }

    public static boolean regexEmail(String email) {
        return !email.matches("^\\w{3,}@[a-z]{3,7}\\.[a-z]{2,3}$");
    }

    public static boolean regexPositiveIntegers(String number) {
        return !number.matches("\\d+") || Integer.parseInt(number) <= 0;
    }

    public static boolean regexPositiveNumbers(String number) {
        return !number.matches("\\d+([.]\\d+)?") || !(Float.parseFloat(number) > 0);
    }
}
