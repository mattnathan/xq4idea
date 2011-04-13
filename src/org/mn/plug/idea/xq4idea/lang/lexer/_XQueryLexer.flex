package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

// this lexer follows the principles set out in http://www.w3.org/TR/xquery-xpath-parsing/
@SuppressWarnings({"UnusedDeclaration", "UnusedAssignment", "FieldCanBeLocal", "AccessStaticViaInstance", "JavaDoc", "ConstantConditions"})
/**
 * Generated lexer
 */
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
  int initialState() {
    return YYINITIAL;
  }
%}

// these are top level states
%x EXPR_COMMENT
%x XML_COMMENT
%s DECLAREORDERING
%s NAMESPACEDECL

// strings
%x STR_START_QUOTE
%x STR_START_APOS
%x _STR_COMMON_CONTENT
%x _XML_STR_START_QUOTE
%x _XML_STR_START_APOS

// partial matches required for comment handling
%s _XQUERY
%s _XQUERY_VERSION

%s _MODULE

%s _DECLARE
%s _DECLARE_COPYNS
%s _DECLARE_COPYNS_
%s _DECLARE_COPYNS__
%s _DECLARE_DEFAULT
%s _DECLARE_DEFAULT_ORDER
%s _DECLARE_DEFAULT_ORDER_EMPTY
%s _DECLARE_DEFAULT_NAMESPACE
%s _DECLARE_VARIABLE

%s _IMPORT
%s _IMPORT_SCHEMA
%s _IMPORT_SCHEMA_DEFAULT
%s _IMPORT_SCHEMA_DEFAULT_ELEMENT
%s _IMPORT_MODULE

%s _PRESERVE_OR_STRIP
%s _URILITERAL
%s _STRINGLITERAL

%s _NAMESPACEDECL_

%s _ATLIST
%s _ATLIST_

%s _PARAM
%s _AS
%s _ITEM_TYPE
%x _ITEM_TYPE_OCC
%s _ITEM_TYPE_DN
%s _ITEM_TYPE_PI
%s _ITEM_TYPE_ATTR
%s _ITEM_TYPE_SATTR
%s _ITEM_TYPE_AorE
%s _ITEM_TYPE_AorE_
%s _ITEM_TYPE_AorE__
%s _ITEM_TYPE_SELEM

// Expression states
%x _EXPR_SINGLE
%s _EXPR_LIST
%s _EXPR_LIST_IN_CURLY
%s _OPT_EXPR_LIST_IN_BRACE
%s _EXPR_LIST_OR_RBRACE
%s _OPT_EXPR_LIST_IN_CURLY
%s _EXPR_LIST_OR_RCURLY
%s _EL_IN_CURLY_OR_QNAME
%s _EL_IN_CURLY_OR_NCNAME

// If expression
%s _IF_EXPR
%s _IF_EXPR_
%s _IF_EXPR__
%s _IF_EXPR_THEN
%s _IF_EXPR_ELSE

// Quantified Expression
%s _QUANT_EXPR
%s _QUANT_EXPR_LIST
%s _QUANT_EXPR_IN
%s _QUANT_EXPR_SATISFIES

// TypeSwitch expression
%s _TYPESWITCH_EXPR
%s _TYPESWITCH_EXPR_
%s _TYPESWITCH_EXPR__
%s _TYPESWITCH_EXPR_DEFAULT_
%s _TYPESWITCH_EXPR_CASE
%s _TYPESWITCH_EXPR_CASE2
%s _TYPESWITCH_EXPR_CASE_
%s _TYPESWITCH_EXPR_CASE_AS
%s _TYPESWITCH_EXPR_RETURN

// other expressions
%s _VALUE_EXPR
%s _VALIDATE_EXPR_X
%s _VALIDATE_EXPR_
%s _VALIDATE_EXPR__
%s _FILTER_EXPR
%s _STEP_EXPR

%x _UNARY_EXPR
%x _CAST_AS_EXPR
%x _CASTABLE_AS_EXPR
%x _TREAT_AS_EXPR
%x _INSTANCEOF_EXPR
%x _COMPARE_EXPR
%x _COMPARE_EXPR_
%x _RANGE_EXPR
%x _RANGE_EXPR_
%x _ADD_EXPR
%x _ADD_EXPR_
%x _MULT_EXPR
%x _MULT_EXPR_
%x _UNION_EXPR
%x _UNION_EXPR_
%x _INTERSECT_EXCEPT_EXPR
%x _INTERSECT_EXCEPT_EXPR_

%s _NODE_TEST

%s _PREDICATE_LIST

// FLWOR states
// allows for or let repeating, as soon as return, where or order are seen we transition to body
%s _FLWOR_HEAD
%s _FLWOR_BODY1
%s _FLWOR_BODY2
%s _FLWOR_BODY3

%s _FOR_CLAUSE
%s _FOR_CLAUSE_VAR_POS
%s _FOR_CLAUSE_VAR_POS_
%s _FOR_CLAUSE_VAR_IN

%s _LET_CLAUSE
%s _LET_CLAUSE_
%s _LET_CLAUSE_VAR

%s _WHERE_CLAUSE

%s _ORDER_CLAUSE
%s _ORDER_CLAUSE_BY
%s _ORDER_CLAUSE_LIST
%s _ORDER_CLAUSE_MODIFIER
%s _ORDER_CLAUSE_MODIFIER_EMPTY
%s _ORDER_CLAUSE_MODIFIER_EMPTY_
%s _ORDER_CLAUSE_MODIFIER_COLLATION

// xml states
%x _XML_PI_NAME
%x _XML_PI_CONTENT
%x _XML_PI_END
%x _XML_ATTRLIST_START
%x _XML_ATTR_NAME
%x _XML_ATTR_VALUE
%x _XML_STR_COMMON_CONTENT
%x _XML_ELEMENT_CONTENT
%x _XML_TAG_NAME
%x _XML_END_TAG
%x _XML_CLOSE_TAG
%x _XML_CDATA_CONTENT
%x _XML_CDATA_END

%s _EMPTY_BRACES
%s _EMPTY_BRACES_
%s _OPEN_BRACE
%s _CLOSE_BRACE
%s _OPEN_CURLY
%s _CLOSE_CURLY
%s _OPEN_SQUARE
%s _CLOSE_SQUARE
%x _CLOSE_TAG
%s _PRAGMA
%x _PRAGMA_
%x _PRAGMA_CONTENT

%x _OPT_QUESTION
%s _SEP
%s _VARNAME
%s _STAR
%s _COLON
%s _COLONCOLON
%x _EQUALS
%s _KW_AS
%s _KW_OF

%s _NCNAME
%s _QNAME
%x _STRICT_QNAME
%x _QNAME_
%x _QNAME_LOCAL
%s _WILDCARD_QNAME
%x _WILDCARD_QNAME_
%x _WILDCARD_QNAME_LOCAL

// whitespace
S = [\x20\x09\x0D\x0A]+
NS = [^\x20\x09\x0D\x0A]+
_NS = [^\x20\x09\x0D\x0A]

Digits = [0-9]+
DecimalLiteral = ("." {Digits}) | ({Digits} "." [0-9]*)
DoubleLiteral = (("." {Digits}) | ({Digits} ("." [0-9]*)?)) [eE] [+-]? {Digits}
IntegerLiteral = {Digits}

// words

Char = [\x09\x0A\x0D\x20-\uD7FF\uE000-\uFFFD]
CharRef = ("&#"[0-9]+";") | ("&#x"[0-9a-fA-F]+";")
PredefinedEntityRef = "&"("lt"|"gt"|"amp"|"quot"|"apos")";"

