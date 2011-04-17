package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

// this lexer follows the principles set out in http://www.w3.org/TR/xquery-xpath-parsing/
@SuppressWarnings({"UnusedDeclaration", "UnusedAssignment", "FieldCanBeLocal", "AccessStaticViaInstance", "JavaDoc", "ConstantConditions","UnnecessarySemicolon"})
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
  int wordSep() {
    return _WORD_SEP;
  }
  int optWordSep() {
    return _OPT_WORD_SEP;
  }
  int xmlWordSep() {
    return _XML_WORD_SEP;
  }
  int optXmlWordSep() {
    return _XML_OPT_WORD_SEP;
  }
%}

// utility matchers, generally one word/letter matching
// comment or space
%x _WORD_SEP
%x _OPT_WORD_SEP
%x _XML_WORD_SEP
%x _XML_OPT_WORD_SEP
%x _COMMA
%x _SEMI
%x _KW_AS
%x _KW_OF
%x _EQUALS
%x _EMPTY_BRACES
%x _RBRACE
%x _LBRACE
%x _LCURLY
%x _RCURLY
%x _RSQUARE
%x _CLOSE_TAG
%x _EXPR_LIST_IN_CURLY
%x _EXPR_LIST_IN_BRACE
%x _OPT_EXPR_LIST_IN_BRACE
%x _OPT_EXPR_LIST_IN_CURLY
%x _EXPR_LIST_OR_RBRACE
%x _EXPR_LIST_OR_RCURLY
%x _QNAME
%x QNAME_OR_EXPR_LIST_IN_CURLY
%x NCNAME_OR_EXPR_LIST_IN_CURLY
%x _NCNAME
%x _QNAME_
%x _QNAME_LOCAL
%x _WILDCARD_QNAME
%x _WILDCARD_QNAME_
%x _WILDCARD_QNAME_LOCAL
%x _OPT_QUESTION
%x _COLONCOLON

// literals
%x XQ_COMMENT
%x XML_COMMENT
%x STRING_LITERAL
%x STR_START_QUOTE
%x STR_START_APOS
%x _STR_COMMON_CONTENT
%x URI_LITERAL
%x VARNAME
%x OPT_VARNAME
%x PRESERVE_OR_STRIP

// the top level module file
%x MODULE
%x LIBRARY_OR_MAIN
%x LIBRARY_MODULE
%x MAIN_MODULE
%x QUERY_BODY

// VersionDecl
%x VERSION_DECL
%x VERSION_DECL_VERSION
%x VERSION_DECL_ENCODING

// ModuleDecl
%x MODULE_DECL

// "declare" ...
%x DECLARE_DECL

// "import" ...
%x IMPORT_DECL

// "declare" ...
%x DECLARE_X
%x DECLARE_COPYNS_PRESERVE_OR_NOT
%x DECLARE_COPYNS_INHERIT_OR_NOT
%x DECLARE_DEFAULT_X
%x DECLARE_DEFAULT_ORDER_EMPTY
%x GREATEST_OR_LEAST
%x NAMESPACE_THEN_URI
%x IMPORT_SCHEMA_OR_MODULE
%x IMPORT_SCHEMA_NAMESPACE_OR_DEFAULT
%x IMPORT_ELEMENT
%x IMPORT_ELEMENT_NAMESPACE
%x IMPORT_MODULE_NAMESPACE

// (":=" ExprSingle) | "external"
%x ASSIGN_OR_EXTERNAL
// {NCName} = UriLiteral
%x NCNAME_EQUALS_URI
// ("at" URILiteral ("," URILiteral)*)?
%x OPT_AT_THEN_URI_LIST
%x OPT_COMMA_THEN_URI_LIST

// "$" QName TypeDeclaration?
%x VARNAME_THEN_OPT_TYPE_DECL
// ("as" SequenceType)?
%x OPT_AS_THEN_SEQUENCE_TYPE

// "namespace" NCName = ""
%x NAMESPACE_THEN_NCNAME_EQUALS_URI
// "ordered" | "unordered"
%x ORDERED_OR_UNORDERED

// ("empty-sequence" "(" ")") | (ItemType OccurrenceIndicator?)
%x SEQUENCE_TYPE
// 	DocumentTest | ElementTest | AttributeTest | SchemaElementTest | SchemaAttributeTest
//  | PITest | CommentTest | TextTest | AnyKindTest
%x KIND_TEST
// 	KindTest | ("item" "(" ")") | AtomicType
%x ITEM_TYPE
// ("?" | "*" | "+")?
%x OPT_OCCURANCE_INDICATOR
// (NCName | StrLiteral)?
%x OPT_STR_OR_NCNAME
// "attribute" "(" ( (QName | "*") OPT_COMMA_THEN_QNAME )? ")"
%x ATTRIBUTE_TEST
// "element" "(" ( (QName | "*") OPT_COMMA_THEN_QNAME_THEN_OPT_QUESTION )? ")"
%x ELEMENT_TEST
// ("," TypeName )?
%x OPT_COMMA_THEN_QNAME
// ("," TypeName "?"? )?
%x OPT_COMMA_THEN_QNAME_THEN_OPT_QUESTION
%x DOCUMENT_TEST
%x PARAM_LIST_OR_RBRACE
%x PARAM_LIST_REPEATER
%x EXPR_LIST_OR_EXTERNAL


// Expression states
%x EXPR_SINGLE
// ExprSingle ("," ExprSingle)*
%x EXPR_REPEATER

// If expression
%x IF_EXPR
%x IFTHEN_EXPR
%x IFTHEN_ELSE

// Quantified Expression
%x QUANTIFIED_EXPR
%x QUANTIFIED_EXPR_VAR
%x QUANTIFIED_EXPR_REPEATER
%x QUANTIFIED_EXPR_IN
%x QUANTIFIED_EXPR_SATISFIES

// TypeSwitch expression
%x TYPESWITCH_EXPR
%x TYPESWITCH_EXPR_CASE
%x TYPESWITCH_EXPR_CASE2
%x TYPESWITCH_EXPR_CASE_OPT_VAR
%x TYPESWITCH_EXPR_CASE_OPT_VAR_AS
%x TYPESWITCH_EXPR_RETURN

// FLWOR states
%x FLWOR_EXPR
%x FLWOR_EXPR_OPT_WHERE
%x FLWOR_EXPR_OPT_ORDER
%x FLWOR_EXPR_RETURN
// FLWOR for
%x FLWOR_FOR
%x FLWOR_FOR_REPEATER
%x FLWOR_FOR_OPT_POSITIONAL
%x FLWOR_FOR_IN
// FLWOR let
%x FLWOR_LET
%x FLWOR_LET_REPEATER
%x FLWOR_LET_ASSIGN
// FLWOR where
%x FLWOR_WHERE
// FLWOR order by
%x FLWOR_ORDER
%x FLWOR_ORDER_BY
%x FLWOR_ORDER_BY_REPEATER
%x OPT_ASCENDING_OR_DESCENDING
%x OPT_EMPTY_THEN_GREATEST_OR_LEAST
%x GREATEST_OR_LEAST
%x OPT_COLLATION_THEN_URI

// binary and unary expressions
%x OPT_OR_EXPR
%x OPT_AND_EXPR
%x OPT_COMPARE_EXPR
%x OPT_RANGE_EXPR
%x OPT_ADD_EXPR
%x OPT_MULT_EXPR
%x OPT_UNION_EXPR
%x OPT_INTERSECT_OR_EXCEPT_EXPR
%x OPT_INSTANCE_OF_EXPR
%x OPT_TREAT_AS_EXPR
%x OPT_CASTABLE_AS_EXPR
%x OPT_CAST_AS_EXPR
%x OPT_UNARY_EXPR

