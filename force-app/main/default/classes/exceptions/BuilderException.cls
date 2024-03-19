/**
 * Created by epollack@salesforce.com
 * 
 * This exception is used to validate how the builder is called.
 * Thrown whenever a builder invokes a method too many times.
 * 
 * Is this name clear enough? Should it be more specific like TooManyTimesException?
 */

public class BuilderException extends Exception {}