// Character classes (XML 1.0)

Letter = ({BaseChar} | {Ideographic})
BaseChar = [\u0041-\u005A\u0061-\u007A\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u00FF\u0100-\u0131\u0134-\u013E\u0141-\u0148\u014A-\u017E\u0180-\u01C3\u01CD-\u01F0\u01F4-\u01F5\u01FA-\u0217\u0250-\u02A8\u02BB-\u02C1\u0386\u0388-\u038A\u038C\u038E-\u03A1\u03A3-\u03CE\u03D0-\u03D6\u03DA\u03DC\u03DE\u03E0\u03E2-\u03F3\u0401-\u040C\u040E-\u044F\u0451-\u045C\u045E-\u0481\u0490-\u04C4\u04C7-\u04C8\u04CB-\u04CC\u04D0-\u04EB\u04EE-\u04F5\u04F8-\u04F9\u0531-\u0556\u0559\u0561-\u0586\u05D0-\u05EA\u05F0-\u05F2\u0621-\u063A\u0641-\u064A\u0671-\u06B7\u06BA-\u06BE\u06C0-\u06CE\u06D0-\u06D3\u06D5\u06E5-\u06E6\u0905-\u0939\u093D\u0958-\u0961\u0985-\u098C\u098F-\u0990\u0993-\u09A8\u09AA-\u09B0\u09B2\u09B6-\u09B9\u09DC-\u09DD\u09DF-\u09E1\u09F0-\u09F1\u0A05-\u0A0A\u0A0F-\u0A10\u0A13-\u0A28\u0A2A-\u0A30\u0A32-\u0A33\u0A35-\u0A36\u0A38-\u0A39\u0A59-\u0A5C\u0A5E\u0A72-\u0A74\u0A85-\u0A8B\u0A8D\u0A8F-\u0A91\u0A93-\u0AA8\u0AAA-\u0AB0\u0AB2-\u0AB3\u0AB5-\u0AB9\u0ABD\u0AE0\u0B05-\u0B0C\u0B0F-\u0B10\u0B13-\u0B28\u0B2A-\u0B30\u0B32-\u0B33\u0B36-\u0B39\u0B3D\u0B5C-\u0B5D\u0B5F-\u0B61\u0B85-\u0B8A\u0B8E-\u0B90\u0B92-\u0B95\u0B99-\u0B9A\u0B9C\u0B9E-\u0B9F\u0BA3-\u0BA4\u0BA8-\u0BAA\u0BAE-\u0BB5\u0BB7-\u0BB9\u0C05-\u0C0C\u0C0E-\u0C10\u0C12-\u0C28\u0C2A-\u0C33\u0C35-\u0C39\u0C60-\u0C61\u0C85-\u0C8C\u0C8E-\u0C90\u0C92-\u0CA8\u0CAA-\u0CB3\u0CB5-\u0CB9\u0CDE\u0CE0-\u0CE1\u0D05-\u0D0C\u0D0E-\u0D10\u0D12-\u0D28\u0D2A-\u0D39\u0D60-\u0D61\u0E01-\u0E2E\u0E30\u0E32-\u0E33\u0E40-\u0E45\u0E81-\u0E82\u0E84\u0E87-\u0E88\u0E8A\u0E8D\u0E94-\u0E97\u0E99-\u0E9F\u0EA1-\u0EA3\u0EA5\u0EA7\u0EAA-\u0EAB\u0EAD-\u0EAE\u0EB0\u0EB2-\u0EB3\u0EBD\u0EC0-\u0EC4\u0F40-\u0F47\u0F49-\u0F69\u10A0-\u10C5\u10D0-\u10F6\u1100\u1102-\u1103\u1105-\u1107\u1109\u110B-\u110C\u110E-\u1112\u113C\u113E\u1140\u114C\u114E\u1150\u1154-\u1155\u1159\u115F-\u1161\u1163\u1165\u1167\u1169\u116D-\u116E\u1172-\u1173\u1175\u119E\u11A8\u11AB\u11AE-\u11AF\u11B7-\u11B8\u11BA\u11BC-\u11C2\u11EB\u11F0\u11F9\u1E00-\u1E9B\u1EA0-\u1EF9\u1F00-\u1F15\u1F18-\u1F1D\u1F20-\u1F45\u1F48-\u1F4D\u1F50-\u1F57\u1F59\u1F5B\u1F5D\u1F5F-\u1F7D\u1F80-\u1FB4\u1FB6-\u1FBC\u1FBE\u1FC2-\u1FC4\u1FC6-\u1FCC\u1FD0-\u1FD3\u1FD6-\u1FDB\u1FE0-\u1FEC\u1FF2-\u1FF4\u1FF6-\u1FFC\u2126\u212A-\u212B\u212E\u2180-\u2182\u3041-\u3094\u30A1-\u30FA\u3105-\u312C\uAC00-\uD7A3]
Ideographic = [\u4E00-\u9FA5\u3007\u3021-\u3029]
CombiningChar = [\u0300-\u0345\u0360-\u0361\u0483-\u0486\u0591-\u05A1\u05A3-\u05B9\u05BB-\u05BD\u05BF\u05C1-\u05C2\u05C4\u064B-\u0652\u0670\u06D6-\u06DC\u06DD-\u06DF\u06E0-\u06E4\u06E7-\u06E8\u06EA-\u06ED\u0901-\u0903\u093C\u093E-\u094C\u094D\u0951-\u0954\u0962-\u0963\u0981-\u0983\u09BC\u09BE\u09BF\u09C0-\u09C4\u09C7-\u09C8\u09CB-\u09CD\u09D7\u09E2-\u09E3\u0A02\u0A3C\u0A3E\u0A3F\u0A40-\u0A42\u0A47-\u0A48\u0A4B-\u0A4D\u0A70-\u0A71\u0A81-\u0A83\u0ABC\u0ABE-\u0AC5\u0AC7-\u0AC9\u0ACB-\u0ACD\u0B01-\u0B03\u0B3C\u0B3E-\u0B43\u0B47-\u0B48\u0B4B-\u0B4D\u0B56-\u0B57\u0B82-\u0B83\u0BBE-\u0BC2\u0BC6-\u0BC8\u0BCA-\u0BCD\u0BD7\u0C01-\u0C03\u0C3E-\u0C44\u0C46-\u0C48\u0C4A-\u0C4D\u0C55-\u0C56\u0C82-\u0C83\u0CBE-\u0CC4\u0CC6-\u0CC8\u0CCA-\u0CCD\u0CD5-\u0CD6\u0D02-\u0D03\u0D3E-\u0D43\u0D46-\u0D48\u0D4A-\u0D4D\u0D57\u0E31\u0E34-\u0E3A\u0E47-\u0E4E\u0EB1\u0EB4-\u0EB9\u0EBB-\u0EBC\u0EC8-\u0ECD\u0F18-\u0F19\u0F35\u0F37\u0F39\u0F3E\u0F3F\u0F71-\u0F84\u0F86-\u0F8B\u0F90-\u0F95\u0F97\u0F99-\u0FAD\u0FB1-\u0FB7\u0FB9\u20D0-\u20DC\u20E1\u302A-\u302F\u3099\u309A]
Digit =  [\u0030-\u0039\u0660-\u0669\u06F0-\u06F9\u0966-\u096F\u09E6-\u09EF\u0A66-\u0A6F\u0AE6-\u0AEF\u0B66-\u0B6F\u0BE7-\u0BEF\u0C66-\u0C6F\u0CE6-\u0CEF\u0D66-\u0D6F\u0E50-\u0E59\u0ED0-\u0ED9\u0F20-\u0F29]
Extender = [\u00B7\u02D0\u02D1\u0387\u0640\u0E46\u0EC6\u3005\u3031-\u3035\u309D-\u309E\u30FC-\u30FE]

