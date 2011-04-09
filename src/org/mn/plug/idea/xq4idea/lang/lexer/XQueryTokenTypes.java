package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;

/**
 * @author Matt Nathan
 */
public interface XQueryTokenTypes {
  // core types
  IElementType BAD_CHARACTER = TokenType.BAD_CHARACTER;
  IElementType WHITE_SPACE = TokenType.WHITE_SPACE;

  // operators
  IElementType OP_SEPERATOR = new XQueryElementType(";");

  // comments
  IElementType XQ_COMMENT_START = new XQueryElementType("(:");
  IElementType XQ_COMMENT_CHAR = new XQueryElementType("XQ_COMMENT_CHAR");
  IElementType XQ_COMMENT_END = new XQueryElementType(":)");

  // literals
  IElementType XQ_STR = new XQueryElementType("XQ_STR");
  IElementType XQ_STR_START = new XQueryElementType("XQ_STR_START");
  IElementType XQ_STR_CHAR = new XQueryElementType("XQ_STR_CHAR");
  IElementType XQ_STR_END = new XQueryElementType("XQ_STR_END");
  IElementType XQ_STR_ESCAPE_QUOTE = new XQueryElementType("\"\"");
  IElementType XQ_STR_ESCAPE_APOS = new XQueryElementType("''");

  // keywords
  IElementType KW_XQUERY = new XQueryElementType("XQUERY");
  IElementType KW_VERSION = new XQueryElementType("VERSION");
  IElementType KW_ENCODING = new XQueryElementType("ENCODING");
}
