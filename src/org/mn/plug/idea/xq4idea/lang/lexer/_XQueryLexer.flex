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

// strings
%s STR_START_QUOTE
%s STR_START_APOS
%s STR_CHAR
%s STR_END

%s _XQUERY
%s _XQUERY_VERSION
%s _XQUERY_VERSION_STR
%s _XQUERY_ENCODING
%s _XQUERY_ENCODING_STR

S = [ \n\r\t]

%%

<YYINITIAL> {
  "xquery" { yybegin(_XQUERY); return KW_XQUERY; }
}

// xquery version "" (encoding "")? ;
<_XQUERY> {
  "version" { yybegin(_XQUERY_VERSION); return KW_VERSION; }
}

<_XQUERY_VERSION> {
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