// Character and Entity references

CharRef = (&#[0-9]+;|&#x[0-9a-fA-F]+;)

// Names and tokens

NameChar = ({Letter} | {Digit} | "." | "-" | "_" | ":" | {CombiningChar} | {Extender})
Name = ({Letter} | "_" | ":" ) ({NameChar})*
XmlDigit = [0-9]
XmlLetter = [:letter:]
XmlName = ({XmlLetter}|"_")({XmlLetter}|{XmlDigit}|"_"|"."|"-")*(":"({XmlLetter}|"_")?({XmlLetter}|{XmlDigit}|"_"|"."|"-")*)?

// Namespaces

QName = {PrefixedName} | {UnprefixedName}
WildcardQName = ({QName}) | ("*:"{LocalPart}) | ({Prefix}":*")
PrefixedName = {Prefix}":"{LocalPart}
UnprefixedName = {LocalPart}
Prefix = {NCName}
LocalPart = {NCName}
NCName = {SimpleName}  //  - ({Char}*":"{Char}*)

SimpleNameChar = ({Letter} | {Digit} | "." | "-" | "_" | {CombiningChar} | {Extender})
SimpleName = ({Letter} | "_" ) ({SimpleNameChar})*

%%

<YYINITIAL> {
  {S} { return WHITE_SPACE; }
  "xquery" { yybegin(_XQUERY); return KW_XQUERY; }
  "declare" { yybegin(_DECLARE); return KW_DECLARE; }
  "module" { yybegin(_MODULE); return KW_MODULE; }
  "import" {yybegin(_IMPORT); return KW_IMPORT; }
  [^] {yypushback(yylength()); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); }
}

// xquery version "" (encoding "")? ;
<_XQUERY> {
  "version" { pushState(_XQUERY_VERSION); yybegin(_STRINGLITERAL); return KW_VERSION; }
}

<_XQUERY_VERSION> {
  "encoding" {pushState(_SEP); yybegin(_STRINGLITERAL); return KW_ENCODING; }
  ";" { yybegin(YYINITIAL); return OP_SEPERATOR; }
}

// module namespace ...
<_MODULE> {
  "namespace" {pushState(_SEP); yybegin(NAMESPACEDECL); return KW_MODULE; }
}

// declare ...
<_DECLARE> {
  "option" {pushState(_SEP); pushState(_STRINGLITERAL); yybegin(_QNAME); return KW_OPTION;}
  "ordering" {yybegin(DECLAREORDERING); return KW_ORDERING; }
  "boundary-space" {yybegin(_PRESERVE_OR_STRIP); return KW_BOUNDARY_SPACE; }
  "namespace" {pushState(_SEP); yybegin(NAMESPACEDECL); return KW_NAMESPACE; }
  "base-uri" {pushState(_SEP); yybegin(_URILITERAL); return KW_BASE_URI; }
  "copy-namespaces" {yybegin(_DECLARE_COPYNS); return KW_COPY_NAMESPACES; }
  "construction" {yybegin(_PRESERVE_OR_STRIP); return KW_CONSTRUCTION; }
  "default" {yybegin(_DECLARE_DEFAULT); return KW_DEFAULT; }
  "variable" {pushState(_SEP); pushState(_DECLARE_VARIABLE); yybegin(_PARAM); return KW_VARIABLE; }
}

<_SEP> {
  ";" {yybegin(YYINITIAL); return OP_SEPERATOR; }
}

// DECLARE DEFAULT ...
<_DECLARE_DEFAULT> {
  "collation" {pushState(_SEP); yybegin(_URILITERAL); return KW_COLLATION; }
  "order" {yybegin(_DECLARE_DEFAULT_ORDER); return KW_ORDER; }
  "function" {yybegin(_DECLARE_DEFAULT_NAMESPACE); return KW_FUNCTION; }
  "element" {yybegin(_DECLARE_DEFAULT_NAMESPACE); return KW_ELEMENT; }
}

// declare default empty (greatest | least)
<_DECLARE_DEFAULT_ORDER> {
  "empty" {yybegin(_DECLARE_DEFAULT_ORDER_EMPTY); return KW_EMPTY; }
}
<_DECLARE_DEFAULT_ORDER_EMPTY> {
  "greatest" {yybegin(_SEP); return KW_GREATEST;}
  "least" {yybegin(_SEP); return KW_LEAST;}
}

// declare default (function | element) namespace ""
<_DECLARE_DEFAULT_NAMESPACE> {
  "namespace" {pushState(_SEP); yybegin(_URILITERAL); return KW_NAMESPACE; }
}

// ORDERING
<DECLAREORDERING> {
  "ordered" {yybegin(_SEP); return KW_ORDERED; }
  "unordered" {yybegin(_SEP); return KW_UNORDERED; }
}

// NAMESPACEDECL
<NAMESPACEDECL> {
  {NCName} {yybegin(_NAMESPACEDECL_); return XQ_LOCAL_NAME; }
}
<_NAMESPACEDECL_> {
  "=" {yybegin(_URILITERAL); return OP_EQUALS; }
}

// _DECLARE_COPYNS
<_DECLARE_COPYNS> {
  "preserve" {yybegin(_DECLARE_COPYNS_); return KW_PRESERVE; }
  "no-preserve" {yybegin(_DECLARE_COPYNS_); return KW_NO_PRESERVE;}
}
<_DECLARE_COPYNS_> {
  "," {yybegin(_DECLARE_COPYNS__); return OP_COMMA;}
}
<_DECLARE_COPYNS__> {
  "inherit" {yybegin(_SEP); return KW_INHERIT; }
  "no-inherit" {yybegin(_SEP); return KW_NO_INHERIT; }
}

// declare variable...
<_DECLARE_VARIABLE> {
  ":=" { yybegin(_EXPR_SINGLE); return OP_ASSIGN;}
  "external" {popState(); return KW_EXTERNAL;}
}

// import ...
<_IMPORT> {
  "schema" {yybegin(_IMPORT_SCHEMA); return KW_SCHEMA; }
  "module" {yybegin(_IMPORT_MODULE); return KW_MODULE; }
}
// import schema (namespace =) | (default element namespace) "" (at "" (, "")*)?
<_IMPORT_SCHEMA> {
  "namespace" { pushState(_SEP); pushState(_ATLIST); yybegin(NAMESPACEDECL); return KW_NAMESPACE; }
  "default" { yybegin(_IMPORT_SCHEMA_DEFAULT); return KW_DEFAULT; }
}
<_IMPORT_SCHEMA_DEFAULT> {
  "element" { yybegin(_IMPORT_SCHEMA_DEFAULT_ELEMENT); return KW_ELEMENT; }
}
<_IMPORT_SCHEMA_DEFAULT_ELEMENT> {
  "namespace" {pushState(_SEP); pushState(_ATLIST); yybegin(_URILITERAL); return KW_NAMESPACE; }
}
<_IMPORT_MODULE> {
  "namespace" { pushState(_SEP); pushState(_ATLIST); yybegin(NAMESPACEDECL); return KW_NAMESPACE; }
}


