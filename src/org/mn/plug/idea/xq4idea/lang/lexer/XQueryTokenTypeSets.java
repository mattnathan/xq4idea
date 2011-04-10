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
      KW_COPY_NAMESPACES, KW_INHERIT, KW_NO_INHERIT, KW_PRESERVE, KW_NO_PRESERVE,
      KW_CONSTRUCTION,
      KW_DEFAULT, KW_COLLATION,
      KW_ORDER, KW_EMPTY, KW_GREATEST, KW_LEAST,
      KW_FUNCTION, KW_ELEMENT,
      KW_MODULE,
      KW_IMPORT, KW_SCHEMA,
      KW_AT,
      KW_AS, KW_VOID, KW_EXTERNAL,
      KW_ITEM, KW_NODE, KW_TEXT, KW_COMMENT, KW_DOCUMENT_NODE, KW_ATTRIBUTE, KW_SCHEMA_ATTRIBUTE, KW_SCHEMA_ELEMENT,
      KW_PROCESSING_INSTRUCTION,
      KW_FOR, KW_LET, KW_IN, KW_WHERE, KW_RETURN, KW_STABLE, KW_ORDER, KW_BY, KW_ASCENDING, KW_DESCENDING,
      KW_IF, KW_THEN, KW_ELSE
  );
}
