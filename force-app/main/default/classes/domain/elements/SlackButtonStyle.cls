/**
 * Created by epollack@salesforce.com
 * 
 * Enum for representing Button Element Style options. Use of enum reduces
 * risk of improperly entered style string.
 * 
 * Question: Better suited as a static enum inside of the SlackButton class?
 *  - right now, too beefy
 *  - possibly not as beefy after validation rules are set up
 */

public enum SlackButtonStyle { PRIMARY, DANGER }