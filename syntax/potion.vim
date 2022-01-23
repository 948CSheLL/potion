" 类似于c 里面的#ifndef #define 这种
if exists("b:current_syntax")
    " finish 可以结束接下来vim 脚本的执行
    finish
endif

" 将需要被高亮的关键字加入到相关组中，比如
" 下面的三行代码是将关键字添加到组potionKeyword
" 中，如果对一个组执行多次加组语句syntax
" keyword，不会将之前入组的覆盖，而是附加。
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
" 将组potionKeyword中的关键字按照Keyword的配色方案
" 显示。
highlight link potionKeyword Keyword

syntax keyword potionFunction print join string
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v\="
highlight link potionOperator Operator

syntax match potionNumber "\v0[xX][0-9]+"
syntax match potionNumber "\v[+-]*[1-9]*[0-9]+"
syntax match potionNumber "\v[+-]*[1-9]*[0-9]+e[+-]*[0-9]+"
syntax match potionNumber "\v[+-]*[0-9]+\.[0-9]+"
syntax match potionNumber "\v[+-]*[0-9]+\.[0-9]+e[+-]*[0-9]+"
highlight link potionNumber Number

let b:current_syntax = "potion"
