; extends
; Show execute ecto function quoted_content as sql
(call
 target: ((identifier) @_identifier (#any-of? @_identifier "execute"))
 (arguments
   (string
     (quoted_content) @sql))) 
