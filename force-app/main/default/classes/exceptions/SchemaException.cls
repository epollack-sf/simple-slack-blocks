/**
 * Created by epollack@salesforce.com
 * 
 * This exception is used when validating a builder's product. 
 * Thrown whenever a block is built in a way that violates Slack's 
 * expected request structure. 
 * 
 * Examples include:
 * - Attaching more than 10 fields to a section block
 * - Adding text more than 3000 characters
 */

public class SchemaException extends Exception {}