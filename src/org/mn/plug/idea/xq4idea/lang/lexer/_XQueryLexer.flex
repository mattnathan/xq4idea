package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

// this lexer follows the principles set out in http://www.w3.org/TR/xquery-xpath-parsing/
%%

%class _XQueryLexer
%extends AbstractLexer
%implements FlexLexer, XQueryTokenTypes
%unicode
%pack

%function advance
%type IElementType

%eof{
%eof}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////// User code //////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%{
%}

// these are top level states
%s EXPR_COMMENT
%s XQUERYVERSION
%s OPERATOR
%s OPTION

// strings
%s STR_START_QUOTE
%s STR_START_APOS
%s STR_CHAR
%s STR_END

// partial matches required for comment handling
%s _XQUERY
%s _XQUERY_VERSION_STR
%s _XQUERY_ENCODING
%s _XQUERY_ENCODING_STR
%s _DECLARE

// whitespace
S = [ \n\r\t]

Digits = [0-9]+
DecimalLiteral = ("." {Digits}) | ({Digits} "." [0-9]*)
DoubleLiteral = (("." {Digits}) | ({Digits} ("." [0-9]*)?)) [eE] [+-]? {Digits}
IntegerLiteral = {Digits}

%%

<YYINITIAL> {
  {IntegerLiteral} {yybegin(OPERATOR); return XQ_INTEGER_LITERAL; }
  {DoubleLiteral} {yybegin(OPERATOR); return XQ_DOUBLE_LITERAL; }
  {DecimalLiteral} {yybegin(OPERATOR); return XQ_DECIMAL_LITERAL; }

  "xquery" { yybegin(_XQUERY); return KW_XQUERY; }
  "declare" { yybegin(_DECLARE); return KW_DECLARE; }
}

// xquery version "" (encoding "")? ;
<_XQUERY> {
  "version" { yybegin(XQUERYVERSION); return KW_VERSION; }
}

<XQUERYVERSION> {
  "\"" {pushState(_XQUERY_VERSION_STR); yybegin(STR_START_QUOTE); return XQ_STR_START; }
  "'" {pushState(_XQUERY_VERSION_STR); yybegin(STR_START_APOS); return XQ_STR_START; }
}

<_XQUERY_VERSION_STR> {
  "encoding" {yybegin(_XQUERY_ENCODING); return KW_ENCODING; }
  ";" { yybegin(YYINITIAL); return OP_SEPERATOR; }
}

<_XQUERY_ENCODING> {
  "\"" {pushState(_XQUERY_ENCODING_STR); yybegin(STR_START_QUOTE); return XQ_STR_START; }
  "'" {pushState(_XQUERY_ENCODING_STR); yybegin(STR_START_APOS); return XQ_STR_START; }
}

<_XQUERY_ENCODING_STR> {
  ";" { yybegin(YYINITIAL); return OP_SEPERATOR; }
}

// OPERATOR
<OPERATOR> {
  [^] {yybegin(YYINITIAL); return WHITE_SPACE;}
}

// declare ...
<_DECLARE> {
  "option" {yybegin(OPTION);}
}

// options
<OPTION> {
  "test:QNAME" { yybegin(YYINITIAL); return WHITE_SPACE; }
}

// common formats

<EXPR_COMMENT> {
  ":)" { popState(); return XQ_COMMENT_END; }
  "(:" { pushState(); return XQ_COMMENT_START; }
  [^] { return XQ_COMMENT_CHAR; }
}

<STR_START_QUOTE> {
  "\"\"" { return XQ_STR_ESCAPE_QUOTE; }
  "\"" { popState(); return XQ_STR_END; }
  [^] { return XQ_STR_CHAR; }
}
<STR_START_APOS> {
  "''" { return XQ_STR_ESCAPE_APOS; }
  "'" { popState(); return XQ_STR_END; }
  [^] { return XQ_STR_CHAR; }
}



"(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
{S} { return WHITE_SPACE; }
[^] { return BAD_CHARACTER; }
