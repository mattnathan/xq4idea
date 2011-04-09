(: simple file for testing xquery syntax :)
(: this is (: a nested :) comment :)

xquery version "1.0-ml" encoding "UTF-8";

declare option my:declare "some value";
declare option option "";
declare option local:option "";
declare option option:option "";

declare ordering unordered;
declare ordering ordered;

declare boundary-space preserve;
declare boundary-space strip;

declare namespace my = "http://example.com";
declare base-uri "http://my.base-uri.com/";

12.2e2234

some other text
