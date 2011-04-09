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

12.2e2234

some other text