%x _OR_EXPR
%x _AND_EXPR
%x _COMPARE_EXPR
%x _RANGE_EXPR
%x _ADD_EXPR
%x _MULT_EXPR
%x _UNION_EXPR
%x _INTERSECT_EXCEPT_EXPR
%x _INSTANCE_OF_EXPR
%x _TREAT_AS_EXPR
%x _CASTABLE_AS_EXPR
%x _CAST_AS_EXPR

%x VALUE_EXPR
%x VALIDATE_EXPR

%x RELATIVE_PATH_EXPR
%x STEP_EXPR
%x NODE_TEST
%x OPT_PREDICATE_LIST

%x PRAGMA
%x PRAGMA_CONTENT

// xml states
%x XML_PI_NAME
%x XML_PI_CONTENT
%x XML_PI_END
%x XML_ATTRIBUTE_EQUALS_VALUE
%x XML_ATTR_VALUE
%x XML_ELEMENT_CONTENT
%x XML_TAG_NAME
%x XML_END_TAG
%x XML_START_CLOSE_TAG
%x XML_CDATA_CONTENT
%x _XML_CDATA_END
%x XML_STR_COMMON_CONTENT
%x _XML_STR_START_QUOTE
%x _XML_STR_START_APOS


// whitespace
S = [\x20\x09\x0D\x0A]+
NS = [^\x20\x09\x0D\x0A]+
_NS = [^\x20\x09\x0D\x0A]
ELSE = ([:letter:]+)|[^]

Digits = [0-9]+
DecimalLiteral = ("." {Digits}) | ({Digits} "." [0-9]*)
DoubleLiteral = (("." {Digits}) | ({Digits} ("." [0-9]*)?)) [eE] [+-]? {Digits}
IntegerLiteral = {Digits}

// words

Char = [\x09\x0A\x0D\x20-\uD7FF\uE000-\uFFFD]
CharRef = ("&#"[0-9]+";") | ("&#x"[0-9a-fA-F]+";")
PredefinedEntityRef = "&"("lt"|"gt"|"amp"|"quot"|"apos")";"
WordSep = !({Char})

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

// get into a state quickly
<YYINITIAL> {
  {ELSE} { undo(); optSpaceThen(MODULE); }
}

// ---------------------------------------------------------------------------------------------------------------------
//
// VersionDecl, ModuleDecl and Prolog
//
// ---------------------------------------------------------------------------------------------------------------------

// VersionDecl entry point
// only available as the first non-space line in a file
<VERSION_DECL, MODULE> {
  "xquery" { pushOptSpaceThen(LIBRARY_OR_MAIN); pushOptSpaceThen(_SEMI); spaceThen(VERSION_DECL_VERSION); return KW_XQUERY; }
}
// ModuleDecl entry point
<MODULE_DECL, MODULE, LIBRARY_OR_MAIN> {
  "module" {
    setInitialState(LIBRARY_MODULE);
    pushOptSpaceThen(LIBRARY_MODULE);
    pushOptSpaceThen(_SEMI);
    spaceThen(NAMESPACE_THEN_NCNAME_EQUALS_URI);
    return KW_MODULE;
  }
  {ELSE} { setInitialState(MAIN_MODULE); retryAs(MAIN_MODULE); }
}
// SchemaImport entry point
<IMPORT_DECL, LIBRARY_MODULE, MAIN_MODULE> {
  "import" {
    optSpaceRepeat();
    pushOptSpaceThen(_SEMI); 
    pushOptSpaceThen(OPT_AT_THEN_URI_LIST);
    spaceThen(IMPORT_SCHEMA_OR_MODULE); 
    return KW_IMPORT; 
  }
}
// "declare" XXX entry point
<DECLARE_DECL, LIBRARY_MODULE, MAIN_MODULE> {
  "declare" { optSpaceRepeat(); pushOptSpaceThen(_SEMI); spaceThen(DECLARE_X); return KW_DECLARE; }
}
//<MODULE, MAIN_MODULE, LIBRARY_MODULE> {
//  "(:" { yybegin(XQ_COMMENT); return XQ_COMMENT_START; }
//}
<MAIN_MODULE> {ELSE} { setInitialState(QUERY_BODY); undo(); startList(EXPR_SINGLE, EXPR_REPEATER); }
<LIBRARY_MODULE> {ELSE} { return BAD_CHARACTER; }
<QUERY_BODY> {ELSE} { return BAD_CHARACTER; }

// xquery version "" (encoding "")? ;
<VERSION_DECL_VERSION> {
  "version" {
    pushOptSpaceThen(VERSION_DECL_ENCODING);
    optSpaceThen(STRING_LITERAL);
    return KW_VERSION;
  }
  {ELSE} {return BAD_CHARACTER; }
}

<VERSION_DECL_ENCODING> {
  "encoding" { optSpaceThen(STRING_LITERAL); return KW_ENCODING; }
  {ELSE} { retry(); }
}


// ---------------------------------------------------------------------------------------------------------------------
//
// "declare" ...
//
// ---------------------------------------------------------------------------------------------------------------------

<DECLARE_X> {
  "option" { pushSpaceThen(STRING_LITERAL); spaceThen(_QNAME); return KW_OPTION;}
  "ordering" { spaceThen(ORDERED_OR_UNORDERED); return KW_ORDERING; }
  "boundary-space" {spaceThen(PRESERVE_OR_STRIP); return KW_BOUNDARY_SPACE; }
  "base-uri" { spaceThen(URI_LITERAL); return KW_BASE_URI; }
  "copy-namespaces" {spaceThen(DECLARE_COPYNS_PRESERVE_OR_NOT); return KW_COPY_NAMESPACES; }
  "construction" {spaceThen(PRESERVE_OR_STRIP); return KW_CONSTRUCTION; }
  "default" {spaceThen(DECLARE_DEFAULT_X); return KW_DEFAULT; }
  "variable" { pushOptSpaceThen(ASSIGN_OR_EXTERNAL); spaceThen(VARNAME_THEN_OPT_TYPE_DECL); return KW_VARIABLE; }
  "function" {
    pushOptSpaceThen(EXPR_LIST_OR_EXTERNAL);
    pushOptSpaceThen(OPT_AS_THEN_SEQUENCE_TYPE);
    pushOptSpaceThen(PARAM_LIST_OR_RBRACE);
    pushOptSpaceThen(_LBRACE);
    spaceThen(_QNAME);
    return KW_VARIABLE; }
}

// "namespace" NCName "=" UriLiteral
<NAMESPACE_THEN_NCNAME_EQUALS_URI, DECLARE_X> {
  "namespace" { optSpaceThen(NCNAME_EQUALS_URI); return KW_MODULE; }
  {ELSE} { return BAD_CHARACTER; }
}

// DECLARE DEFAULT ...
<DECLARE_DEFAULT_X> {
  "collation" { spaceThen(URI_LITERAL); return KW_COLLATION; }
  "order" {spaceThen(DECLARE_DEFAULT_ORDER_EMPTY); return KW_ORDER; }
  "function" {spaceThen(NAMESPACE_THEN_URI); return KW_FUNCTION; }
  "element" {spaceThen(NAMESPACE_THEN_URI); return KW_ELEMENT; }
  {ELSE} { return BAD_CHARACTER; }
}

// declare default empty (greatest | least)
<DECLARE_DEFAULT_ORDER_EMPTY> {
  "empty" {spaceThen(GREATEST_OR_LEAST); return KW_EMPTY; }
  {ELSE} { return BAD_CHARACTER; }
}
// "greatest" | "least"
<GREATEST_OR_LEAST> {
  "greatest" { popState(); return KW_GREATEST;}
  "least" { popState(); return KW_LEAST;}
  {ELSE} { return BAD_CHARACTER; }
}

// "namespace" URI_LITERAL
<NAMESPACE_THEN_URI> {
  "namespace" { spaceThen(URI_LITERAL); return KW_NAMESPACE; }
  {ELSE} { return BAD_CHARACTER; }
}

