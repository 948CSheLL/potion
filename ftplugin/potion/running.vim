if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    " Get the bytecode.
    " 将system执行的shell 命令的结果存放在变量bytecode 中
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
    " Open a new split and set it up.
    vsplit __Potion_Bytecode__
    sleep 5
    normal! ggdG
    setlocal filetype=potionbytecode
    " 将buftype 赋值成nofile 表明执行该语句的缓冲区与
    " 磁盘中的文件无关，不会被写入
    setlocal buftype=nofile
    " Insert the bytecode.
    " append 函数第一个参数是行号，第二个参数是一个列表，
    " 作用是在当前缓冲区对应行号处插入列表中的内容
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>

nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
