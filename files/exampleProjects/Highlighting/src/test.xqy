(: simple file for testing xquery syntax :)
(: this is (: a nested :) comment :)

xquery version "1.0-ml" encoding "UTF-8";

module namespace lib = "my.module";

import schema namespace lib = "my.module";
import schema namespace lib = "my.module"
    at "/home/lib.xqy",
       "/home2/lib.xq";
import schema default element namespace "my.module";
import schema default element namespace "my.module" at "/home/lib.xqy";

import module namespace my = "ns.declr" at "/some/path", "other path";

declare option my:declare "some value";
declare option option "";
declare option local:option "";
declare option option:option "declare option option:option";

declare ordering unordered;
declare ordering ordered;

declare boundary-space preserve;
declare boundary-space strip;

declare namespace my = "http://example.com";
declare base-uri "http://my.base-uri.com/";

declare copy-namespaces preserve , inherit;
declare copy-namespaces no-preserve , inherit;
declare copy-namespaces preserve , no-inherit;
declare copy-namespaces no-preserve , no-inherit;

declare construction preserve;
declare construction strip;

declare default collation "http://my.collation";
declare default order empty greatest;
declare default order empty least;

declare default function namespace "http://function.com/";
declare default element namespace "http://function.com/";

declare variable $var external;
declare variable $var :=
    for $var in ""
    for $other in ""
    return "";
declare variable $var :=
    let $var := ""
    return $var;
declare variable $var :=
    let $var :=
        let $var := ""
        return ""
    for $var in ""
    stable order by $var
    return "";
declare variable $var :=
    let $var as node() :=
        for $var as node() at $var in ""
        return ""
    let $var2 := 7
    return "&#333; some other string &apos;";
declare variable $var :=
    for $var in ""
    stable order by $var
    return $var;
declare variable $var as node() := 2222.2e2122;
declare variable $var as node() external ;
declare variable $var as item() external ;
declare variable $var as item()* external ;
declare variable $var as node()? external ;
declare variable $var as text()+ external ;
declare variable $var as comment() external ;

(: These are complex attributed tests :)
declare variable $var as document-node() external ;
declare variable $var as document-node(element()) external ;
declare variable $var as document-node(element(hello)) external ;
declare variable $var as document-node(element(hello:local)) external ;
declare variable $var as document-node(element(*)) external ;
declare variable $var as document-node(element(*, something?)) external ;
declare variable $var as document-node(schema-element(hello)) external ;
declare variable $var as document-node(schema-element(hello:hello)) external ;

declare variable $var as processing-instruction() external ;
declare variable $var as processing-instruction("") external ;
declare variable $var as processing-instruction(myName) external ;

declare variable $var as attribute() external ;
declare variable $var as attribute(hello) external ;
declare variable $var as attribute(hello:local) external ;
declare variable $var as attribute(*) external ;
declare variable $var as attribute(hello, prefix) external ;
declare variable $var as attribute(hello, prefix:local) external ;

declare variable $var as schema-attribute(hello) external ;
declare variable $var as schema-attribute(hello:local) external ;

declare variable $var as element() external ;
declare variable $var as element(hello) external ;
declare variable $var as element(hello:local) external ;
declare variable $var as element(*) external ;
declare variable $var as element(hello, prefix) external ;
declare variable $var as element(hello, prefix:local?) external ;

declare variable $var as schema-element(hello) external ;
declare variable $var as schema-element(hello:local) external ;

declare variable $var as my:something external ;
declare variable $var as prefixless external ;

declare variable $var :=
    if (12) then "true" else "false";
declare variable $var :=
    if (12, "", $var) then "true" else "false";

declare variable $var :=
    some $var as node()
        in $var
        satisfies $var ;
declare variable $var :=
    every $var as node()
        in $var
        satisfies $var ;

declare variable $var :=
    typeswitch($var)
        case $var as node() return ""
        case node() return ""
        case my:something return ""
        default return "";

declare variable $var := -+2[""][2];
declare variable $var := validate {2};
declare variable $var := validate lax {2};
declare variable $var := validate strict {2};
declare variable $var := .;
declare variable $var := ..;
declare variable $var := ("hello");