// ORDERING
<ORDERED_OR_UNORDERED> {
  "ordered" { popState(); return KW_ORDERED; }
  "unordered" { popState(); return KW_UNORDERED; }
  {ELSE} { return BAD_CHARACTER; }
}

// {NCName} = URI_LITERAL
<NCNAME_EQUALS_URI> {
  {NCName} { pushOptSpaceThen(URI_LITERAL); optSpaceThen(_EQUALS); return XQ_LOCAL_NAME; }
  {ELSE} { return BAD_CHARACTER; }
}

// ("preserve" | "no-preserve") "," DECLARE_COPYNS_INHERIT_OR_NOT
<DECLARE_COPYNS_PRESERVE_OR_NOT> {
  "preserve" {pushOptSpaceThen(DECLARE_COPYNS_INHERIT_OR_NOT); optSpaceThen(_COMMA); return KW_PRESERVE; }
  "no-preserve" {pushOptSpaceThen(DECLARE_COPYNS_INHERIT_OR_NOT); optSpaceThen(_COMMA); return KW_NO_PRESERVE;}
  {ELSE} { return BAD_CHARACTER; }
}
// "inherit" | "no-inherit"
<DECLARE_COPYNS_INHERIT_OR_NOT> {
  "inherit" { popState(); return KW_INHERIT; }
  "no-inherit" { popState(); return KW_NO_INHERIT; }
  {ELSE} { return BAD_CHARACTER; }
}

// (":=" ExprSingle) | "external"
<ASSIGN_OR_EXTERNAL> {
  ":=" { optSpaceThen(EXPR_SINGLE); return OP_ASSIGN;}
  "external" {popState(); return KW_EXTERNAL;}
  {ELSE} { return BAD_CHARACTER; }
}

<PARAM_LIST_OR_RBRACE> {
  ")" { popState(); return OP_RBRACE; }
  {ELSE} { pushOptSpaceThen(PARAM_LIST_REPEATER); retryAs(VARNAME_THEN_OPT_TYPE_DECL); }
}
<PARAM_LIST_REPEATER> {
  "," { optSpaceRepeat(); optSpaceThen(VARNAME_THEN_OPT_TYPE_DECL); }
  ")" { popState(); return OP_RBRACE; }
  {ELSE} { retry(); }
}
// ("external" | "{" Expr "}")
<EXPR_LIST_OR_EXTERNAL> {
  "external" { popState(); return KW_EXTERNAL; }
  "{" { retryAs(_EXPR_LIST_IN_CURLY); }
  {ELSE} { return BAD_CHARACTER; }
}

// import ...
<IMPORT_SCHEMA_OR_MODULE> {
  "schema" {spaceThen(IMPORT_SCHEMA_NAMESPACE_OR_DEFAULT); return KW_SCHEMA; }
  "module" {spaceThen(IMPORT_MODULE_NAMESPACE); return KW_MODULE; }
  {ELSE} { return BAD_CHARACTER; }
}
// import schema (namespace =) | (default element namespace) "" (at "" (, "")*)?
<IMPORT_SCHEMA_NAMESPACE_OR_DEFAULT> {
  "namespace" { spaceThen(NCNAME_EQUALS_URI); return KW_NAMESPACE; }
  "default" { spaceThen(IMPORT_ELEMENT); return KW_DEFAULT; }
  {ELSE} { return BAD_CHARACTER; }
}
<IMPORT_ELEMENT> {
  "element" { spaceThen(IMPORT_ELEMENT_NAMESPACE); return KW_ELEMENT; }
  {ELSE} { return BAD_CHARACTER; }
}
<IMPORT_ELEMENT_NAMESPACE> {
  "namespace" { spaceThen(URI_LITERAL); return KW_NAMESPACE; }
  {ELSE} { return BAD_CHARACTER; }
}
<IMPORT_MODULE_NAMESPACE> {
  "namespace" { optSpaceThen(NCNAME_EQUALS_URI); return KW_NAMESPACE; }
  {ELSE} { retryAs(URI_LITERAL); }
}


// variable declaration part
// "$" VarName TypeDeclaration?
//
<VARNAME_THEN_OPT_TYPE_DECL> {
  "$" {  pushOptSpaceThen(OPT_AS_THEN_SEQUENCE_TYPE); retryAs(VARNAME); }
  {ELSE} { return BAD_CHARACTER; }
}
<OPT_AS_THEN_SEQUENCE_TYPE> {
  "as" {spaceThen(SEQUENCE_TYPE); return KW_AS; }
  {ELSE} { retry(); }
}

<SEQUENCE_TYPE> {
  "empty-sequence" { optSpaceThen(_EMPTY_BRACES); return KW_EMPTY_SEQUENCE; }
  {ELSE} { pushOptSpaceThen(OPT_OCCURANCE_INDICATOR); retryAs(ITEM_TYPE); }
}

<KIND_TEST, ITEM_TYPE> {
  "document-node" { surround(_LBRACE, DOCUMENT_TEST, _RBRACE); return KW_DOCUMENT_NODE;}
  "element" { surround(_LBRACE, ELEMENT_TEST, _RBRACE); return KW_ELEMENT;}
  "attribute" { surround(_LBRACE, ATTRIBUTE_TEST, _RBRACE); return KW_ATTRIBUTE;}
  "schema-element" { surround(_LBRACE, _QNAME, _RBRACE); return KW_SCHEMA_ELEMENT;}
  "schema-attribute" { surround(_LBRACE, _QNAME, _RBRACE); return KW_SCHEMA_ATTRIBUTE;}
  "processing-instruction" { surround(_LBRACE, OPT_STR_OR_NCNAME, _RBRACE); return KW_PROCESSING_INSTRUCTION;}
  "comment" { optSpaceThen(_EMPTY_BRACES); return KW_COMMENT;}
  "text" { optSpaceThen(_EMPTY_BRACES); return KW_TEXT;}
  "node" { optSpaceThen(_EMPTY_BRACES); return KW_NODE;}
}
<ITEM_TYPE> {
  "item" { optSpaceThen(_EMPTY_BRACES); return KW_ITEM;}
  {QName} { retryAs(_QNAME); }
  {ELSE} { return BAD_CHARACTER; }
}
<OPT_OCCURANCE_INDICATOR> {
  "?" {popState(); return OP_QUESTION;}
  "*" {popState(); return OP_STAR;}
  "+" {popState(); return OP_PLUS;}
  {ELSE} {retry();}
}
// (NCName | "")?
<OPT_STR_OR_NCNAME> {
  "\""|"'" { retryAs(STRING_LITERAL); }
  {NCName} { retryAs(_NCNAME); }
  {ELSE} { retry(); }
}
// (QName|* (, QName "?"? )? )? )?
<ELEMENT_TEST> {
  "*" {optSpaceThen(OPT_COMMA_THEN_QNAME_THEN_OPT_QUESTION); return OP_STAR; }
  {QName} {pushOptSpaceThen(OPT_COMMA_THEN_QNAME_THEN_OPT_QUESTION); retryAs(_QNAME); }
  {ELSE} { retry(); }
}
// (QName|* (, QName )? )? )?
<ATTRIBUTE_TEST> {
  "*" {optSpaceThen(OPT_COMMA_THEN_QNAME); return OP_STAR; }
  {QName} {pushOptSpaceThen(OPT_COMMA_THEN_QNAME); retryAs(_QNAME); }
  {ELSE} { retry(); }
}
<OPT_COMMA_THEN_QNAME> {
  "," {optSpaceThen(_QNAME); return OP_COMMA;}
  {ELSE} { retry(); }
}
<OPT_COMMA_THEN_QNAME_THEN_OPT_QUESTION> {
  "," {pushOptSpaceThen(_OPT_QUESTION); optSpaceThen(_QNAME); return OP_COMMA;}
  {ELSE} { retry(); }
}

