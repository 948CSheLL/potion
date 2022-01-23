" 类似于c 里面的#ifndef #define 这种
if exists("b:current_syntax")
    " finish 可以结束接下来vim 脚本的执行
    finish
endif

" 将需要被高亮的关键字加入到相关组中
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

highlight link potionKeyword Keyword

let b:current_syntax = "potion"
