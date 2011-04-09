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

  // comments
  IElementType XQ_COMMENT_START = new XQueryElementType("(:");
  IElementType XQ_COMMENT_CHAR = new XQueryElementType("XQ_COMMENT_CHAR");
  IElementType XQ_COMMENT_END = new XQueryElementType(":)");

  // literals
  IElementType XQ_STR = new XQueryElementType("XQ_STR");
}
