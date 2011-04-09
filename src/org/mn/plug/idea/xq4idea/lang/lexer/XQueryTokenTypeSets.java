package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.tree.TokenSet;

/**
 * @author Matt Nathan
 */
public interface XQueryTokenTypeSets extends XQueryTokenTypes {
  TokenSet XQ_COMMENTS = TokenSet.create(XQ_COMMENT_START, XQ_COMMENT_CHAR, XQ_COMMENT_END);
  TokenSet COMMENTS = TokenSet.orSet(XQ_COMMENTS);
  TokenSet WHITESPACES = TokenSet.create(WHITE_SPACE);
  TokenSet STRING_LITERALS = TokenSet.create(XQ_STR, XQ_STR_CHAR, XQ_STR_START, XQ_STR_END, XQ_STR_ESCAPE_APOS,
      XQ_STR_ESCAPE_QUOTE);
  TokenSet NUMBER_LITERALS = TokenSet.create(XQ_INTEGER_LITERAL, XQ_DECIMAL_LITERAL, XQ_DOUBLE_LITERAL);

  TokenSet KEYWORDS = TokenSet.create(
      KW_XQUERY, KW_VERSION, KW_ENCODING,
      KW_DECLARE, KW_OPTION, KW_VARIABLE,
      KW_ORDERING, KW_ORDERED, KW_UNORDERED,
      KW_BOUNDARY_SPACE, KW_PRESERVE, KW_STRIP,
      KW_NAMESPACE, KW_BASE_URI,
      KW_COPY_NAMESPACES, KW_INHERIT, KW_NO_INHERIT, KW_PRESERVE, KW_NO_PRESERVE
  );
}