// variable declaration part
// "$" VarName TypeDeclaration?
//
<_PARAM> {
  "$" {yypushback(1); pushState(_AS); yybegin(_VARNAME);}
}
<_AS> {
  "as" {yybegin(_ITEM_TYPE); return KW_AS; }
  {NS} {yypushback(yylength()); popState();}
}
<_ITEM_TYPE> {
  "void" {yybegin(_EMPTY_BRACES); return KW_VOID;}
  "item" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_ITEM;}
  "node" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_NODE;}
  "text" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_TEXT;}
  "comment" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_COMMENT;}
  "document-node" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_DN); yybegin(_OPEN_BRACE); return KW_DOCUMENT_NODE;}
  "processing-instruction" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_PI); yybegin(_OPEN_BRACE); return KW_PROCESSING_INSTRUCTION;}
  "attribute" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_AorE); yybegin(_OPEN_BRACE); return KW_ATTRIBUTE;}
  "schema-attribute" {pushState(_ITEM_TYPE_OCC); pushState(_CLOSE_BRACE); pushState(_QNAME); yybegin(_OPEN_BRACE);  return KW_SCHEMA_ATTRIBUTE;}
  "element" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_AorE); yybegin(_OPEN_BRACE); return KW_ELEMENT;}
  "schema-element" {pushState(_ITEM_TYPE_OCC); pushState(_CLOSE_BRACE); pushState(_QNAME); yybegin(_OPEN_BRACE); return KW_SCHEMA_ELEMENT;}
  {QName} {yypushback(yylength()); pushState(_ITEM_TYPE_OCC); yybegin(_QNAME);}
}
<_ITEM_TYPE_OCC> {
  "?" {popState(); return OP_QUESTION;}
  "*" {popState(); return OP_STAR;}
  "+" {popState(); return OP_PLUS;}
  [^\?\*\+] {popState(); yypushback(1);}
}
// as processing-instruction( NCName | "")
<_ITEM_TYPE_PI> {
  "\""|"'" { pushState(_CLOSE_BRACE); yypushback(1); yybegin(_STRINGLITERAL); }
  {NCName} { pushState(_CLOSE_BRACE); yypushback(yylength()); yybegin(_NCNAME); }
  ")" {yypushback(1); yybegin(_CLOSE_BRACE); }
}
// as element( (QName|* (, QName "?"? )? )? )? )
<_ITEM_TYPE_AorE> {
  "*" {yybegin(_ITEM_TYPE_AorE_); return OP_STAR; }
  {QName} {yypushback(yylength()); pushState(_ITEM_TYPE_AorE_); yybegin(_QNAME); }
  ")" {yypushback(1); yybegin(_CLOSE_BRACE); }
}
<_ITEM_TYPE_AorE_> {
  "," {pushState(_ITEM_TYPE_AorE__); yybegin(_QNAME); return OP_COMMA;}
  ")" {yypushback(1); yybegin(_CLOSE_BRACE); }
}
<_ITEM_TYPE_AorE__> {
  ")" {yypushback(1); yybegin(_CLOSE_BRACE); }
  "?" {yybegin(_CLOSE_BRACE); return OP_QUESTION; }
}
// as document-node( (ElementTest | ElementSchemaTest)? )
<_ITEM_TYPE_DN> {
  "element" {pushState(_CLOSE_BRACE); pushState(_ITEM_TYPE_AorE); yybegin(_OPEN_BRACE); return KW_ELEMENT;}
  "schema-element" {pushState(_CLOSE_BRACE); pushState(_CLOSE_BRACE); pushState(_QNAME); yybegin(_OPEN_BRACE); return KW_SCHEMA_ELEMENT;}
  ")" {yypushback(1); yybegin(_CLOSE_BRACE); }
}

// Expr := ExprSingle ( "," ExprSingle )?
// ExprSingle
<_EXPR_SINGLE> {
  "for" {pushState(_FLWOR_HEAD); yypushback(yylength()); yybegin(_FOR_CLAUSE); }
  "let" {pushState(_FLWOR_HEAD); yypushback(yylength()); yybegin(_LET_CLAUSE); }
  "if" {yypushback(yylength()); yybegin(_IF_EXPR); }
  "some" {yypushback(yylength()); yybegin(_QUANT_EXPR); }
  "every" {yypushback(yylength()); yybegin(_QUANT_EXPR); }
  "typeswitch" {yypushback(yylength()); yybegin(_TYPESWITCH_EXPR); }

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] {yypushback(yylength()); yybegin(_COMPARE_EXPR); }
}
<_EXPR_LIST> {
  "," {pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_COMMA; }
  {_NS} {yypushback(1); popState(); }
}

// IfExpr := <"if" "("> Expr ")" "then" ExprSingle "else" ExprSingle
<_IF_EXPR> {
  "if" {yybegin(_IF_EXPR_); return KW_IF;}
}
<_IF_EXPR_> {
  "(" {pushState(_IF_EXPR__); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_LBRACE; }
}
<_IF_EXPR__> {
  ")" {yybegin(_IF_EXPR_THEN); return OP_RBRACE;}
}
<_IF_EXPR_THEN> {
  "then" {pushState(_IF_EXPR_ELSE); yybegin(_EXPR_SINGLE); return KW_THEN; }
}
<_IF_EXPR_ELSE> {
  "else" {yybegin(_EXPR_SINGLE); return KW_ELSE; }
}

// QuantifiedExpr := (<"some" "$"> | <"every" "$">) VarName TypeDeclaration? "in" ExprSingle
//                    ("," "$" VarName TypeDeclaration? "in" ExprSingle)* "satisfies" ExprSingle
<_QUANT_EXPR> {
  "some" {pushState(_QUANT_EXPR_IN); yybegin(_PARAM); return KW_SOME;}
  "every" {pushState(_QUANT_EXPR_IN); yybegin(_PARAM); return KW_EVERY;}
}
<_QUANT_EXPR_LIST> {
  "," {pushState(_QUANT_EXPR_LIST); pushState(_QUANT_EXPR_IN); yybegin(_PARAM); return OP_COMMA; }
  {_NS} {yypushback(1); popState(); }
}
<_QUANT_EXPR_IN> {
  "in" {pushState(_QUANT_EXPR_SATISFIES); yybegin(_EXPR_SINGLE); return KW_IN;}
}
<_QUANT_EXPR_SATISFIES> {
  "satisfies" {yybegin(_EXPR_SINGLE); return KW_SATISFIES; }
}

// Typeswitch expressions
<_TYPESWITCH_EXPR> {
  "typeswitch" {yybegin(_TYPESWITCH_EXPR_); return KW_TYPESWITCH; }
}
<_TYPESWITCH_EXPR_> {
  "(" {pushState(_TYPESWITCH_EXPR__); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_LBRACE; }
}
<_TYPESWITCH_EXPR__> {
  ")" {yybegin(_TYPESWITCH_EXPR_CASE); return OP_RBRACE; }
}
<_TYPESWITCH_EXPR_CASE,_TYPESWITCH_EXPR_CASE2> {
  "case" {pushState(_TYPESWITCH_EXPR_CASE2); pushState(_TYPESWITCH_EXPR_RETURN); yybegin(_TYPESWITCH_EXPR_CASE_); return KW_CASE;}
}
<_TYPESWITCH_EXPR_CASE_> {
  "$" {yypushback(1); pushState(_TYPESWITCH_EXPR_CASE_AS); yybegin(_VARNAME);}
  [^\$\x20\x09\x0D\x0A]+ {yypushback(yylength()); yybegin(_ITEM_TYPE); }
}
<_TYPESWITCH_EXPR_CASE_AS> {
  "as" {yybegin(_ITEM_TYPE); return KW_AS; }
}
<_TYPESWITCH_EXPR_CASE2> {
  "default" {yybegin(_TYPESWITCH_EXPR_DEFAULT_); return KW_DEFAULT; }
}
<_TYPESWITCH_EXPR_DEFAULT_> {
  "$" {yypushback(1); pushState(_TYPESWITCH_EXPR_RETURN); yybegin(_VARNAME); }
  [^\$\x20\x09\x0D\x0A]+ {yypushback(yylength()); yybegin(_TYPESWITCH_EXPR_RETURN); }
}
<_TYPESWITCH_EXPR_RETURN> {
  "return" {yybegin(_EXPR_SINGLE); return KW_RETURN; }
}

