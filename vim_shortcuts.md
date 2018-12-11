VIM操作快捷键总结
====
VIM里面操作指令很多，自带的和插件提供的还会有重叠的功能。
下面是经过本人实践，认为最有必要掌握和最适合自己的操作方式。

### 光标移动

[1] 在程序里面，为了精准定位，多用`vim-easymotion`, 可以一次移动到想要的地方。 [2] 在文档里面，尤其有中文较多的时候，比较多用传统移动方式。
[3] **移动原则**：尽量少输入数字和键盘位置偏僻的特殊字符。

    h:          左移一个字符
    l:          右移一个字符
    j:          下移一行
    k:          上移一行
    w:          到下一个单词开头，光标停在下一个单词开头
    W:          到下一个单词开头，但忽略一些标点
    e:          到下一个单词末，光标停在下一个单词末尾
    E:          到下一个单词末，如果词尾有标点，则移动到标点
    b:          到上一个单词开头，光标停在上一个单词开头
    B:          到上一个单词开头，忽略一些标点
    nG:         到文件第n行
    H:          到屏幕最顶端一行
    M:          到屏幕中间一行
    L:          到屏幕最底端一行
    gg:         到文件头部
    G:          到文件尾部

### 翻屏

    <C+f>:      下翻一屏
    <C+b>:      上翻一屏
    <C+d>:      下翻半屏
    <C+u>:      上翻半屏
    <C+e>:      向下滚动一行
    <C+y>:      向上滚动一行
    zz:         将当前行移动到屏幕中央
    zt:         将当前行移动到屏幕顶端
    zb:         将当前行移动到屏幕底端


### 标记

 使用标记可以在文件内和文件之间快速移动。Ctrl+o和Ctrl+i 后退和前进。
 因为常常需要更新.vimrc文件的插件，所以在该文件的插件行标记mS。这样在其他文件编辑时候，不需要退出，直接goS。就可以跳转到.vimrc文件的插件行。然后用Ctrl+o返回。


    m{a-z}:     标记光标所在位置，局部标记，只用于当前文件
    m{A-Z}:     标记光标所在位置，全局标记。标记之后，退出Vim， 重新启动，标记仍然有效
    go{a-z}:    移动到标记位置
    go.:        移动到最后改动的地方
    :marks      显示所有标记
    :delm ABC   删除标记A B C

### 插入操作

    i:          在光标前插入
    I:          在当前行第一个非空字符前插入
    a:          在光标后插入
    A:          在当前行最后插入
    o:          在当前行下面新建一行插入
    O:          在当前行上面新建一行插入
    :r fn       在当前行的下一行位置插入另一个文件的内容
    :r !cmd     将shell命令的输出插入当前行的下一行

### 复制

    y:          复制在可视模式下选中的文本
    yy:         复制整行文本
    yaw:        复制一个单词
    y<Leader>f<sth>:    搭配easy motion，可以复制从当前光标起向后到任意位置的内容
    y<Leader>F<sth>:    搭配easy motion，可以复制从当前光标起向前到任意位置的内容


### 剪切/删除

    x:          剪切光标当前字符
    X:          剪切光标左边1个字符
    D:          删除（剪切）当前位置到行尾的内容
    dw:         删除（剪切）1个单
    d0:         删除（剪切）当前位置到行首的内
    dd:         删除（剪切）1行
    dgg:        剪切光标以上的所有行
    dG:         剪切光标以下的所有行
    daw：       剪切一个单词，即使光标不在词首
    d<Leader>f<sth>:    搭配easy motion，可以剪切从当前光标起向后到任意位置的内容
    d<Leader>F<sth>:    搭配easy motion，可以剪切从当前光标起向前到任意位置的内容

### 粘贴

    p:          在光标之后粘贴
    P:          在光标之前粘贴

### 修改插入

    cw:     从当前光标起到一个单词结束，修改内容，不包括单词之间的分隔符
    caw:    修改整个单词内容，不管当前光标在该单词的什么位置
    cc:     修改正行内容
    c<Leader>f<sth>:    搭配easy motion，可以修改从当前光标起向后到任意位置的内容
    c<Leader>F<sth>:    搭配easy motion，可以修改从当前光标起向前到任意位置的内容

### 查找

    /sth:       从光标往后找
    ?sth:       从光标往前找
    n:          向后查找下一个
    N:          向前查找下一个

### 替换

    :s/old/new          用new替换当前行第一个old。
    :s/old/new/g        用new替换当前行所有的old。
    :n1,n2s/old/new/g   用new替换文件n1行到n2行所有的old。
    :%s/old/new/g       用new替换文件中所有的old。
    :%s/^/xxx/g         在每一行的行首插入xxx，^表示行首。

### 字母大小写

    gu + motion:        小写
    gU + motion:        大写
    gu<Leader>f<sth>:   搭配easy motion, 可以将从光标起向后倒任意位置的内容改为小写
    gU<Leader>F<sth>:   搭配easy motion，可以将从光标起向前倒任意位置的内容改为大写

### 撤销与重做

    u:          撤销上次操作
    U:          行恢复到文件打开时的状态
    <C+r>:      重做最后的改动

### 替换

    r:          替换掉光标所在字符
    R:          进入替换模式

### 分屏操作
最多的是分隔两个shell. `<cmd+d>`左右分隔, `<S+cmd+d>`上下分隔

    <C-w>s      水平分隔为上下两个窗口
    <C-w>v      垂直分隔为左右两个窗口
    nw          切换窗口，映射了原有的命令

