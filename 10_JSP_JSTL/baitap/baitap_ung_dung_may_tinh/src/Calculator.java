public class Calculator {
    public static float calculate(float number_1, float number_2, String operator ){
        switch (operator){
            case "+":
                return number_1 + number_2;
            case "-":
                return number_1 - number_2;
            case "*":
                return number_1 * number_2;
            case "/":
                if(number_2 != 0)
                    return number_1 / number_2;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

}
