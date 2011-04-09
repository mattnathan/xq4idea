package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;

/**
 * @author Matt Nathan
 */
public interface XQueryTokenTypes {
  // core types
  IElementType BAD_CHARACTER = TokenType.BAD_CHARACTER;
  IElementType BAD_WORD = TokenType.ERROR_ELEMENT;
  IElementType WHITE_SPACE = TokenType.WHITE_SPACE;

  // operators
  IElementType OP_SEPERATOR = new XQueryElementType(";");
  IElementType OP_COLON = new XQueryElementType(":");
  IElementType OP_VARSTART = new XQueryElementType("$");
  IElementType OP_EQUALS = new XQueryElementType("=");
  IElementType OP_COMMA = new XQueryElementType(",");
  IElementType OP_LBRACE = new XQueryElementType("(");
  IElementType OP_RBRACE = new XQueryElementType(")");
  IElementType OP_ASSIGN = new XQueryElementType(":=");
  IElementType OP_QUESTION = new XQueryElementType("?");
  IElementType OP_STAR = new XQueryElementType("*");
  IElementType OP_PLUS = new XQueryElementType("+");

  // names
  IElementType XQ_PREFIX_NAME = new XQueryElementType("XQ_PREFIX_NAME");
  IElementType XQ_LOCAL_NAME = new XQueryElementType("XQ_LOCAL_NAME");
  IElementType XQ_NCNAME = new XQueryElementType("XQ_NCNAME");

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
  IElementType XQ_INTEGER_LITERAL = new XQueryElementType("XQ_INTEGER_LITERAL");
  IElementType XQ_DOUBLE_LITERAL = new XQueryElementType("XQ_DOUBLE_LITERAL");
  IElementType XQ_DECIMAL_LITERAL = new XQueryElementType("XQ_DECIMAL_LITERAL");

  // keywords
  IElementType KW_XQUERY = new XQueryElementType("XQUERY");
  IElementType KW_VERSION = new XQueryElementType("VERSION");
  IElementType KW_ENCODING = new XQueryElementType("ENCODING");
  IElementType KW_DECLARE = new XQueryElementType("DECLARE");
  IElementType KW_OPTION = new XQueryElementType("OPTION");
  IElementType KW_VARIABLE = new XQueryElementType("VARIABLE");
  IElementType KW_ORDERING = new XQueryElementType("ORDERING");
  IElementType KW_ORDERED = new XQueryElementType("ORDERED");
  IElementType KW_UNORDERED = new XQueryElementType("UNORDERED");
  IElementType KW_BOUNDARY_SPACE = new XQueryElementType("BOUNDARY_SPACE");
  IElementType KW_PRESERVE = new XQueryElementType("PRESERVE");
  IElementType KW_NO_PRESERVE = new XQueryElementType("NO_PRESERVE");
  IElementType KW_STRIP = new XQueryElementType("STRIP");
  IElementType KW_NAMESPACE = new XQueryElementType("NAMESPACE");
  IElementType KW_BASE_URI = new XQueryElementType("BASE_URI");
  IElementType KW_COPY_NAMESPACES = new XQueryElementType("COPY_NAMESPACES");
  IElementType KW_INHERIT = new XQueryElementType("INHERIT");
  IElementType KW_NO_INHERIT = new XQueryElementType("NO_INHERIT");
  IElementType KW_CONSTRUCTION = new XQueryElementType("NO_INHERIT");
  IElementType KW_DEFAULT = new XQueryElementType("DEFAULT");
  IElementType KW_COLLATION = new XQueryElementType("COLLATION");
  IElementType KW_ORDER = new XQueryElementType("ORDER");
  IElementType KW_EMPTY = new XQueryElementType("EMPTY");
  IElementType KW_GREATEST = new XQueryElementType("GREATEST");
  IElementType KW_LEAST = new XQueryElementType("LEAST");
  IElementType KW_FUNCTION = new XQueryElementType("FUNCTION");
  IElementType KW_ELEMENT = new XQueryElementType("ELEMENT");
  IElementType KW_MODULE = new XQueryElementType("MODULE");
  IElementType KW_IMPORT = new XQueryElementType("IMPORT");
  IElementType KW_SCHEMA = new XQueryElementType("SCHEMA");
  IElementType KW_AT = new XQueryElementType("AT");
  IElementType KW_AS = new XQueryElementType("AS");
  IElementType KW_VOID = new XQueryElementType("VOID");
  IElementType KW_EXTERNAL = new XQueryElementType("EXTERNAL");
  IElementType KW_ITEM = new XQueryElementType("ITEM");
  IElementType KW_NODE = new XQueryElementType("NODE");
  IElementType KW_TEXT = new XQueryElementType("TEXT");
  IElementType KW_COMMENT = new XQueryElementType("COMMENT");
  IElementType KW_DOCUMENT_NODE = new XQueryElementType("COMMENT");
  IElementType KW_PROCESSING_INSTRUCTION = new XQueryElementType("COMMENT");
  IElementType KW_ATTRIBUTE = new XQueryElementType("COMMENT");
  IElementType KW_SCHEMA_ATTRIBUTE = new XQueryElementType("COMMENT");
  IElementType KW_SCHEMA_ELEMENT = new XQueryElementType("COMMENT");
}
