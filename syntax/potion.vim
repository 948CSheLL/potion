" 类似于c 里面的#ifndef #define 这种
if exists("b:current_syntax")
    " finish 可以结束接下来vim 脚本的执行
    finish
endif

syntax keyword potionKeyword to times
highlight link potionKeyword Keyword

let b:current_syntax = "potion"
