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

%%

<YYINITIAL> {
  // comments supported here
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
}

<EXPR_COMMENT> {
  ":)" { popState(); return XQ_COMMENT_END; }
  "(:" { pushState(); return XQ_COMMENT_START; }
  [^] { return XQ_COMMENT_CHAR; }
}

[^] { return BAD_CHARACTER; }
