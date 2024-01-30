/**
 * Created by epollack@salesforce.com
 * 
 * A class with a set of static method defintions used for transforming 
 * plain text into Slack's version of markdown, mrkdwn.
 * 
 * Symbol Table:
 * Bold: *text*
 * Italics: _text_
 * Strike Through: ~text~
 * Code: `text`
 * Code Block: ```text```
 * Quote: >text
 * List: - text
 * Link: <url|alias> | <url>
 * User Mention: <@user>
 * Channel Mention: <#channel> 
 * Emoji: :text:
 * 
 * Reference: https://api.slack.com/reference/surfaces/formatting
 */

public class Md {
    public static String bold(String text) {
        return wrap(text, '*');
    }

    public static String italics(String text) {
        return wrap(text, '_');
    }

    public static String strikeThrough(String text) {
        return wrap(text, '~');
    }

    public static String code(String text) {
        return wrap(text, '`');
    }

    public static String codeBlock(String text) {
        return wrap(text, '```');
    }

    public static String emoji(String text) {
        return wrap(text, ':');
    }

    public static String quote(String text) {
        return prefix(text, '>');
    }

    public static String blockQuote(String text) {
        String[] blockQuoteItems = text.split('\n');

        List<String> result = new List<String>();
        for (String blockQuoteItem: blockQuoteItems) {
            result.add(quote(blockQuoteItem));
        }

        return String.join(result, '\n');
    }

    public static String listItem(String text) { 
        return prefix(text, '- ');
    }

    public static String listItems(String text) {
        String[] listItems = text.split('\n');

        List<String> result = new List<String>();
        for (String listItem : listItems) {
            result.add(listItem(listItem));
        }

        return String.join(result, '\n');
    }

    public static String link(String url, String alias) {
        return link(url + '|' + alias);
    }

    public static String link(String url) {
        return wrap(url, '<', '>');
    }

    // Special type of link
    public static String user(String id) {
        return link(prefix(id, '@'));
    }

    // Special type of link
    public static String channel(String id) {
        return link(prefix(id, '#'));
    }

    // Helper methods
    private static String prefix(String body, String symbol) {
        return symbol + body;
    }

    private static String wrap(String body, String symbol) {
        return symbol + body + symbol;
    }

    private static String wrap(String body, String openingSymbol, String closingSymbol) {
        return openingSymbol + body + closingSymbol;
    }
}