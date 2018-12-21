Git Command and Zsh alias
====
```
COMMAND                     ZSH             EXPLAIN
git help <verb>             ghh             获取帮助
```
```
git init                                    初始化新建空的仓库或者初始化已有的仓库
                                           （不会覆盖原有的内容)
```
```
git add                     ga              将已跟踪的修改与删除的文件, 和未跟踪的文件, 
                                            形成快照添加到暂存区
git add --all               gaa             将所有的已跟踪的修改与删除的文件, 和未跟踪的文件, 
                                            形成快照都添加到暂存区
git add --update            gau             将已跟踪修改和删除的文件, 形成快照添加到暂存区，
                                            不包括未跟踪的文件
```
```
git rm                      grm             工作区和暂存区删除文件
git rm --cached             grmc            工作区保留文件，暂存区删除文件。
                                            适合忘记添加到.gitignore中的文件。
```
```
git mv                                      移动或者重命名文件
```
```
git commit -m               gcmsg           把暂存区提交到仓库
git commit -a -m            gcam            把已被准追的修改的工作区都提交到仓库
git commit -v --amend       gc!             重新提交，覆盖上次提交
```

```
git status                  gst             显示文件在工作区和暂存区的状态，和仓库一致就不显示
git status -s               gss             显示文件在工作区和暂存区的状态, 和仓库一致就不显示 
git status -sb              gsb             增加分支显示
```
```
git diff                    gd              比较工作区和暂存区差异, 比较不同提交的差异, 
                                            比较工作区和指定提交差异
git diff --cached           gdca            比较暂存区和仓库差异, 比较暂存区和指定提交的差异
git difftool                                比较暂存区和仓库差异, 比较不同提交的差异
git difftool --cached                       比较暂存区和仓库差异, 比较暂存区和指定提交的差异
```

```
git log --stat              glg             每次提交信息和上一次的差异, 显示哪些文件被操作
git log --stat -p           glgp            每次提交信息和上一次的差异, 显示哪些文件被操作，
                                            并列出修改的文件内容
git log --graph             glgg            字符串图形串联起每次提交，不显示哪些文件被操作，
                                            不显示修改内容
git log --oneline           glo             一行显示每次提交信息
```
```
                            glod            格式化显示每次提交时间, 详细到年月日时分秒
                            glods           格式化显示每次提交时间, 只显示年月日
                            glol            格式化显示每次提交时间, 显示前多久提交
                            glols           格式化显示每次提交时间, 显示前多久提交, 
                                            并显示哪些文件被操作
```
```
git log -n=                                 只显示最近的n个提交
git log --after=                            按照提交时间筛选, '2018-12-19', '6 hours ago'
git log --before=                           按照提交时间筛选, '2018-12-19', '6 hours ago'
git log --author=                           按照提交作者筛选
git log -- fileName                         筛选特定文件
git log --grep=                             按照提交内容筛选
git log -S'<string>'                        按照文件内容筛选
git log master..feature                     筛选在feature有而在master没有的提交
git log feature..master                     筛选在master有而在feature没有的提交
git log --no-merges                         筛选没有merge的

```
```
git reset                   grh             默认--mixed, 等同unstage, 默认HEAD
git reset -- <file>         gru             --mixed, 只针对特定文件
git reset --hard            grhh            移动head指针到指定提交，重置暂存区和工作区
git reset --soft            grh --soft      移动head指针到指定提交，保留当前暂存区和工作区
git reset --mixed           grh             移动head指针到指定提交，重置暂存区，保留工作区
git reset HEAD <file>       grh             unstage
```
```
git checkout                gco             切换分支和撤销对文件修改
git checkout -b             gcb             新建并切换分支
git checkout master         gcm             切换到master分支
```

```
git branch                  gb              列出本地分支
git branch -d               gbd             删除分支
git branch -a               gba             列出本地和远程仓库
git branch -v               gb -v           列出分支最后一次提交
```

```
git remote                  gr              显示远程仓库名称
git remote -v               grv             显示远程仓库名称和URL
git remote show             gr show         显示远程仓库详细信息
```
```
git fetch [remote-name]     gf              访问远程仓库，拉取本地没有的数据
git fetch origin            gfo             访问远程仓库origin，拉取本地没有的数据
git push                    gp              推送到远程仓库
git pull                    gl              拉取远程仓库数据，并合并到本地
git merge                   gm              合并分支
```
```
git hash-object -w                          将一个文件转化为一个blob对象存入仓库
git cat-file -p                             显示一个HASH值对应的文件对象
git cat-file -f                             显示一个HASH值对应的文件类型
```

