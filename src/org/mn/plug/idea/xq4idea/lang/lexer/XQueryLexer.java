package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

/**
 * Simple wrapper around the jflex generated lexer.
 *
 * @author Matt Nathan
 */
public class XQueryLexer extends FlexAdapter {
  public static void main(String[] args) {
    XQueryLexer lexer = new XQueryLexer();
    String content = "declare variable $s := '';";
    lexer.start(content);
    do {
      lexer.advance();
      System.out.println("lexer.getTokenText() = " + lexer.getTokenText());
    } while (lexer.getTokenEnd() < content.length());
  }

  public XQueryLexer() {
    super(new _XQueryLexer((Reader) null));
  }
}