// as document-node( (ElementTest | ElementSchemaTest)? )
<DOCUMENT_TEST> {
  "element" {surround(_LBRACE, ELEMENT_TEST, _RBRACE); return KW_ELEMENT;}
  "schema-element" {surround(_LBRACE, _QNAME, _RBRACE); return KW_SCHEMA_ELEMENT;}
  {ELSE} { retry(); }
}

// default state cleanup
<MAIN_MODULE> {
  {ELSE} { pushList(EXPR_SINGLE, EXPR_REPEATER); retry();}
}



// ---------------------------------------------------------------------------------------------------------------------
//
// Expressions
//
// ---------------------------------------------------------------------------------------------------------------------

// IfExpr := <"if" "("> Expr ")" "then" ExprSingle "else" ExprSingle
<IF_EXPR, EXPR_SINGLE> "if" {pushOptSpaceThen(IFTHEN_EXPR); optSpaceThen(_EXPR_LIST_IN_BRACE); return KW_IF;}

// QuantifiedExpr := (<"some" "$"> | <"every" "$">) VarName TypeDeclaration? "in" ExprSingle
//                    ("," "$" VarName TypeDeclaration? "in" ExprSingle)* "satisfies" ExprSingle
<QUANTIFIED_EXPR, EXPR_SINGLE> {
  "some" {startList(QUANTIFIED_EXPR_VAR, QUANTIFIED_EXPR_REPEATER); return KW_SOME;}
  "every" {startList(QUANTIFIED_EXPR_VAR, QUANTIFIED_EXPR_REPEATER); return KW_EVERY;}
}
// "typeswitch" "(" Expr ")" CaseClause+ "default" ("$" VarName)? "return" ExprSingle
<TYPESWITCH_EXPR, EXPR_SINGLE> "typeswitch" {
  pushOptSpaceThen(TYPESWITCH_EXPR_CASE);
  optSpaceThen(_EXPR_LIST_IN_BRACE); 
  return KW_TYPESWITCH; 
}

<FLWOR_EXPR, EXPR_SINGLE> {
  "for" {pushOptSpaceThen(FLWOR_EXPR); retryAs(FLWOR_FOR); }
  "let" {pushOptSpaceThen(FLWOR_EXPR); retryAs(FLWOR_LET); }
}

// default case happens after all others may have matched
<EXPR_SINGLE> {ELSE} { retryAs(_OR_EXPR); }
<EXPR_REPEATER> {
  "," {optSpaceRepeat(); optSpaceThen(EXPR_SINGLE); return OP_COMMA; }
  {ELSE} { retry(); }
}


// if expression body
<IFTHEN_EXPR> {
  "then" {pushOptSpaceThen(IFTHEN_ELSE); optSpaceThen(EXPR_SINGLE); return KW_THEN; }
  {ELSE} {return BAD_CHARACTER; }
}
<IFTHEN_ELSE> {
  "else" {optSpaceThen(EXPR_SINGLE); return KW_ELSE; }
  {ELSE} {return BAD_CHARACTER; }
}


// quantified expression body
<QUANTIFIED_EXPR_VAR> {
  {ELSE} {pushOptSpaceThen(QUANTIFIED_EXPR_IN); optSpaceThen(VARNAME_THEN_OPT_TYPE_DECL); undo(); }
}
<QUANTIFIED_EXPR_REPEATER> {
  "," {optSpaceRepeat(); pushOptSpaceThen(QUANTIFIED_EXPR_IN); optSpaceThen(VARNAME_THEN_OPT_TYPE_DECL); return OP_COMMA; }
  {ELSE} { retry(); }
}
<QUANTIFIED_EXPR_IN> {
  "in" {pushState(QUANTIFIED_EXPR_SATISFIES); optSpaceThen(EXPR_SINGLE); return KW_IN;}
  {ELSE} { return BAD_CHARACTER; }
}
<QUANTIFIED_EXPR_SATISFIES> {
  "satisfies" {optSpaceThen(EXPR_SINGLE); return KW_SATISFIES; }
  {ELSE} { return BAD_CHARACTER; }
}


// Typeswitch body
<TYPESWITCH_EXPR_CASE2> {
  "default" { pushOptSpaceThen(TYPESWITCH_EXPR_RETURN); optSpaceThen(OPT_VARNAME); return KW_DEFAULT; }
}
<TYPESWITCH_EXPR_CASE,TYPESWITCH_EXPR_CASE2> {
  "case" {
    pushOptSpaceThen(TYPESWITCH_EXPR_CASE2);
    pushOptSpaceThen(TYPESWITCH_EXPR_RETURN);
    optSpaceThen(TYPESWITCH_EXPR_CASE_OPT_VAR);
    return KW_CASE;
  }
  {ELSE} { return BAD_CHARACTER; }
}
<TYPESWITCH_EXPR_CASE_OPT_VAR> {
  "$" {pushOptSpaceThen(TYPESWITCH_EXPR_CASE_OPT_VAR_AS); retryAs(VARNAME);}
  {ELSE} {retryAs(SEQUENCE_TYPE); }
}
<TYPESWITCH_EXPR_CASE_OPT_VAR_AS> {
  "as" {spaceThen(SEQUENCE_TYPE); return KW_AS; }
  {ELSE} { return BAD_CHARACTER; }
}
<TYPESWITCH_EXPR_RETURN> {
  "return" {optSpaceThen(EXPR_SINGLE); return KW_RETURN; }
  {ELSE} { return BAD_CHARACTER; }
}


// FLWOR Expressions
// fall through to where clause
<FLWOR_EXPR> {ELSE} {retryAs(FLWOR_EXPR_OPT_WHERE); }
<FLWOR_EXPR_OPT_WHERE> {
  "where" {pushOptSpaceThen(FLWOR_EXPR_OPT_ORDER); retryAs(FLWOR_WHERE); }
  {ELSE} { retryAs(FLWOR_EXPR_OPT_ORDER); }
}
<FLWOR_EXPR_OPT_ORDER> {
  "order" {pushOptSpaceThen(FLWOR_EXPR_RETURN); retryAs(FLWOR_ORDER); }
  "stable" {pushOptSpaceThen(FLWOR_EXPR_RETURN); spaceThen(FLWOR_ORDER); return KW_STABLE; }
  {ELSE} { retryAs(FLWOR_EXPR_RETURN); }
}
<FLWOR_EXPR_RETURN> {
  "return" {optSpaceThen(EXPR_SINGLE); return KW_RETURN;}
  {ELSE} { return BAD_CHARACTER; }
}

// ForClause := <"for" "$"> VarName TypeDeclaration? PositionalVar? "in" ExprSingle
//              ("," "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle)*
<FLWOR_FOR> {
  "for" { 
    pushOptSpaceThen(FLWOR_FOR_REPEATER);
    pushOptSpaceThen(FLWOR_FOR_IN);
    pushOptSpaceThen(FLWOR_FOR_OPT_POSITIONAL);
    spaceThen(VARNAME_THEN_OPT_TYPE_DECL); 
    return KW_FOR; 
  }
}
<FLWOR_FOR_REPEATER> {
  "," {
    optSpaceRepeat();
    pushState(FLWOR_FOR_IN);
    pushOptSpaceThen(FLWOR_FOR_OPT_POSITIONAL);
    spaceThen(VARNAME_THEN_OPT_TYPE_DECL);
    return OP_COMMA;
  }
  {ELSE} { retry(); }
}
<FLWOR_FOR_OPT_POSITIONAL> {
  "at" { spaceThen(VARNAME); return KW_AT; }
  {ELSE} { retry(); }
}
<FLWOR_FOR_IN> {
  "in" { spaceThen(EXPR_SINGLE); return KW_IN;}
  {ELSE} { return BAD_CHARACTER; }
}

