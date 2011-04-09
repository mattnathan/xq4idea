package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.tree.TokenSet;

/**
 * @author Matt Nathan
 */
public interface XQueryTokenTypeSets extends XQueryTokenTypes {
  TokenSet XQ_COMMENTS = TokenSet.create(XQ_COMMENT_START, XQ_COMMENT_CHAR, XQ_COMMENT_END);
  TokenSet COMMENTS = TokenSet.orSet(XQ_COMMENTS);
  TokenSet WHITESPACES = TokenSet.create(WHITE_SPACE);
  TokenSet STRING_LITERALS = TokenSet.create(XQ_STR, XQ_STR_CHAR, XQ_STR_END, XQ_STR_END, XQ_STR_ESCAPE_APOS,
      XQ_STR_ESCAPE_QUOTE);

  TokenSet KEYWORDS = TokenSet.create(
      KW_XQUERY, KW_VERSION, KW_ENCODING
  );
}