declare variable $var := $local:dun;
declare variable $var := child::node();
declare variable $var := self::comment()[0];


declare variable $xmlComment := <!-- my xml comment-d -->;
declare variable $xmlComment := <a><![CDATA[ my xml comment-d ]]></a>;
declare variable $xmlProcessingInstruction := <?name this shows no processing is done here (::) for{2} ?>;
declare variable $xmlProcessingInstruction :=
    <?xml version="my&#333;hello &#x12abDE; &lt;" encoding="UTF-{
            if ($var) then $var else $var
         } continue the string" ?>;
declare variable $xml := <node> </node>;
declare variable $xml :=
    <my:node attr = "value" code = "{$var}">
        <node my="{self::text()}">text</node>
        Hello, World
        {"embedded expression"}
        <![CDATA[ some content ]]>
    </my:node>;
declare variable $name := "Bobby Brown";
declare variable $helloWorld := <my:node val="Hello, {$name}!">How are you</node>;

(: ComputedConstructors :)
declare variable $document := document {"hello comment"};
declare variable $element := element {<node />} {"Hello world"};
declare variable $element := element my:node {"Hello world"};
declare variable $attribute := attribute my:attr {"hello comment"};
declare variable $attribute := attribute {2} {"hello comment"};
declare variable $text := text{"hello comment"};
declare variable $comment := comment{"hello comment"};
declare variable $pi := processing-instruction hello{"hello comment"};
declare variable $pi := processing-instruction {"hello"} {"hello comment"};

declare variable $pragma := (#some pragma content #) {};
declare variable $pragma := (#some pragma content #) {};
declare variable $pragma := (#q:name pragma content #) (# more pragma #) {};

declare variable $expr := "hello" cast as my:type;
declare variable $expr := "hello" cast as my:type?;
declare variable $expr := "hello" cast as my:type? castable as type?;
declare variable $expr := "hello" cast as my:type castable as type treat as node() instance of node();
declare variable $expr := "hello" castable as my:type;
declare variable $expr := "hello" castable as my:type?;
declare variable $expr := "hello" treat as my:type;
declare variable $expr := "hello" instance of my:type;
declare variable $expr := "hello" intersect "hello";
declare variable $expr := "hello" | "hello";
declare variable $expr := "hello" union "hello" except "" cast as type;
declare variable $expr := "hello" * 2 ;
declare variable $expr := "hello" div 2 ;
declare variable $expr := "hello" idiv 2 ;
declare variable $expr := "hello" mod 2 ;
declare variable $expr := "hello" * 2 union "hello" except "" cast as type;
declare variable $expr := "hello" - "lo" + 7;
declare variable $expr := "hello" + 7 * 2 union "hello" except "" cast as type;
declare variable $expr := "hello" to 9;
declare variable $expr := "hello" to 8 + 7 - 1 * 2 union "hello" except "" cast as type;
declare variable $expr := "hello" = 3;
declare variable $expr := "hello" != 3;
declare variable $expr := "hello" < 3;
declare variable $expr := "hello" > 3;
declare variable $expr := "hello" <= 3;
declare variable $expr := "hello" >= 3;
declare variable $expr := "hello" eq 3;
declare variable $expr := "hello" ne 3;
declare variable $expr := "hello" lt 3;
declare variable $expr := "hello" le 3;
declare variable $expr := "hello" gt 3;
declare variable $expr := "hello" ge 3;
declare variable $expr := "hello" is 3;
declare variable $expr := "hello" >> 3;
declare variable $expr := "hello" << 3;
declare variable $expr := "hello" eq 3 to 8 + 7 - 1 * 2 union "hello" except "" cast as type;
declare variable $expr := "hello" and "me";
declare variable $expr := "hello" and "me" eq 3 to 8 + 7 - 1 * 2 union "hello" except "" cast as type;
declare variable $expr := "hello" or "him";
declare variable $expr := "hello" or "him" and "me" eq 3 to 8 + 7 - 1 * 2 union "hello" except "" cast as type;

declare variable $attr := @myAttr;
declare variable $xpath := <node/>//me:elem/@attr;

12.2e2234,
"hello",
<html>(::)</html>
(: comment :),
$helloWorld