// FLWOR Expressions
<_FLWOR_HEAD> {
  "for" {pushState(_FLWOR_HEAD); yypushback(yylength()); yybegin(_FOR_CLAUSE); }
  "let" {pushState(_FLWOR_HEAD); yypushback(yylength()); yybegin(_LET_CLAUSE); }
}
<_FLWOR_BODY1, _FLWOR_BODY2, _FLWOR_BODY3, _FLWOR_HEAD> {
  "where" {pushState(_FLWOR_BODY2); yypushback(yylength()); yybegin(_WHERE_CLAUSE); }
}
<_FLWOR_BODY2, _FLWOR_BODY3, _FLWOR_HEAD> {
  "order" {pushState(_FLWOR_BODY3); yypushback(yylength()); yybegin(_ORDER_CLAUSE); }
  "stable" {pushState(_FLWOR_BODY3); yybegin(_ORDER_CLAUSE); return KW_STABLE; }
}
<_FLWOR_BODY3, _FLWOR_HEAD> {
  "return" {yybegin(_EXPR_SINGLE); return KW_RETURN;}
}

// ForClause := <"for" "$"> VarName TypeDeclaration? PositionalVar? "in" ExprSingle
//              ("," "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle)*
<_FOR_CLAUSE> {
  "for" { pushState(_FOR_CLAUSE_VAR_IN); pushState(_FOR_CLAUSE_VAR_POS); yybegin(_PARAM); return KW_FOR; }
}
<_FOR_CLAUSE_VAR_POS> {
  "at" { yybegin(_VARNAME); return KW_AT; }
  {NS} { yypushback(yylength()); popState(); }
}
<_FOR_CLAUSE_VAR_IN> {
  "in" { yybegin(_EXPR_SINGLE); return KW_IN;}
}

// LetClause := <"let" "$"> VarName TypeDeclaration? ":=" ExprSingle ("," "$" VarName TypeDeclaration? ":=" ExprSingle)*
<_LET_CLAUSE> {
  "let" {pushState(_LET_CLAUSE_); pushState(_LET_CLAUSE_VAR); yybegin(_PARAM); return KW_LET;}
}
<_LET_CLAUSE_> {
  "," { pushState(_LET_CLAUSE_); pushState(_LET_CLAUSE_VAR); yybegin(_PARAM); return OP_COMMA;}
  {NS} {yypushback(yylength()); popState(); }
}
<_LET_CLAUSE_VAR> {
  ":=" { yybegin(_EXPR_SINGLE); return OP_ASSIGN;}
}

// WhereClause := "where" ExprSingle
<_WHERE_CLAUSE> {
  "where" {yybegin(_EXPR_SINGLE); return KW_WHERE; }
}

// OrderByClause := (<"order" "by"> | <"stable" "order" "by">) OrderSpecList
// OrderSpecList := OrderSpec ("," OrderSpec)*
// OrderSpec     := ExprSingle OrderModifier
// OrderModifier := ("ascending" | "descending")? (<"empty" "greatest"> | <"empty" "least">)? ("collation" URILiteral)?
<_ORDER_CLAUSE> {
  "order" {yybegin(_ORDER_CLAUSE_BY); return KW_ORDER; }
}
<_ORDER_CLAUSE_BY> {
  "by" { pushState(_ORDER_CLAUSE_LIST); pushState(_ORDER_CLAUSE_MODIFIER); yybegin(_EXPR_SINGLE); return KW_BY; }
}
<_ORDER_CLAUSE_LIST> {
  "," { pushState(_ORDER_CLAUSE_LIST); pushState(_ORDER_CLAUSE_MODIFIER); yybegin(_EXPR_SINGLE); return OP_COMMA; }
  {_NS} {yypushback(1); popState(); }
}
<_ORDER_CLAUSE_MODIFIER> {
  "ascending" { return KW_ASCENDING; }
  "descending" { return KW_DESCENDING; }
  {_NS} {yypushback(1); yybegin(_ORDER_CLAUSE_MODIFIER_EMPTY); }
}
<_ORDER_CLAUSE_MODIFIER_EMPTY> {
  "empty" {yybegin(_ORDER_CLAUSE_MODIFIER_EMPTY_); return KW_EMPTY; }
  {_NS} {yypushback(1); yybegin(_ORDER_CLAUSE_MODIFIER_COLLATION); }
}
<_ORDER_CLAUSE_MODIFIER_EMPTY_> {
  "greatest" {yybegin(_ORDER_CLAUSE_MODIFIER_COLLATION); return KW_GREATEST; }
  "least" {yybegin(_ORDER_CLAUSE_MODIFIER_COLLATION); return KW_LEAST; }
}
<_ORDER_CLAUSE_MODIFIER_COLLATION> {
  "collation" {yybegin(_URILITERAL); return KW_COLLATION; }
  {_NS} {yypushback(1); popState(); }
}

