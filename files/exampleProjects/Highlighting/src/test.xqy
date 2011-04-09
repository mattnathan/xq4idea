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
declare variable $var := ;
declare variable $var as void() := ;
declare variable $var as void() external ;
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

12.2e2234

some other text