// LetClause := <"let" "$"> VarName TypeDeclaration? ":=" ExprSingle ("," "$" VarName TypeDeclaration? ":=" ExprSingle)*
<FLWOR_LET> {
  "let" {
    pushOptSpaceThen(FLWOR_LET_REPEATER);
    pushOptSpaceThen(FLWOR_LET_ASSIGN);
    optSpaceThen(VARNAME_THEN_OPT_TYPE_DECL);
    return KW_LET;
  }
}
<FLWOR_LET_REPEATER> {
  "," {
    optSpaceRepeat();
    pushOptSpaceThen(FLWOR_LET_ASSIGN);
    optSpaceThen(VARNAME_THEN_OPT_TYPE_DECL);
    return OP_COMMA;
  }
  {ELSE} { retry(); }
}
<FLWOR_LET_ASSIGN> {
  ":=" { optSpaceThen(EXPR_SINGLE); return OP_ASSIGN;}
  {ELSE} { return BAD_CHARACTER; }
}

// WhereClause := "where" ExprSingle
<FLWOR_WHERE> {
  "where" { spaceThen(EXPR_SINGLE); return KW_WHERE; }
}

// OrderByClause := (<"order" "by"> | <"stable" "order" "by">) OrderSpecList
// OrderSpecList := OrderSpec ("," OrderSpec)*
// OrderSpec     := ExprSingle OrderModifier
// OrderModifier := ("ascending" | "descending")? (<"empty" "greatest"> | <"empty" "least">)? ("collation" URILiteral)?
<FLWOR_ORDER> {
  "order" {spaceThen(FLWOR_ORDER_BY); return KW_ORDER; }
}
<FLWOR_ORDER_BY> {
  "by" {
    pushOptSpaceThen(FLWOR_ORDER_BY_REPEATER);
    pushOptSpaceThen(OPT_COLLATION_THEN_URI);
    pushOptSpaceThen(OPT_EMPTY_THEN_GREATEST_OR_LEAST);
    pushOptSpaceThen(OPT_ASCENDING_OR_DESCENDING);
    optSpaceThen(EXPR_SINGLE);
    return KW_BY;
  }
}
<FLWOR_ORDER_BY_REPEATER> {
  "," {
    optSpaceRepeat();
    pushOptSpaceThen(OPT_COLLATION_THEN_URI);
    pushOptSpaceThen(OPT_EMPTY_THEN_GREATEST_OR_LEAST);
    pushOptSpaceThen(OPT_ASCENDING_OR_DESCENDING);
    optSpaceThen(EXPR_SINGLE);
    return OP_COMMA;
  }
  {ELSE} { retry(); }
}
<OPT_ASCENDING_OR_DESCENDING> {
  "ascending" { popState(); return KW_ASCENDING; }
  "descending" { popState(); return KW_DESCENDING; }
  {ELSE} { retry(); }
}
<OPT_EMPTY_THEN_GREATEST_OR_LEAST> {
  "empty" { optSpaceThen(GREATEST_OR_LEAST); return KW_EMPTY; }
  {ELSE} { retry(); }
}
<GREATEST_OR_LEAST> {
  "greatest" { popState(); return KW_GREATEST; }
  "least" { popState(); return KW_LEAST; }
  {ELSE} { return BAD_CHARACTER; }
}
<OPT_COLLATION_THEN_URI> {
  "collation" { spaceThen(URI_LITERAL); return KW_COLLATION; }
  {ELSE} { retry(); }
}

// other expressions
// build the parse stack
<_OR_EXPR> {
  {ELSE} { pushOptSpaceThen(OPT_OR_EXPR); retryAs(_AND_EXPR); }
}
<_AND_EXPR> {
  {ELSE} { pushOptSpaceThen(OPT_AND_EXPR); retryAs(_COMPARE_EXPR); }
}
<_COMPARE_EXPR> {
  {ELSE} { pushOptSpaceThen(OPT_COMPARE_EXPR); retryAs(_RANGE_EXPR); }
}
<_RANGE_EXPR> {
  {ELSE} { pushOptSpaceThen(OPT_RANGE_EXPR); retryAs(_ADD_EXPR); }
}
<_ADD_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_ADD_EXPR); retryAs(_MULT_EXPR); }
}
<_MULT_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_MULT_EXPR); retryAs(_UNION_EXPR); }
}
<_UNION_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_UNION_EXPR); retryAs(_INTERSECT_EXCEPT_EXPR); }
}
<_INTERSECT_EXCEPT_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_INTERSECT_OR_EXCEPT_EXPR); retryAs(_INSTANCE_OF_EXPR); }
}
<_INSTANCE_OF_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_INSTANCE_OF_EXPR); retryAs(_TREAT_AS_EXPR); }
}
<_TREAT_AS_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_TREAT_AS_EXPR); retryAs(_CASTABLE_AS_EXPR); }
}
<_CASTABLE_AS_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_CASTABLE_AS_EXPR); retryAs(_CAST_AS_EXPR); }
}
<_CAST_AS_EXPR> {
  {ELSE} {pushOptSpaceThen(OPT_CAST_AS_EXPR); retryAs(OPT_UNARY_EXPR); }
}

