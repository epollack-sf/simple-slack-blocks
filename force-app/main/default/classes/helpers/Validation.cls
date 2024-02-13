/**
 * Created by epollack@salesforce.com
 * 
 * A helper class with a set of static method definitions for common
 * validation tasks, such as checking if a reference is null, 
 * if an integer less than N, etc.
 */

public class Validation {
    // Prevents instance creation
    private Validation() {}

    public static void isNull(Object o, Exception e) {
        if (o != null) {
            throw e;
        }
    }

    public static void isNotNull(Object o, Exception e) {
        if (o == null) {
            throw e;
        }
    }

    public static void isGreaterThan(Integer i, Integer min, Exception e) {
        // Should not have to check if i is null
        
        if ((i ?? 0) < min) {
            throw e;
        }
    }

    public static void isLessThan(Integer i, Integer max, Exception e) {
        // Should not have to check if i is null, sign this static class isn't the best solution for reducing duplicate code from builders
        // Goal --> should work regardless of what's passed in

        if ((i ?? 0) > max) {
            throw e;
        }
    }

    public static void equals(Object o, Object expected, Exception e) {
        if (!o.equals(expected)) {
            throw e;
        }
    }

    // Not a great implementation --> should not couple expected value with static method.
    //  Client also shouldn't need to create 2 lists of predicates and expected values to test

    // What about a ValidationRule class that has an actual and expected value
    public static void areNotNull(List<Object> os, Exception e) {
        for (Object o : os) {
            isNotNull(o, e);
        }
    }
}