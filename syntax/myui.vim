" Vim syntax file
" Language: Fake myUI syntax
" Maintainer: Jack Garner
" Latest Revision: today

if exists("b:current_syntax")
  finish
endif

" syn keyword Keyword display
"
syntax match type /[A-Z]\w*/
syntax match variable /[a-z]\w*/


syntax match displayBlock  /^\s*[A-Z]\w* display as/ contains=type
syntax match interactBlock  /^\s*\w\+ interact as$/ contains=type
syntax match equalBlock  /^\w\+ = .\+$/ contains=type,variable
syntax match orBlock  /^\s*| .\+$/ contains=type,variable
syntax match escaped /\$[a-z]\w*/ contained
syntax match comment /#.*/
syntax match flag /-\w\+/
syntax region string start=/"/ end=/"/ contains=escaped
syntax region bigComment start=/###/ end=/###/

highlight link displayBlock Label
highlight link interactBlock Label
highlight link type Type
highlight link comment Comment
highlight link variable Identifier
highlight link escaped Identifier
highlight link flag Operator
highlight link string String
highlight link bigComment Comment
" syntax keyword basicLanguageKeywords as
" highlight FooKey   ctermfg=red guifg=#ff0000
" highlight FooValue ctermfg=red  guifg=#ff0000

" syntax sync ccomment bigComment
syntax sync fromstart

let b:current_syntax = "myui"

