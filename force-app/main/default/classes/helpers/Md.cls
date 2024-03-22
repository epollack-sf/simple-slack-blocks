/**
 * Created by epollack@salesforce.com
 * 
 * A helper class with a set of static method defintions used for transforming 
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
 * Group: <!subteam^id>
 * 
 * Reference: https://api.slack.com/reference/surfaces/formatting
 */

public class Md {
    // Prevents instance creation
    private Md() {}

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
        for (String blockQuoteItem : blockQuoteItems) {
            result.add(quote(blockQuoteItem));
        }

        return String.join(result, '\n');
    }

    public static String listItem(String text) { 
        // Notice space after -
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

    public static String user(String id) {
        // Special type of link
        return link(prefix(id, '@'));
    }

    public static String channel(String id) {
        // Special type of link
        return link(prefix(id, '#'));
    }

    public static String group(String id) {
        // Special type of link
        return link(prefix(id, '!subteam^'));
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