### 宏

    qa:         开始录制宏a（键盘操作记录）
    q:          停止录制
    @a:         播放宏a

### 加密解密
.vimrc 文件设置set cm=blowfish2  采用blowfish2加密

    :X          在打开文件中加密
    vim -x fn   新建或打开文件之前加密
    :set key=   打开文件中取消密码

### VIM:Motion

    va/vi + "], >, ), }"  选中括号中内容
    da/di + "], >, ), }"  删除括号中内容
    ca/ci + "], >, ), }"  修改括号中内容
    ya/yi + "], >, ), }"  复制括号中内容

    如果只是要操作括号中内容，可以通过插件<SPACE>选中括号中内容，然后+"d, c, y"。直观，不会出错。。直观，不会出错。
    "v, d, c, y" + "`$`,0, t, f, T, F"
    实践中，先选中相应的内容，再做修改删除复制操作，比较直观，也不会出错。
    visual mode后，可以按键o, 切换选中文本首尾。visual line mode不可以。

### 常规编程

    gd:         跳转到局部变量的定义处

### Fold代码折叠

    zk:         跳转到上一个代码折叠区
    zj:         跳转到下一个代码折叠区
    zo:         展开一个折叠
    zO:         展开所有折叠
    zc:         关闭折叠
    zC:         关闭所有折叠
    za:         Toggle折叠区
    zM:         折叠所有
    zR:         展开所有

### VIM的7个基本模式

    Normal Mode     普通模式。默认进入vim之后，处于这种模式。 
    Visual Mode     可视模式。普通模式下, 按v进入字符选择， <S+v>进入行选择，<C+v>进入block选择。
    Select Mode     选择模式。普通模式下，gh进入字符选择，gH进入行选择, g<C+h>进入block选择。和visual mode操作类似, 不过select mode需要用方向键选择，实用性不如visual mode。进入visual mode后选定内容后按c也能实现一样的功能.
    Insert Mode     插入模式，其实就是指处在编辑输入的状态。
    Ex Mode         普通模式下按Q进入Ex模式，其实就是多行的Command-Line模式。
    Command-Line    普通模式下按冒号(:)进入Command-Line模式，可以输入各种命令。如执行命令（:键），搜索（/和?键）或者过滤命令（!键）。例如:!ls，不用退出vim直接查看ls。:r !ls, 把结果放入当前位置
    Terminal-Job mode

### VIM的7个附加模式

    Operator-pending mode
    Replace mode
    Virtual Replace mode
    Insert Normal mode
    Terminal-Normal mod
    Insert Visual mode
    Insert Select mode

### MAP映射模式

    (n)         普通模式: 输入命令时。
    (v)         可视和选择模式：
    (o)         操作符等待模式: 操作符等待中 ("d"，"y"，"c", "gu", "gU"等等之后)。
    (i)         插入模式: 也用于替换模式。
    (c)         命令行模式: 输入 ":" 或 "/" 命令时。
    (s)         选择模式: 类似于可视模式，但键入的字符对选择区进行替换。
    (x)         可视模式: 可视区域高亮并输入命令时。
    (l)         langmap |language-mapping|
    (t)         Terminal-Job
    (")         normal, Visual and Operator-pending

### Plugin: tagbar

    <CR>:       跳转到tag定义处
    p:          跳转到tag定义处，但是光标停留在tag window
    zk:         跳转到上一个代码折叠区
    zj:         跳转到下一个代码折叠区
    zo:         打开折叠区
    zc:         关闭折叠区
    za:         Toggle折叠区
    zM:         折叠所有标签
    zR:         展开所有标签

### Plugin: NERD_commenter

    [count]<Leader>cc   加注释
    [count]<Leader>cu   解开注释
    [count]<Leader>cy   先注释再复制
    <Leader>c$          从当前位置注释到行尾
    <Leader>ca          切换注释风格
    <Leader>cA          行尾注释

### Plugin: nerdtree
需要快速浏览多个文件的时候用
如果仅仅是要跳转文件，可以用CtrlP或者mark{A-Z}，更加方便

    o:          在已有窗口中打开文件、目录或书签，并跳到该窗口
    go:         在已有窗口中打开文件、目录或书签，但不跳到该窗口
    i:          split 一个新窗口打开选中文件，并跳到该窗口
    gi:         split 一个新窗口打开选中文件，但不跳到该窗口
    s:          vsplit 一个新窗口打开选中文件，并跳到该窗口
    gs:         vsplit 一个新 窗口打开选中文件，但不跳到该窗口

### Plugin: CtrlP

    <Leader>P   查看当前目录
    <Leader>h   查看历史文件
    <C-j>       向下翻文件
    <C-k>       向上翻文件
    <C-w>       回退一个单词
    <C-u>       回退整行
    <CR>        在当前窗口打开选中文件
    <C-t>       在新的标签页打开选中文件
    <C-v>       在垂直分屏打开选中文件
    <C-x>       在水平分屏打开选中文件
    :tabc       关闭当前标签页
    :tabo       关闭其他的所有标签页
    <C-w>c      关闭当前分屏
    <C-w>o      关闭其他分屏

### Plugin: vim-snippets

    <C-j>       触发代码补全
    <C-f>       跳转下一个地方
    <C-b>       跳转上一个地方