// other expressions
<_COMPARE_EXPR> {
  [^] {yypushback(yylength()); pushState(_COMPARE_EXPR_); yybegin(_RANGE_EXPR); }
}
<_COMPARE_EXPR_> {
  "=" { yybegin(_RANGE_EXPR); return OP_EQUALS; }
  "!=" { yybegin(_RANGE_EXPR); return OP_NE; }
  "<" { yybegin(_RANGE_EXPR); return OP_LT; }
  "<=" { yybegin(_RANGE_EXPR); return OP_LE; }
  ">" { yybegin(_RANGE_EXPR); return OP_GT; }
  ">=" { yybegin(_RANGE_EXPR); return OP_GE; }
  "eq" { yybegin(_RANGE_EXPR); return OP_KW_EQ; }
  "ne" { yybegin(_RANGE_EXPR); return OP_KW_NE; }
  "lt" { yybegin(_RANGE_EXPR); return OP_KW_LT; }
  "le" { yybegin(_RANGE_EXPR); return OP_KW_LE; }
  "gt" { yybegin(_RANGE_EXPR); return OP_KW_GT; }
  "ge" { yybegin(_RANGE_EXPR); return OP_KW_GE; }
  "is" { yybegin(_RANGE_EXPR); return OP_KW_IS; }
  "<<" { yybegin(_RANGE_EXPR); return OP_LTLT; }
  ">>" { yybegin(_RANGE_EXPR); return OP_GTGT; }

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] {yypushback(yylength()); popState(); }
}
<_RANGE_EXPR> {
  [^] {yypushback(yylength()); pushState(_RANGE_EXPR_); yybegin(_ADD_EXPR); }
}
<_RANGE_EXPR_> {
  "to" { yybegin(_ADD_EXPR); return KW_TO; }

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] {yypushback(yylength()); popState(); }
}
<_ADD_EXPR> {
  [^] {yypushback(yylength()); pushState(_ADD_EXPR_); yybegin(_MULT_EXPR); }
}
<_ADD_EXPR_> {
  "+" {pushState(); yybegin(_MULT_EXPR); return OP_PLUS;}
  "-" {pushState(); yybegin(_MULT_EXPR); return OP_MINUS;}

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] { yypushback(yylength()); popState(); }
}
<_MULT_EXPR> {
  [^] {yypushback(yylength()); pushState(_MULT_EXPR_); yybegin(_UNION_EXPR); }
}
<_MULT_EXPR_> {
  "*" {pushState(); yybegin(_UNION_EXPR); return OP_STAR;}
  "div" {pushState(); yybegin(_UNION_EXPR); return OP_DIV;}
  "idiv" {pushState(); yybegin(_UNION_EXPR); return OP_IDIV;}
  "mod" {pushState(); yybegin(_UNION_EXPR); return OP_MOD;}

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] { yypushback(yylength()); popState(); }
}
<_UNION_EXPR> {
  [^] {yypushback(yylength()); pushState(_UNION_EXPR_); yybegin(_INTERSECT_EXCEPT_EXPR); }
}
<_UNION_EXPR_> {
  "union" {pushState(); yybegin(_INTERSECT_EXCEPT_EXPR); return KW_UNION;}
  "|" {pushState(); yybegin(_INTERSECT_EXCEPT_EXPR); return OP_PIPE;}

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] { yypushback(yylength()); popState(); }
}
<_INTERSECT_EXCEPT_EXPR> {
  [^] {yypushback(yylength()); pushState(_INTERSECT_EXCEPT_EXPR_); yybegin(_UNARY_EXPR); }
}
<_INTERSECT_EXCEPT_EXPR_> {
  "intersect" {pushState(); yybegin(_UNARY_EXPR); return KW_INTERSECT;}
  "except" {pushState(); yybegin(_UNARY_EXPR); return KW_EXCEPT;}

  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] { yypushback(yylength()); popState(); }
}
<_UNARY_EXPR> {
  "+" {return OP_PLUS; }
  "-" {return OP_MINUS; }
  "/" {pushState(_CAST_AS_EXPR); yybegin(_STEP_EXPR); return OP_SLASH;}
  "//" {pushState(_CAST_AS_EXPR); yybegin(_STEP_EXPR); return OP_SLASHSLASH; }
  "validate" {pushState(_CAST_AS_EXPR); yybegin(_VALIDATE_EXPR_X); return KW_VALIDATE; }
  "(#" {pushState(_CAST_AS_EXPR); pushState(_OPT_EXPR_LIST_IN_CURLY); pushState(_PRAGMA); yybegin(_PRAGMA_); return XQ_PRAGMA_START; }
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  [^] {pushState(_CAST_AS_EXPR); yypushback(yylength()); yybegin(_STEP_EXPR); }
}
<_CAST_AS_EXPR> {
  "castable" {yypushback(yylength()); yybegin(_CASTABLE_AS_EXPR); }
  "cast" { pushState(_CASTABLE_AS_EXPR); pushState(_OPT_QUESTION); pushState(_QNAME); yybegin(_KW_AS); return KW_CAST;}
  {S} {return WHITE_SPACE;}
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  [:letter:]+ { yybegin(_CASTABLE_AS_EXPR); yypushback(yylength()); }
  [^] { yybegin(_CASTABLE_AS_EXPR); yypushback(yylength()); }
}
<_CASTABLE_AS_EXPR> {
  "castable" { pushState(_TREAT_AS_EXPR); pushState(_OPT_QUESTION); pushState(_QNAME); yybegin(_KW_AS); return KW_CASTABLE;}
  {S} {return WHITE_SPACE;}
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  [:letter:]+ { yybegin(_TREAT_AS_EXPR); yypushback(yylength()); }
  [^] { yybegin(_TREAT_AS_EXPR); yypushback(yylength()); }
}
<_TREAT_AS_EXPR> {
  "treat" { pushState(_INSTANCEOF_EXPR); pushState(_ITEM_TYPE); yybegin(_KW_AS); return KW_CASTABLE;}
  {S} {return WHITE_SPACE;}
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  [:letter:]+ { yybegin(_INSTANCEOF_EXPR); yypushback(yylength()); }
  [^] { yybegin(_INSTANCEOF_EXPR); yypushback(yylength()); }
}
<_INSTANCEOF_EXPR> {
  "instance" { pushState(_ITEM_TYPE); yybegin(_KW_OF); return KW_INSTANCE;}
  {S} {return WHITE_SPACE;}
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  [:letter:]+ {yypushback(yylength()); popState(); }
  [^] {yypushback(yylength()); popState(); }
}

