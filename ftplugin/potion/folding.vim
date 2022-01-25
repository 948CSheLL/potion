" setlocal foldmethod=indent
" " foldignore 选项采用默认值（#）与等于空值（如下），
" " 以#开头的代码语句的缩进是不一样的。可以拿代注释的
" " python 代码测试一下。
" setlocal foldignore=

setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! GetPotionFold(lnum)
    return '0'
endfunction
