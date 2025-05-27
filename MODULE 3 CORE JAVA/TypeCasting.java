public class TypeCastingExample {
    public static void main(String[] args) {
        double d = 9.78;
        int i = (int) d; // casting double to int

        int num = 10;
        double dNum = num; // casting int to double

        System.out.println("Double to int: " + i);
        System.out.println("Int to double: " + dNum);
    }
}