<_VALIDATE_EXPR_X> {
  "lax" {yybegin(_VALIDATE_EXPR_); return KW_LAX;}
  "strict" {yybegin(_VALIDATE_EXPR_); return KW_STRICT;}
}
<_VALIDATE_EXPR_, _VALIDATE_EXPR_X> {
  "{" {pushState(_CLOSE_CURLY); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_LCURLY; }
}
<_FILTER_EXPR> {
  "~" {}
}
<_PRAGMA> {
  "(#" {pushState(); yybegin(_PRAGMA_); return XQ_PRAGMA_START; }
  {S} {return WHITE_SPACE;}
  [^] {yypushback(yylength()); popState(); }
}
<_PRAGMA_> {
  {S} {return XQ_PRAGMA_CHAR; }
  {QName} {yypushback(yylength()); pushState(_PRAGMA_CONTENT); yybegin(_QNAME); }
}
<_PRAGMA_CONTENT> {
  [^#]|("#"[^)]) {return XQ_PRAGMA_CHAR; }
  "#)" {popState(); return XQ_PRAGMA_END; }
}

<_STEP_EXPR> {
  // flattened Literals
  "\"" { pushState(_PREDICATE_LIST); yypushback(1); yybegin(_STRINGLITERAL); }
  "'" { pushState(_PREDICATE_LIST); yypushback(1); yybegin(_STRINGLITERAL); }
  {DoubleLiteral} { yybegin(_PREDICATE_LIST); return XQ_DOUBLE_LITERAL; }
  {DecimalLiteral} { yybegin(_PREDICATE_LIST); return XQ_DECIMAL_LITERAL; }
  {IntegerLiteral} { yybegin(_PREDICATE_LIST); return XQ_INTEGER_LITERAL; }
  // flattened VarRef
  "$" { pushState(_PREDICATE_LIST); yypushback(1); yybegin(_VARNAME); }
  // flattened ParenthesizedExpr
  "(" { pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_OR_RBRACE); return OP_LBRACE;}
  ".." { yybegin(_PREDICATE_LIST); return OP_DOTDOT;}
  // flattened ContextItemExpr
  "." { yybegin(_PREDICATE_LIST);  return OP_DOT; }
  // flattened Ordered and Unordered Expressions
  "ordered" { pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_IN_CURLY); return KW_ORDERED; }
  "unordered" { pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_IN_CURLY); return KW_UNORDERED; }

  // flattened DirectConstructor
  "<!--" { pushState(_PREDICATE_LIST); yybegin(XML_COMMENT); return XML_COMMENT_START; }
  "<?" { pushState(_XML_PI_END); yybegin(_XML_PI_NAME); return XML_PI_START; }
  "<" { pushState(_XML_END_TAG); pushState(_XML_ATTRLIST_START); yybegin(_XML_TAG_NAME); return XML_TAG_START; }

  // flattened ComputedConstructor
  "document" {pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_IN_CURLY); return KW_DOCUMENT;}
  "element" {pushState(_PREDICATE_LIST); pushState(_OPT_EXPR_LIST_IN_CURLY); yybegin(_EL_IN_CURLY_OR_QNAME); return KW_ELEMENT;}
  "attribute" {pushState(_PREDICATE_LIST); pushState(_OPT_EXPR_LIST_IN_CURLY); yybegin(_EL_IN_CURLY_OR_QNAME); return KW_ATTRIBUTE;}
  "text" {pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_IN_CURLY); return KW_TEXT;}
  "comment" {pushState(_PREDICATE_LIST); yybegin(_EXPR_LIST_IN_CURLY); return KW_COMMENT;}
  "processing-instruction" {pushState(_PREDICATE_LIST); pushState(_OPT_EXPR_LIST_IN_CURLY); yybegin(_EL_IN_CURLY_OR_NCNAME); return KW_PROCESSING_INSTRUCTION;}

  // flattened AxisStep
  "child" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_CHILD;}
  "descendant" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_DESCENDANT;}
  "attribute" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_ATTRIBUTE;}
  "self" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_SELF;}
  "descendant-or-self" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_DESCENDANT_OR_SELF;}
  "following-sibling" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_FOLLOWING_SIBLING;}
  "following" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_FOLLOWING;}
  "parent" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_CHILD;}
  "ancestor" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_DESCENDANT;}
  "preceeding-sibling" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_ATTRIBUTE;}
  "preceeding" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_SELF;}
  "ancestor-or-self" { pushState(_PREDICATE_LIST); pushState(_NODE_TEST); yybegin(_COLONCOLON); return KW_DESCENDANT_OR_SELF;}

  // the @ is optional so we need to test here for the rest
  "@" { pushState(_PREDICATE_LIST); yybegin(_NODE_TEST); return OP_AT;}
  {_NS} {yypushback(yylength()); pushState(_PREDICATE_LIST); yybegin(_NODE_TEST);}
  // flattened FunctionCall
  {QName} { pushState(_PREDICATE_LIST);  yypushback(yylength()); pushState(_OPT_EXPR_LIST_IN_BRACE); yybegin(_QNAME); }
}
<_PREDICATE_LIST> {
  "[" {pushState(_PREDICATE_LIST); pushState(_CLOSE_SQUARE); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_LSQUARE; }
  [^\[\x20\x09\x0D\x0A]+ {yypushback(yylength()); popState(); }
}

<_EL_IN_CURLY_OR_QNAME> {
  "{" {yypushback(yylength()); yybegin(_EXPR_LIST_IN_CURLY); }
  {QName} {yypushback(yylength()); yybegin(_QNAME); }
}

<_EL_IN_CURLY_OR_NCNAME> {
  "{" {yypushback(yylength()); yybegin(_EXPR_LIST_IN_CURLY); }
  {NCName} {yypushback(yylength()); yybegin(_NCNAME); }
}

<_NODE_TEST> {
  "*" {popState(); return OP_STAR;}
  "void" {yybegin(_EMPTY_BRACES); return KW_VOID;}
  "item" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_ITEM;}
  "node" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_NODE;}
  "text" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_TEXT;}
  "comment" {pushState(_ITEM_TYPE_OCC); yybegin(_EMPTY_BRACES); return KW_COMMENT;}
  "document-node" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_DN); yybegin(_OPEN_BRACE); return KW_DOCUMENT_NODE;}
  "processing-instruction" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_PI); yybegin(_OPEN_BRACE); return KW_PROCESSING_INSTRUCTION;}
  "attribute" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_AorE); yybegin(_OPEN_BRACE); return KW_ATTRIBUTE;}
  "schema-attribute" {pushState(_ITEM_TYPE_OCC); pushState(_CLOSE_BRACE); pushState(_QNAME); yybegin(_OPEN_BRACE);  return KW_SCHEMA_ATTRIBUTE;}
  "element" {pushState(_ITEM_TYPE_OCC); pushState(_ITEM_TYPE_AorE); yybegin(_OPEN_BRACE); return KW_ELEMENT;}
  "schema-element" {pushState(_ITEM_TYPE_OCC); pushState(_CLOSE_BRACE); pushState(_QNAME); yybegin(_OPEN_BRACE); return KW_SCHEMA_ELEMENT;}
  {WildcardQName} {yypushback(yylength()); yybegin(_WILDCARD_QNAME); }
}

<_XML_PI_NAME> {
  "xml" {yybegin(_XML_ATTRLIST_START); return XML_PI_NAME;}
  {XmlName} {yybegin(_XML_PI_CONTENT); return XML_PI_NAME;}
  [^] {return BAD_CHARACTER;}
}
<_XML_PI_CONTENT, _XML_PI_NAME> "?>" { yypushback(yylength()); popState(); }
<_XML_PI_CONTENT> {
  {S} { return WHITE_SPACE; }
  [^] { return XML_PI_CHAR; }
}
<_XML_ATTRLIST_START> {
  {S} { pushState(_XML_ATTRLIST_START); yybegin(_XML_ATTR_NAME); return WHITE_SPACE; }
  [^] { yypushback(yylength()); popState(); }
}
<_XML_ATTR_NAME> {
  {QName} {yypushback(yylength()); pushState(_XML_ATTR_VALUE); pushState(_EQUALS); yybegin(_QNAME); }
  [^] {yypushback(yylength()); popState(); }
}
<_XML_TAG_NAME> {
  {QName} {yypushback(yylength()); yybegin(_STRICT_QNAME); }
  [^] {popState(); return BAD_CHARACTER; }
}
<_XML_END_TAG> {
  {S} {return WHITE_SPACE;}
  "/>" {popState(); return XML_EMPTYTAG_END; }
  ">" {pushState(_XML_CLOSE_TAG); yybegin(_XML_ELEMENT_CONTENT); return XML_TAG_END; }
  [^] {popState(); return BAD_CHARACTER;}
}
<_XML_CLOSE_TAG> {
  "</" / {QName} { pushState(_CLOSE_TAG); yybegin(_STRICT_QNAME); return XML_CLOSETAG_START; }
  {S} {return WHITE_SPACE;}
  [^] {popState(); return BAD_CHARACTER;}
}
<_XML_ELEMENT_CONTENT> {
  // note, wherever this is used it always repeats
  // flattened DirElemConstructor
  "<!--" { pushState(); yybegin(XML_COMMENT); return XML_COMMENT_START; }
  "<?" { pushState(); pushState(_XML_PI_END); yybegin(_XML_PI_NAME); return XML_PI_START; }
  "<![CDATA[" { pushState(); yybegin(_XML_CDATA_CONTENT); return XML_CDATA_START; }
  // this is used to escape to the outer element
  "</" {yypushback(yylength()); popState(); }
  "<" { pushState(); pushState(_XML_END_TAG); pushState(_XML_ATTRLIST_START); yybegin(_XML_TAG_NAME); return XML_TAG_START; }
  [^\{\}\<\&]+ { return XML_ELEMENT_CHAR; }
  [^] {yypushback(yylength()); pushState(); yybegin(_XML_STR_COMMON_CONTENT);}
}
<_XML_CDATA_CONTENT> {
  [^\]]|("]"[^\]])|("]]"[^\>]) {return XML_CDATA_CHAR;}
  "]]>" {popState(); return XML_CDATA_END; }
}

// common formats
<_STAR> {
  "*" {popState(); return OP_STAR; }
}
<_COLON> {
  ":" {popState(); return OP_COLON; }
}
<_COLONCOLON> {
  "::" {popState(); return OP_COLONCOLON; }
}
<_EQUALS> {
  {S} {return WHITE_SPACE;}
  "=" {popState(); return OP_EQUALS; }
  [^] {popState(); return BAD_CHARACTER; }
}
<_OPT_QUESTION> {
  "?" { popState(); return OP_QUESTION; }
  {S} { return WHITE_SPACE; }
  "(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
  [^] {yypushback(yylength()); popState(); }
}
<_KW_AS> {
  "as" {popState(); return KW_AS;}
}
<_KW_OF> {
  "of" {popState(); return KW_OF;}
}