// the rules
<OPT_OR_EXPR> {
  "or" {optSpaceRepeat(); spaceThen(_AND_EXPR); return KW_OR;}
  {ELSE} { retry(); }
}
<OPT_AND_EXPR> {
  "and" {optSpaceRepeat(); spaceThen(_COMPARE_EXPR); return KW_AND;}
  {ELSE} { retry(); }
}
<OPT_COMPARE_EXPR> {
  "=" { optSpaceThen(_RANGE_EXPR); return OP_EQUALS; }
  "!=" { optSpaceThen(_RANGE_EXPR); return OP_NE; }
  "<" { optSpaceThen(_RANGE_EXPR); return OP_LT; }
  "<=" { optSpaceThen(_RANGE_EXPR); return OP_LE; }
  ">" { optSpaceThen(_RANGE_EXPR); return OP_GT; }
  ">=" { optSpaceThen(_RANGE_EXPR); return OP_GE; }
  "eq" { optSpaceThen(_RANGE_EXPR); return OP_KW_EQ; }
  "ne" { optSpaceThen(_RANGE_EXPR); return OP_KW_NE; }
  "lt" { optSpaceThen(_RANGE_EXPR); return OP_KW_LT; }
  "le" { optSpaceThen(_RANGE_EXPR); return OP_KW_LE; }
  "gt" { optSpaceThen(_RANGE_EXPR); return OP_KW_GT; }
  "ge" { optSpaceThen(_RANGE_EXPR); return OP_KW_GE; }
  "is" { optSpaceThen(_RANGE_EXPR); return OP_KW_IS; }
  "<<" { optSpaceThen(_RANGE_EXPR); return OP_LTLT; }
  ">>" { optSpaceThen(_RANGE_EXPR); return OP_GTGT; }

  {ELSE} { retry(); }
}
<OPT_RANGE_EXPR> {
  "to" { optSpaceThen(_ADD_EXPR); return KW_TO; }
  {ELSE} { retry(); }
}
<OPT_ADD_EXPR> {
  "+" {optSpaceRepeat(); optSpaceThen(_MULT_EXPR); return OP_PLUS;}
  "-" {optSpaceRepeat(); optSpaceThen(_MULT_EXPR); return OP_MINUS;}
  {ELSE} { retry(); }
}
<OPT_MULT_EXPR> {
  "*" {optSpaceRepeat(); optSpaceThen(_UNION_EXPR); return OP_STAR;}
  "div" {optSpaceRepeat(); optSpaceThen(_UNION_EXPR); return OP_DIV;}
  "idiv" {optSpaceRepeat(); optSpaceThen(_UNION_EXPR); return OP_IDIV;}
  "mod" {optSpaceRepeat(); optSpaceThen(_UNION_EXPR); return OP_MOD;}
  {ELSE} { retry(); }
}
<OPT_UNION_EXPR> {
  "union" {optSpaceRepeat(); optSpaceThen(_INTERSECT_EXCEPT_EXPR); return KW_UNION;}
  "|" {optSpaceRepeat(); optSpaceThen(_INTERSECT_EXCEPT_EXPR); return OP_PIPE;}
  {ELSE} { retry(); }
}
<OPT_INTERSECT_OR_EXCEPT_EXPR> {
  "intersect" {optSpaceRepeat(); optSpaceThen(_INSTANCE_OF_EXPR); return KW_INTERSECT;}
  "except" {optSpaceRepeat(); optSpaceThen(_INSTANCE_OF_EXPR); return KW_EXCEPT;}
  {ELSE} { retry(); }
}
<OPT_INSTANCE_OF_EXPR> {
  "instance" { pushOptSpaceThen(ITEM_TYPE); spaceThen(_KW_OF); return KW_INSTANCE;}
  {ELSE} { retry(); }
}
<OPT_TREAT_AS_EXPR> {
  "treat" { pushOptSpaceThen(ITEM_TYPE); spaceThen(_KW_AS); return KW_CASTABLE;}
  {ELSE} { retry(); }
}
<OPT_CASTABLE_AS_EXPR> {
  "castable" { pushOptSpaceThen(_OPT_QUESTION); pushOptSpaceThen(_QNAME); spaceThen(_KW_AS); return KW_CASTABLE; }
  {ELSE} { retry(); }
}
<OPT_CAST_AS_EXPR> {
  "cast" { pushOptSpaceThen(_OPT_QUESTION); pushOptSpaceThen(_QNAME); spaceThen(_KW_AS); return KW_CAST; }
  {ELSE} { retry(); }
}
<OPT_UNARY_EXPR> {
  "+" { optSpaceRepeat(); return OP_PLUS; }
  "-" { optSpaceRepeat(); return OP_MINUS; }
  {ELSE} { retryAs(VALUE_EXPR); }
}
<VALUE_EXPR> {
  // validate expr
  "validate" {optSpaceThen(VALIDATE_EXPR); return KW_VALIDATE; }
  // Extension expr
  "(#" {
    pushOptSpaceThen(_OPT_EXPR_LIST_IN_CURLY);
    retryAs(PRAGMA);
  }
  // path expr
  "/" {startList(STEP_EXPR, RELATIVE_PATH_EXPR); return OP_SLASH;}
  "//" {startList(STEP_EXPR, RELATIVE_PATH_EXPR); return OP_SLASHSLASH;}
  {ELSE} { undo(); startList(STEP_EXPR, RELATIVE_PATH_EXPR); }
}
<RELATIVE_PATH_EXPR> {
  "/" {optSpaceRepeat(); optSpaceThen(STEP_EXPR); return OP_SLASH;}
  "//" {optSpaceRepeat(); optSpaceThen(STEP_EXPR); return OP_SLASHSLASH;}
  {ELSE} { retry(); }
}

<VALIDATE_EXPR> {
  "lax" {optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_LAX;}
  "strict" {optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_STRICT;}
  "{" { retryAs(_EXPR_LIST_IN_CURLY); }
  {ELSE} { return BAD_CHARACTER; }
}
<PRAGMA> {
  "(#" { optSpaceRepeat(); pushState(PRAGMA_CONTENT); optSpaceThen(_QNAME); return XQ_PRAGMA_START; }
  {ELSE} { retry(); }
}
<PRAGMA_CONTENT> {
  {S} { return WHITE_SPACE; }
  [^#]|("#"[^)]) {return XQ_PRAGMA_CHAR; }
  "#)" {popState(); return XQ_PRAGMA_END; }
}
<STEP_EXPR> {
  // flattened Literals
  "\"" { pushOptSpaceThen(OPT_PREDICATE_LIST); retryAs(STRING_LITERAL); }
  "'" { pushOptSpaceThen(OPT_PREDICATE_LIST); retryAs(STRING_LITERAL); }
  {DoubleLiteral} { optSpaceThen(OPT_PREDICATE_LIST); return XQ_DOUBLE_LITERAL; }
  {DecimalLiteral} { optSpaceThen(OPT_PREDICATE_LIST); return XQ_DECIMAL_LITERAL; }
  {IntegerLiteral} { optSpaceThen(OPT_PREDICATE_LIST); return XQ_INTEGER_LITERAL; }
  // flattened VarRef
  "$" { pushOptSpaceThen(OPT_PREDICATE_LIST); retryAs(VARNAME); }
  // flattened ParenthesizedExpr
  "(" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_OR_RBRACE); return OP_LBRACE;}
  ".." { optSpaceThen(OPT_PREDICATE_LIST); return OP_DOTDOT;}
  // flattened ContextItemExpr
  "." { optSpaceThen(OPT_PREDICATE_LIST);  return OP_DOT; }
  // flattened Ordered and Unordered Expressions
  "ordered" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_ORDERED; }
  "unordered" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_UNORDERED; }

  // flattened DirectConstructor
  "<!--" { pushOptSpaceThen(OPT_PREDICATE_LIST); optXmlSpaceThen(XML_COMMENT); return TT_XML_COMMENT_START; }
  "<?" { pushOptXmlSpaceThen(XML_PI_END); yybegin(XML_PI_NAME); return TT_XML_PI_START; }
  "<" { pushOptXmlSpaceThen(XML_END_TAG); pushOptXmlSpaceThen(XML_ATTRIBUTE_EQUALS_VALUE); yybegin(XML_TAG_NAME); return TT_XML_TAG_START; }

  // flattened ComputedConstructor
  "document" {pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_DOCUMENT;}
  "element" {pushOptSpaceThen(OPT_PREDICATE_LIST); pushOptSpaceThen(_OPT_EXPR_LIST_IN_CURLY); optSpaceThen(QNAME_OR_EXPR_LIST_IN_CURLY); return KW_ELEMENT;}
  "attribute" {pushOptSpaceThen(OPT_PREDICATE_LIST); pushOptSpaceThen(_OPT_EXPR_LIST_IN_CURLY); optSpaceThen(QNAME_OR_EXPR_LIST_IN_CURLY); return KW_ATTRIBUTE;}
  "text" {pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_TEXT;}
  "comment" {pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EXPR_LIST_IN_CURLY); return KW_COMMENT;}
  "processing-instruction" {pushOptSpaceThen(OPT_PREDICATE_LIST); pushOptSpaceThen(_OPT_EXPR_LIST_IN_CURLY); optSpaceThen(NCNAME_OR_EXPR_LIST_IN_CURLY); return KW_PROCESSING_INSTRUCTION;}

  // flattened AxisStep
  "child" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_CHILD;}
  "descendant" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_DESCENDANT;}
  "attribute" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_ATTRIBUTE;}
  "self" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_SELF;}
  "descendant-or-self" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_DESCENDANT_OR_SELF;}
  "following-sibling" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_FOLLOWING_SIBLING;}
  "following" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_FOLLOWING;}
  "parent" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_CHILD;}
  "ancestor" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_DESCENDANT;}
  "preceeding-sibling" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_ATTRIBUTE;}
  "preceeding" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_SELF;}
  "ancestor-or-self" { pushOptSpaceThen(NODE_TEST); optSpaceThen(_COLONCOLON); return KW_DESCENDANT_OR_SELF;}

  // flattened FunctionCall
  {QName}/({S})?"(" { pushOptSpaceThen(OPT_PREDICATE_LIST);  pushOptSpaceThen(_OPT_EXPR_LIST_IN_BRACE); retryAs(_QNAME); }
  // the @ is optional so we need to test here for the rest
  "@" { pushOptSpaceThen(OPT_PREDICATE_LIST); yybegin(NODE_TEST); return OP_AT;}
}
<OPT_PREDICATE_LIST> {
  "[" {optSpaceRepeat(); pushOptSpaceThen(_RSQUARE); startList(EXPR_SINGLE, EXPR_REPEATER); return OP_LSQUARE; }
  {ELSE} { retry(); }
}