### 分支
- 暂存操作：(1) 计算每个文件SHA-1值; (2) 把头部信息和数据内容合并; (3) 压缩2的内容，在.git/objects下面写入文件对象; (4) SHA-1的前2位作为目录名，后面38位作为文件名. [参考对象存储](#REF1)

- 提交操作：(1)计算当前目录下所有文件的SHA-1值; (2)生成包含所有文件SHA-1的tree对象; (3) 包含作者和提交者信息; (4)包含父对象commit id; (4)提交信息; [参考对象结构](#REF2)

- HEAD指针指向了分支指针，分支指针指向了提交，这样就可以知道当前分支; [参考HEAD引用](#REF3)

- merge合并分支方法：会把两个分支的最新快照以及二者最近的共同祖先进行三方合并，合并的结果是生成一个新的快照(并提交)

- rebase合并分支方法: 首先找到这两个分支的最近共同祖先，然后对比当前分支相对于该祖先的历次提交，提取相应的修改并存为临时文件，然后将当前分支指向目标基底, 最后以此将之前另存为临时文件的修改依序修改


<span id='REF1'></span>
### 原理
#### 对象存储  
- 头部信息：类型(blob/tree/commit)+数据内容长度+结束字符串（空字符）
- SHA-1值：把头部信息和数据内容连接起来，计算哈希值
- 压缩数据内容：使用zlib压缩数据内容
- 要先确定待写入对象的路径(SHA-1 值的前两个字符作为子目录名称，后38个字符则作为子目录内文件的名称)
- 写入文件：把压缩的数据内容，写入文件

#### GIT引用
- .git/refs/heads目录：保存了各种分支指向的文件SHA1值
- .git/refs/tags目录：保存了各种tag指向的文件SHA1值

<span id='REF3'></span>
#### HEAD引用
ref: refs/heads/master, 当checkout dev时候，会更改master=>dev

#### 文件打包
Git 最初向磁盘中存储对象时所使用的格式被称为“松散(loose)”对象格式。 但是，Git 会时不时地将多个这些对象打包成一个称为“包文件(packfile)”的二进制文件，以节省空间和提高效率。
Git 打包对象时，会查找命名及大小相近的文件，并只保存文件不同版本之间的差异内容。

<span id='REF2'></span>
#### 对象结构
先查看一下当前分支提交的情况     

    git cat-file -p master

结果如下:(1)tree对象; (2)父对象; (3)作者信息; (4)提交者信息; (5)提交信息;


    tree e32f079c416cce93bf615cd4c28b43d0a89b07bf
    parent 2503b388d04ac88965fb0a478a0f3a7b7b5b73b1
    author BH_SHI <bh.shi@icloud.com> 1545363528 +0800
    committer BH_SHI <bh.shi@icloud.com> 1545363528 +0800
    
    version 2

再查看tree对象

    git cat-file -p e32f079c416cce93bf615cd4c28b43d0a89b07bf


tree对象结果如下：(1)文件模式; (2)文件类型; (3)文件SHA-1值; (4)文件名
文件模式为100644，表明这是一个普通文件。其他选择包括:100755，表示一个可执行文件;120000，表示一个符号链接

    100644 blob b761bb4977d59c0d3e80ab04c68858122b8a7b22	README
    040000 tree 51f1dfa1dd11a4caae285b6ff653b69949cd0d65	lib

再查看下一级tree对象

    git cat-file -p 51f1dfa1dd11a4caae285b6ff653b69949cd0d65

    100644 blob be562516ad8bc4b61c5a116c4c17c7578cfe1f81	1.txt
    100644 blob 961064fb976784f326c474273e14a4534fac81d7	2.txt

最后看一下在仓库里面对象情况

    .git/objects/95/fa775b4e110901d8cac03a9e2272f747c800c2  commit_obj:commit2
    .git/objects/e3/2f079c416cce93bf615cd4c28b43d0a89b07bf  tree: commit2
    .git/objects/51/f1dfa1dd11a4caae285b6ff653b69949cd0d65  tree: commit1_2 lib/
    .git/objects/be/562516ad8bc4b61c5a116c4c17c7578cfe1f81  blob: commit1_2 lib/1.txt
    .git/objects/96/1064fb976784f326c474273e14a4534fac81d7  blob: commit1_2 lib/2.txt
    .git/objects/b7/61bb4977d59c0d3e80ab04c68858122b8a7b22  bolb: commit2 README
    .git/objects/25/03b388d04ac88965fb0a478a0f3a7b7b5b73b1  commit_obj:commit1
    .git/objects/8a/3dec0582c11b02b13b3f7c843b9720bab4d43b  tree: commit1
    .git/objects/55/7db03de997c86a4a028e1ebd3a1ceb225be238  blob: commit1 README