<_OPEN_BRACE> {
  "(" {popState(); return OP_LBRACE; }
}
<_CLOSE_BRACE> {
  ")" {popState(); return OP_RBRACE; }
}
<_OPEN_CURLY> {
  "{" {popState(); return OP_LCURLY;}
}
<_CLOSE_CURLY> {
  "}" {popState(); return OP_RCURLY; }
}
<_CLOSE_SQUARE> {
  "]" {popState(); return OP_RSQUARE; }
}
<_XML_PI_END> {
  "?>" {popState(); return XML_PI_END; }
  {S} {return WHITE_SPACE;}
  [^] {popState(); return BAD_CHARACTER;}
}
<_CLOSE_TAG> {
  ">" {popState(); return XML_TAG_END; }
  {S} {return WHITE_SPACE;}
  [^] {return BAD_CHARACTER; }
}
<_EMPTY_BRACES> {
  "(" {yybegin(_EMPTY_BRACES_); return OP_LBRACE;}
}
<_EMPTY_BRACES_> {
  ")" {popState(); return OP_RBRACE; }
}
<_EXPR_LIST_IN_CURLY> {
  "{" {pushState(_CLOSE_CURLY); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); return OP_LCURLY; }
}
<_OPT_EXPR_LIST_IN_BRACE> {
  "(" {yybegin(_EXPR_LIST_OR_RBRACE); return OP_LBRACE;}
}
<_EXPR_LIST_OR_RBRACE> {
  ")" {popState(); return OP_RBRACE;}
  [^\)\x20\x09\x0D\x0A]+ {yypushback(yylength()); pushState(_CLOSE_BRACE); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); }
}
<_OPT_EXPR_LIST_IN_CURLY> {
  "{" {yybegin(_EXPR_LIST_OR_RCURLY); return OP_LCURLY;}
}
<_EXPR_LIST_OR_RCURLY> {
  "}" {popState(); return OP_RCURLY; }
  {S} {return WHITE_SPACE;}
  [^\}] {yypushback(yylength()); pushState(_CLOSE_CURLY); pushState(_EXPR_LIST); yybegin(_EXPR_SINGLE); }
}

// ("preserve" | "split") ";"
<_PRESERVE_OR_STRIP> {
  "preserve" {yybegin(_SEP); return KW_PRESERVE; }
  "strip" {yybegin(_SEP); return KW_STRIP; }
}

<_QNAME> {
  {Prefix} / ":" { yybegin(_QNAME_); return XQ_PREFIX_NAME; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
}
<_STRICT_QNAME> {
  {Prefix} / ":" { yybegin(_QNAME_); return XQ_PREFIX_NAME; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
}
<_QNAME_> {
  ":" {yybegin(_QNAME_LOCAL); return OP_COLON; }
  [^] { popState(); return BAD_CHARACTER; }
}
<_QNAME_LOCAL> {
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  [^] { popState(); return BAD_CHARACTER; }
}
<_WILDCARD_QNAME> {
  "*" / ":" {yybegin(_QNAME_); return OP_STAR; }
  {Prefix} / ":" { yybegin(_WILDCARD_QNAME_); return XQ_PREFIX_NAME; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
}
<_WILDCARD_QNAME_> {
  ":" {yybegin(_WILDCARD_QNAME_LOCAL); return OP_COLON; }
  [^] { popState(); return BAD_CHARACTER; }
}
<_WILDCARD_QNAME_LOCAL> {
  "*" {popState(); return OP_STAR; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  [^] { popState(); return BAD_CHARACTER; }
}

<_NCNAME> {
  {NCName} {popState(); return XQ_NCNAME; }
}

<EXPR_COMMENT> {
  ":)" { popState(); return XQ_COMMENT_END; }
  "(:" { pushState(); return XQ_COMMENT_START; }
  [^] { return XQ_COMMENT_CHAR; }
}
<XML_COMMENT> {
  "-->" {popState(); return XML_COMMENT_END;}
  [^\-]|(-[^\-]) {return XML_COMMENT_CHAR; }
  [^] { return BAD_CHARACTER; }
}


<_STRINGLITERAL,_URILITERAL> {
  "\"" { yybegin(STR_START_QUOTE); return XQ_STR_START; }
  "'" {yybegin(STR_START_APOS); return XQ_STR_START; }
}

<STR_START_QUOTE> {
  "\"\"" { return XQ_STR_ESCAPE_QUOTE; }
  "\"" { popState(); return XQ_STR_END; }
  [^\"\&] { return XQ_STR_CHAR; }
  [^] { yypushback(yylength()); pushState(); yybegin(_STR_COMMON_CONTENT); }
}
<STR_START_APOS> {
  "''" { return XQ_STR_ESCAPE_APOS; }
  "'" { popState(); return XQ_STR_END; }
  [^\'\&] { return XQ_STR_CHAR; }
  [^] { yypushback(yylength()); pushState(); yybegin(_STR_COMMON_CONTENT); }
}
<_STR_COMMON_CONTENT> {
  {CharRef} {popState(); return XQ_STR_CHAR_REF; }
  {PredefinedEntityRef} {popState(); return XQ_STR_ENT_REF;}
  [^] {popState(); return BAD_CHARACTER; }
}
<_XML_ATTR_VALUE> {
  {S} {return WHITE_SPACE; }
  "\"" { yybegin(_XML_STR_START_QUOTE); return XML_STR_START; }
  "'" {yybegin(_XML_STR_START_APOS); return XML_STR_START; }
  [^] {popState(); return BAD_CHARACTER;}
}
<_XML_STR_START_QUOTE> {
  "\"\"" { return XML_STR_ESCAPE_QUOTE; }
  "\"" { popState(); return XML_STR_END; }
  [^\"\{\}\<\&] { return XML_STR_CHAR; }
  [^] { yypushback(yylength()); pushState(); yybegin(_XML_STR_COMMON_CONTENT); }
}
<_XML_STR_START_APOS> {
  "''" { return XML_STR_ESCAPE_APOS; }
  "'" { popState(); return XML_STR_END; }
  [^\'\{\}\<\&] { return XML_STR_CHAR; }
  [^] { yypushback(yylength()); pushState(); yybegin(_XML_STR_COMMON_CONTENT); }
}
<_XML_STR_COMMON_CONTENT> {
  {CharRef} {popState(); return XML_STR_CHAR_REF; }
  {PredefinedEntityRef} {popState(); return XML_STR_ENT_REF; }
  "{{" {popState(); return OP_LCURLYCURLY; }
  "}}" {popState(); return OP_RCURLYCURLY; }
  "{" {yypushback(yylength()); yybegin(_EXPR_LIST_IN_CURLY); }
  [^] {popState(); return BAD_CHARACTER; }
}

// ("at" URILiteral ("," URILiteral)*)?
<_ATLIST> {
  "at" {pushState(_ATLIST_); yybegin(_URILITERAL); return KW_AT;}
  {NS} {yypushback(yylength()); popState();}
}
<_ATLIST_> {
  "," {pushState(_ATLIST_); yybegin(_URILITERAL); return OP_COMMA;}
  {NS} {yypushback(yylength()); popState();}
}

// "$" QNAME
<_VARNAME> {
  "$" {yybegin(_QNAME); return OP_VARSTART; }
}


"(:" { pushState(); yybegin(EXPR_COMMENT); return XQ_COMMENT_START; }
{S} { return WHITE_SPACE; }
//[:letter:]+ { return BAD_WORD; }
[^] { yybegin(YYINITIAL); return BAD_CHARACTER; }