<NODE_TEST, STEP_EXPR> {
  "*" {pushOptSpaceThen(OPT_PREDICATE_LIST); popState(); return OP_STAR;}
//  "void" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EMPTY_BRACES); return KW_VOID;}

  "document-node" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, DOCUMENT_TEST, _RBRACE); return KW_DOCUMENT_NODE;}
  "element" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, ELEMENT_TEST, _RBRACE); return KW_ELEMENT;}
  "attribute" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, ATTRIBUTE_TEST, _RBRACE); return KW_ATTRIBUTE;}
  "schema-element" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, _QNAME, _RBRACE); return KW_SCHEMA_ELEMENT;}
  "schema-attribute" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, _QNAME, _RBRACE); return KW_SCHEMA_ATTRIBUTE;}
  "processing-instruction" { pushOptSpaceThen(OPT_PREDICATE_LIST); surround(_LBRACE, OPT_STR_OR_NCNAME, _RBRACE); return KW_PROCESSING_INSTRUCTION;}
  "comment" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EMPTY_BRACES); return KW_COMMENT;}
  "text" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EMPTY_BRACES); return KW_TEXT;}
  "node" { pushOptSpaceThen(OPT_PREDICATE_LIST); optSpaceThen(_EMPTY_BRACES); return KW_NODE;}

  {WildcardQName} { pushOptSpaceThen(OPT_PREDICATE_LIST); retryAs(_WILDCARD_QNAME); }
}
<NODE_TEST> {ELSE} { return BAD_CHARACTER; }
<STEP_EXPR> {ELSE} { retry(); }




// ---------------------------------------------------------------------------------------------------------------------
//
// Expressions
//
// ---------------------------------------------------------------------------------------------------------------------

// xml processing instructions: <?name some text ?>
<XML_PI_NAME> {
  "xml" {xmlSpaceThen(XML_ATTRIBUTE_EQUALS_VALUE); return TT_XML_PI_NAME;}
  {XmlName} {optXmlSpaceThen(XML_PI_CONTENT); return TT_XML_PI_NAME;}
}
<XML_PI_CONTENT, XML_PI_NAME> "?>" { retry(); }
<XML_PI_NAME> {ELSE} {return BAD_CHARACTER;}
<XML_PI_CONTENT> {
  {S} { return WHITE_SPACE; }
  {ELSE} { return TT_XML_PI_CHAR; }
}

// xml attribute list
<XML_ATTRIBUTE_EQUALS_VALUE> {
  {QName} { optXmlSpaceRepeat(); pushOptXmlSpaceThen(XML_ATTR_VALUE); pushOptXmlSpaceThen(_EQUALS); retryAs(_QNAME); }
  {ELSE} { retry(); }
}
<XML_TAG_NAME> {
  {QName} { retryAs(_QNAME); }
  {ELSE} { return BAD_CHARACTER; }
}
<XML_END_TAG> {
  "/>" { popState(); return TT_XML_EMPTYTAG_END; }
  ">" {pushOptXmlSpaceThen(XML_START_CLOSE_TAG); optXmlSpaceThen(XML_ELEMENT_CONTENT); return TT_XML_TAG_END; }
  {ELSE} {return BAD_CHARACTER;}
}
<XML_START_CLOSE_TAG> {
  "</" { pushOptXmlSpaceThen(_CLOSE_TAG); yybegin(_QNAME); return TT_XML_CLOSETAG_START; }
  {ELSE} {return BAD_CHARACTER;}
}
<XML_ELEMENT_CONTENT> {
  // note, wherever this is used it always repeats
  // flattened DirElemConstructor
  "<!--" { optXmlSpaceRepeat(); yybegin(XML_COMMENT); return TT_XML_COMMENT_START; }
  "<?" { optXmlSpaceRepeat(); pushState(XML_PI_END); yybegin(XML_PI_NAME); return TT_XML_PI_START; }
  "<![CDATA[" { optXmlSpaceRepeat(); yybegin(XML_CDATA_CONTENT); return TT_XML_CDATA_START; }
  // this is used to escape to the outer element
  "</" { retry(); }
  "<" { optXmlSpaceRepeat(); pushOptXmlSpaceThen(XML_END_TAG); pushOptXmlSpaceThen(XML_ATTRIBUTE_EQUALS_VALUE); yybegin(XML_TAG_NAME); return TT_XML_TAG_START; }
  [^\{\}\<\&]+ { return TT_XML_ELEMENT_CHAR; }
  {ELSE} {optXmlSpaceRepeat(); retryAs(XML_STR_COMMON_CONTENT);}
}
<XML_CDATA_CONTENT> {
  [^\]]|("]"[^\]])|("]]"[^\>]) {return TT_XML_CDATA_CHAR;}
  "]]>" {popState(); return TT_XML_CDATA_END; }
}
<XML_ATTR_VALUE> {
  "\"" { yybegin(_XML_STR_START_QUOTE); return TT_XML_STR_START; }
  "'" {yybegin(_XML_STR_START_APOS); return TT_XML_STR_START; }
  {ELSE} {return BAD_CHARACTER; }
}

// common formats
<_COLONCOLON> {
  "::" {popState(); return OP_COLONCOLON; }
  {ELSE} { return BAD_CHARACTER; }
}
<_EQUALS> {
  "=" {popState(); return OP_EQUALS; }
  {ELSE} {return BAD_CHARACTER; }
}
<_SEMI> {
  ";" {popState(); return OP_SEPERATOR; }
  {ELSE} { return BAD_CHARACTER; }
}
<_OPT_QUESTION> {
  "?" { popState(); return OP_QUESTION; }
  {ELSE} { retry(); }
}
<_KW_AS> {
  "as" {popState(); return KW_AS;}
  {ELSE} { return BAD_CHARACTER; }
}
<_KW_OF> {
  "of" {popState(); return KW_OF;}
  {ELSE} { return BAD_CHARACTER; }
}

// braces ()
<_LBRACE> {
  "(" {popState(); return OP_LBRACE; }
  {ELSE} { return BAD_CHARACTER; }
}
<_RBRACE> {
  ")" {popState(); return OP_RBRACE; }
  {ELSE} { return BAD_CHARACTER; }
}
<_EMPTY_BRACES> {
  "(" {optSpaceThen(_RBRACE); return OP_LBRACE;}
  {ELSE} {return BAD_CHARACTER; }
}
<_EXPR_LIST_IN_BRACE> {
  "(" {pushOptSpaceThen(_RBRACE); startList(EXPR_SINGLE, EXPR_REPEATER);  return OP_LBRACE;}
  {ELSE} {return BAD_CHARACTER; }
}
<_OPT_EXPR_LIST_IN_BRACE> {
  "(" {yybegin(_EXPR_LIST_OR_RBRACE); return OP_LBRACE;}
  {ELSE} {return BAD_CHARACTER; }
}
<_EXPR_LIST_OR_RBRACE> {
  ")" {popState(); return OP_RBRACE;}
  {ELSE} {undo(); pushState(_RBRACE); startList(EXPR_SINGLE, EXPR_REPEATER); }
}

