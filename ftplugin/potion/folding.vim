" setlocal foldmethod=indent
" " foldignore 选项采用默认值（#）与等于空值（如下），
" " 以#开头的代码语句的缩进是不一样的。可以拿代注释的
" " python 代码测试一下。
" setlocal foldignore=

setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! NextNonBlankLine(lnum)
    " 获得缓冲区总行数
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        " 判断当前行是不是非空白行
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
      " 字符串-1 表示undefine，foldlevel为上下行最小的那个。
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
	" >num 字符串是一个特殊字符串，表示需要展开level 为num 的折叠 
        return '>' . next_indent
    endif
endfunction
