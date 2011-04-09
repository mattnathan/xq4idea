package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.tree.TokenSet;

/**
 * @author Matt Nathan
 */
public interface XQueryTokenTypeSets extends XQueryTokenTypes {
  TokenSet XQ_COMMENTS = TokenSet.create(XQ_COMMENT_START, XQ_COMMENT_CHAR, XQ_COMMENT_END);
  TokenSet COMMENTS = TokenSet.orSet(XQ_COMMENTS);
  TokenSet WHITESPACES = TokenSet.create(WHITE_SPACE);
  TokenSet STRING_LITERALS = TokenSet.create(XQ_STR);
}