// curly braces {}
<_LCURLY> {
  "{" {popState(); return OP_LCURLY;}
  {ELSE} { return BAD_CHARACTER; }
}
<_RCURLY> {
  "}" {popState(); return OP_RCURLY; }
  {ELSE} { return BAD_CHARACTER; }
}
<_EXPR_LIST_IN_CURLY> {
  "{" {pushOptSpaceThen(_RCURLY); startList(EXPR_SINGLE, EXPR_REPEATER); return OP_LCURLY; }
  {ELSE} {return BAD_CHARACTER; }
}
<_OPT_EXPR_LIST_IN_CURLY> {
  "{" { optSpaceThen(_EXPR_LIST_OR_RCURLY); return OP_LCURLY;}
  {ELSE} {return BAD_CHARACTER; }
}
<_EXPR_LIST_OR_RCURLY> {
  "}" {popState(); return OP_RCURLY; }
  {ELSE} {undo(); pushState(_RCURLY); startList(EXPR_SINGLE, EXPR_REPEATER); }
}


<_RSQUARE> {
  "]" {popState(); return OP_RSQUARE; }
  {ELSE} { return BAD_CHARACTER; }
}
<XML_PI_END> {
  "?>" {popState(); return TT_XML_PI_END; }
  {ELSE} {return BAD_CHARACTER;}
}
<_CLOSE_TAG> {
  ">" {popState(); return TT_XML_TAG_END; }
  {ELSE} {return BAD_CHARACTER; }
}

// ("preserve" | "strip") ";"
<PRESERVE_OR_STRIP> {
  "preserve" {popState(); return KW_PRESERVE; }
  "strip" {popState(); return KW_STRIP; }
  {ELSE} { return BAD_CHARACTER; }
}

<QNAME_OR_EXPR_LIST_IN_CURLY> {
  "{" {retryAs(_EXPR_LIST_IN_CURLY); }
  {QName} {retryAs(_QNAME); }
  {ELSE} {return BAD_CHARACTER; }
}

<NCNAME_OR_EXPR_LIST_IN_CURLY> {
  "{" {retryAs(_EXPR_LIST_IN_CURLY); }
  {NCName} {retryAs(_NCNAME); }
  {ELSE} {return BAD_CHARACTER; }
}

<_QNAME> {
  {Prefix} / ":" { yybegin(_QNAME_); return XQ_PREFIX_NAME; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  {ELSE} {return BAD_CHARACTER; }
}
<_QNAME_> {
  ":" {yybegin(_QNAME_LOCAL); return OP_COLON; }
  {ELSE} { return BAD_CHARACTER; }
}
<_QNAME_LOCAL> {
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  {ELSE} {return BAD_CHARACTER; }
}
<_WILDCARD_QNAME> {
  "*" / ":" {yybegin(_QNAME_); return OP_STAR; }
  {Prefix} / ":" { yybegin(_WILDCARD_QNAME_); return XQ_PREFIX_NAME; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  {ELSE} {return BAD_CHARACTER; }
}
<_WILDCARD_QNAME_> {
  ":" {yybegin(_WILDCARD_QNAME_LOCAL); return OP_COLON; }
  {ELSE} {return BAD_CHARACTER; }
}
<_WILDCARD_QNAME_LOCAL> {
  "*" {popState(); return OP_STAR; }
  {LocalPart} {popState(); return XQ_LOCAL_NAME; }
  {ELSE} {return BAD_CHARACTER; }
}

<_NCNAME> {
  {NCName} {popState(); return XQ_NCNAME; }
  {ELSE} {return BAD_CHARACTER; }
}


<STRING_LITERAL,URI_LITERAL> {
  "\"" { yybegin(STR_START_QUOTE); return XQ_STR_START; }
  "'" {yybegin(STR_START_APOS); return XQ_STR_START; }
  {ELSE} { return BAD_CHARACTER; }
}

<STR_START_QUOTE> {
  "\"\"" { return XQ_STR_ESCAPE_QUOTE; }
  "\"" { popState(); return XQ_STR_END; }
  [^\"\&]+ { return XQ_STR_CHAR; }
  {ELSE} { pushState(); retryAs(_STR_COMMON_CONTENT); }
}
<STR_START_APOS> {
  "''" { return XQ_STR_ESCAPE_APOS; }
  "'" { popState(); return XQ_STR_END; }
  [^\'\&]+ { return XQ_STR_CHAR; }
  {ELSE} { pushState(); retryAs(_STR_COMMON_CONTENT); }
}
<_STR_COMMON_CONTENT> {
  {CharRef} {popState(); return XQ_STR_CHAR_REF; }
  {PredefinedEntityRef} {popState(); return XQ_STR_ENT_REF;}
  {ELSE} {return BAD_CHARACTER; }
}
<_XML_STR_START_QUOTE> {
  "\"\"" { return TT_XML_STR_ESCAPE_QUOTE; }
  "\"" { popState(); return TT_XML_STR_END; }
  [^\"\{\}\<\&]+ { return TT_XML_STR_CHAR; }
  {ELSE} { pushState(); retryAs(XML_STR_COMMON_CONTENT); }
}
<_XML_STR_START_APOS> {
  "''" { return TT_XML_STR_ESCAPE_APOS; }
  "'" { popState(); return TT_XML_STR_END; }
  [^\'\{\}\<\&]+ { return TT_XML_STR_CHAR; }
  {ELSE} {  pushState(); retryAs(XML_STR_COMMON_CONTENT); }
}
<XML_STR_COMMON_CONTENT> {
  {CharRef} {popState(); return TT_XML_STR_CHAR_REF; }
  {PredefinedEntityRef} {popState(); return TT_XML_STR_ENT_REF; }
  "{{" {popState(); return OP_LCURLYCURLY; }
  "}}" {popState(); return OP_RCURLYCURLY; }
  "{" {retryAs(_EXPR_LIST_IN_CURLY); }
  {ELSE} {return BAD_CHARACTER; }
}

// ("at" URILiteral ("," URILiteral)*)?
<OPT_AT_THEN_URI_LIST> {
  "at" { pushOptSpaceThen(OPT_COMMA_THEN_URI_LIST); spaceThen(URI_LITERAL); return KW_AT;}
  {ELSE} {retry();}
}
<OPT_COMMA_THEN_URI_LIST> {
  "," {optSpaceRepeat(); optSpaceThen(URI_LITERAL); return OP_COMMA;}
  {ELSE} { retry(); }
}

// "$" QNAME
<VARNAME> {
  "$" {yybegin(_QNAME); return OP_VARSTART; }
  {ELSE} { return BAD_CHARACTER; }
}
<OPT_VARNAME> {
  "$" {retryAs(VARNAME); }
  {ELSE} { retry(); }
}

<XQ_COMMENT> {
  ":)" { popState(); return XQ_COMMENT_END; }
  "(:" { pushState(); return XQ_COMMENT_START; }
  {ELSE} { return XQ_COMMENT_CHAR; }
}
<XML_COMMENT> {
  "-->" {popState(); return TT_XML_COMMENT_END;}
  ([^\-]|(-[^\-]))+ {return TT_XML_COMMENT_CHAR; }
  {ELSE} { return BAD_CHARACTER; }
}

<_COMMA> {
  "," {popState(); return OP_COMMA;}
  {ELSE} {return BAD_CHARACTER; }
}

<_OPT_WORD_SEP> {
  "(:" { pushState(); yybegin(XQ_COMMENT); return XQ_COMMENT_START; }
  {S} { return WHITE_SPACE; }
  {ELSE} { retry(); }
}
<_WORD_SEP> {
  "(:" { pushState(_OPT_WORD_SEP); yybegin(XQ_COMMENT); return XQ_COMMENT_START; }
  {S} { yybegin(_OPT_WORD_SEP); return WHITE_SPACE; }
  {ELSE} { popState(); return BAD_CHARACTER; }
}

<_XML_OPT_WORD_SEP> {
  {S} { return WHITE_SPACE; }
  {ELSE} { retry(); }
}
<_XML_WORD_SEP> {
  {S} { yybegin(_XML_OPT_WORD_SEP); return WHITE_SPACE; }
  {ELSE} { popState(); return BAD_CHARACTER; }
}

// This should never be picked up but we leave it here just in case
[^] { return BAD_CHARACTER2; }
