package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

/**
 * Simple wrapper around the jflex generated lexer.
 *
 * @author Matt Nathan
 */
public class XQueryLexer extends FlexAdapter {
  public XQueryLexer() {
    super(new _XQueryLexer((Reader) null));
  }
}
