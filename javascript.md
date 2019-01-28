具体需要写的时候，请使用Dash，参考手册

JavaScript 组成
===

    核心（ECMAScript） 
    文档对象模型（DOM） Document object model (整合js，css，html)
    浏览器对象模型（BOM） Brower object model（整合js和浏览器）

引入方式
===
	
1 直接编写
    <script>alert('hello')</script>

2 导入文件
    <script src="hello.js"></script>　

Null & Undefined
===
Undefined 类型

Undefined 类型只有一个值，即 undefined。当声明的变量未初始化时，该变量的默认值是 undefined。
当函数无明确返回值时，返回的也是值 "undefined";

Null 类型

另一种只有一个值的类型是 Null，它只有一个专用值 null，即它的字面量。值 undefined 实际上是从值 null 派生来的，因此 ECMAScript 把它们定义为相等的。
尽管这两个值相等，但它们的含义不同。undefined 是声明了变量但未对其初始化时赋予该变量的值，null 则用于表示尚未存在的对象（在讨论 typeof 运算符时，简单地介绍过这一点）。如果函数或方法要返回的是对象，那么找不到该对象时，返回的通常是 null。

数据类型转换
===

    数字 + 字符串：数字转换为字符串
    数字 + 布尔值：true转换为1，false转换为0
    字符串 + 布尔值：布尔值转换为字符串true或false

    函数parseInt：   强制转换成整数   例如parseInt("6.12")=6  ; parseInt(“12a")=12 ; parseInt(“a12")=NaN  ;parseInt(“1a2")=1
    函数parseFloat： 强制转换成浮点数  parseFloat("6.12")=6.12
    函数eval：       将字符串强制转换为表达式并返回结果 eval("1+1")=2 ; eval("1<2")=true

    NaN:属于Number类型的一个特殊值,当遇到将字符串转成数字无效时,就会得到一个NaN数据

11种内置对象
===

    Array ,String , Date, Math, Boolean, Number  Function, Global, Error, RegExp , Object

#### String

    <!--格式编排方法-->
    var x="yuan";
    var y="x.italics():"+x.italics();
    document.write(y.fontsize(10));//<font size="10">x.italics():<i>yuan</i></font>

    <!--大小写转换-->
    var str1="AbcdEfgh";
    var str2=str1.toLowerCase();
    var str3=str1.toUpperCase();

    <!--获取指定字符-->
    var str1="welcome to the world";
    var str2=str1.charAt(28);
    var str3=str1.charCodeAt(28);
    
    <!--查询字符串-->
    var str1="welcome to the world of JS!";
    var str2=str1.indexOf("l");
    var str3=str1.lastIndexOf("l");
    
    <!--子字符串处理-->
    var str1="abcdefgh";
    var str2=str1.substr(2,4);
    var str3=str1.substring(2,4);
    //x.substr(start, length)
    //x.substring(start, end)
    //x.slice(start, end)

    <!--替换子字符串-->
    var str1="abcdefgh";
    var str2=str1.replace("cd","aaa");

    <!--分割字符串-->
    var str1="一,二,三,四,五,六,日";
    var strArray=str1.split(",");
    alert(strArray[1]);

    <!--连接字符串-->
    var str1="abcd";
    var str2=str1.concat("efgh");

#### Array对象

    <!--创建数组对象-->
    var a=[1,2,3];
    new Array();
    new Array(size);
    new Array(element0, .., elementn)

    <!--创建二维数组-->
    var cnweek=new Array(7);
    for (var i=0;i<=6;i++){
        cnweek[i]=new Array(2);
    }

    <!--Array对象的属性-->

    <!--连接数组-join方法-->
    var arr1=[1, 2, 3, 4, 5, 6, 7];
    var str1=arr1.join("-");

    <!--连接数组-concat方法-->
    var a = [1,2,3];
    var a = new Array(1,2,3);
    var b=a.concat(4,5);

    <!--数组排序-reverse sort-->
    var arr1=[32, 12, 111, 444];
    arr1.reverse(); //颠倒数组元素
    arr1.sort();    //排序数组元素

    <!--数组切片-slice-->
    var arr1=['a','b','c','d','e','f','g','h'];
    var arr2=arr1.slice(2,4);
    var arr3=arr1.slice(4);
    var arr4=arr1.slice(2,-1);

    <!--删除子数组-->
    var a = [1,2,3,4,5,6,7,8];
    a.splice(1,2);
    //a变为 [1,4,5,6,7,8]
    //x. splice(start, deleteCount, value, ...)

    <!--数组的进出栈操作(1)-->
    var arr1=[1,2,3];
    arr1.push(4,5);
    arr1.pop();
    //push是将value值添加到数组x的结尾
    //pop是将数组x的最后一个元素删除

    <!--数组的进出栈操作(2)-->
    var arr1=[1,2,3];
    arr1.unshift(4,5);
    arr1.shift();
    //unshift是将value值插入到数组x的开始
    //shift是将数组x的第一个元素删除

#### Date对象

    <!--创建Date对象-->
    //方法1：不指定参数
    var nowd1=new Date();
    alert(nowd1.toLocaleString( ));
    //方法2：参数为日期字符串
    var nowd2=new Date("2004/3/20 11:12");
    alert(nowd2.toLocaleString( ));
    var nowd3=new Date("04/03/20 11:12");
    alert(nowd3.toLocaleString( ));
    //方法3：参数为毫秒数
    var nowd3=new Date(5000);
    alert(nowd3.toLocaleString( ));
    alert(nowd3.toUTCString());
    //方法4：参数为年月日小时分钟秒毫秒
    var nowd4=new Date(2004,2,20,11,12,0,300);
    alert(nowd4.toLocaleString( ));

    <!--Date对象的方法—获取日期和时间-->
    getDate()                 获取日
    getDay ()                 获取星期
    getMonth ()               获取月（0-11）
    getFullYear ()            获取完整年份
    getYear ()                获取年
    getHours ()               获取小时
    getMinutes ()             获取分钟
    getSeconds ()             获取秒
    getMilliseconds ()        获取毫秒
    getTime ()                返回累计毫秒数(从1970/1/1午夜)

    <!--Date对象的方法—设置日期和时间-->
    setDate(day_of_month)       设置日
    setMonth (month)                 设置月
    setFullYear (year)               设置年
    setHours (hour)         设置小时
    setMinutes (minute)     设置分钟
    setSeconds (second)     设置秒
    setMillliseconds (ms)       设置毫秒(0-999)
    setTime (allms)     设置累计毫秒(从1970/1/1午夜)

    <!--日期和时间的转换-->
    getTimezoneOffset():8个时区×15度×4分/度=480;
    返回本地时间与GMT的时间差，以分钟为单位
    toUTCString()
    返回国际标准时间字符串
    toLocalString()
    返回本地格式时间字符串
    Date.parse(x)
    返回累计毫秒数(从1970/1/1午夜到本地时间)
    Date.UTC(x)
    返回累计毫秒数(从1970/1/1午夜到国际时间)

#### RegExp对象

    //RegExp对象
    // 在表单验证时使用该对象验证用户填入的字符串是否符合规则.
    //创建正则对象方式1  参数1 正则表达式  参数2 验证模式  g global / i 忽略大小写. //参数2一般填写g就可以，也有“gi”.
    // 用户名 首字母必须是英文, 除了第一位其他只能是英文数字和_ . 长度最短不能少于6位 最长不能超过12位
    //----------------------------创建方式1
    /* var reg1 = new RegExp("^[a-zA-Z][a-zA-Z0-9_]{5,11}$","g");
    //
    //验证字符串
    var str = "bc123";
    alert(reg1.test(str));// true

    //----------------------------创建方式2  /填写正则表达式/匹配模式;
    var reg2 = /^[a-zA-Z][a-zA-Z0-9_]{5,11}$/g;

    alert(reg2.test(str));// true
     */
    //-------------------------------正则对象的方法-------------------
        //test方法  ==>  测试一个字符串是否复合 正则规则. 返回值是true 和false.

    //-------------------------String 中与正则结合的4个方法------------------.
    // macth search split replace
    var str = "hello world";

    //alert(str.match(/o/g)); //查找字符串中 复合正则的 内容.
    //alert(str.search(/h/g));// 0  查找字符串中符合正则表达式的内容位置
    //alert(str.split(/o/g)); // 按照正则表达式对字符串进行切割. 返回数组;
    alert(str.replace(/o/g, "s")); // hells wsrld  对字符串按照正则进行替换.

#### Math对象

    alert(Math.pow(2,4));
    abs(x)      返回数的绝对值。
    exp(x)      返回 e 的指数。
    floor(x)    对数进行下舍入。
    log(x)      返回数的自然对数（底为e）。
    max(x,y)    返回 x 和 y 中的最高值。
    min(x,y)    返回 x 和 y 中的最低值。
    pow(x,y)    返回 x 的 y 次幂。
    random()    返回 0 ~ 1 之间的随机数。
    round(x)    把数四舍五入为最接近的整数。
    sin(x)      返回数的正弦。
    sqrt(x)     返回数的平方根。
    tan(x)      返回角的正切。


BOM对象
===

BOM（浏览器对象模型），可以对浏览器窗口进行访问和操作。使用 BOM，开发者可以移动窗口、改变状态栏中的文本以及执行其他与页面内容不直接相关的动作。

使 JavaScript 有能力与浏览器“对话”。

#### window对象
所有浏览器都支持 window 对象。
概念上讲.一个html文档对应一个window对象.
功能上讲: 控制浏览器窗口的.
使用上讲: window对象不需要创建对象,直接使用即可.

    alert()            显示带有一段消息和一个确认按钮的警告框。
    confirm()          显示带有一段消息以及确认按钮和取消按钮的对话框。
    prompt()           显示可提示用户输入的对话框。
    
    open()             打开一个新的浏览器窗口或查找一个已命名的窗口。
    close()            关闭浏览器窗口。
    setInterval()      按照指定的周期（以毫秒计）来调用函数或计算表达式。
    clearInterval()    取消由 setInterval() 设置的 timeout。
    setTimeout()       在指定的毫秒数后调用函数或计算表达式。
    clearTimeout()     取消由 setTimeout() 方法设置的 timeout。
    scrollTo()         把内容滚动到指定的坐标。

    ```
    alert('Hello World')
    alert(confirm('enter?'))
    alert(prompt('enter your name'))

    open('http://www.baidu.com')

    <div id="div" class="name">Show Time Here...</div>
    <button onclick="start()">start</button>
    <script charset="utf-8">
        function showTime() {
            var d = new Date().toLocaleString();
            var t = document.getElementById("div");
            t.innerHTML = d;
        }
        function start() {
            setInterval(showTime,1000);
        }
    </script>

    ```

#### History对象
History 对象属性
History 对象包含用户（在浏览器窗口中）访问过的 URL。
History 对象是 window 对象的一部分，可通过 window.history 属性对其进行访问。

    back()    加载 history 列表中的前一个 URL。
    forward()    加载 history 列表中的下一个 URL。
    go()    加载 history 列表中的某个具体页面。

#### Location 对象
Location 对象包含有关当前 URL 的信息。
Location 对象是 Window 对象的一个部分，可通过 window.location 属性来访问。

    location.assign(URL)
    location.reload()
    location.replace(newURL)//注意与assign的区别

DOM对象(DHTML)
===
DOM 是 W3C（万维网联盟）的标准。DOM 定义了访问 HTML 和 XML 文档的标准：
"W3C 文档对象模型（DOM）是中立于平台和语言的接口，它允许程序和脚本动态地访问和更新文档的内容、结构和样式。"
W3C DOM 标准被分为 3 个不同的部分：

    核心 DOM - 针对任何结构化文档的标准模型
    XML DOM - 针对 XML 文档的标准模型
    HTML DOM - 针对 HTML 文档的标准模型

#### DOM 节点 
根据 W3C 的 HTML DOM 标准，HTML 文档中的所有内容都是节点(NODE)：

    整个文档是一个文档节点(document对象)
    每个 HTML 元素是元素节点(element 对象)
    HTML 元素内的文本是文本节点(text对象)
    每个 HTML 属性是属性节点(attribute对象)
    注释是注释节点(comment对象)

节点(自身)属性:

    attributes - 节点（元素）的属性节点
    nodeType – 节点类型
    nodeValue – 节点值
    nodeName – 节点名称
    innerHTML - 节点（元素）的文本值

    节点类型 	    NodeType
    元素element 	1
    属性attr 	    2
    文本text 	    3
    注释comments 	8
    文档document 	9

    HTML文件中两个元素之间的换行和空格都是NodeType=3的节点

导航属性:

    parentNode - 节点（元素）的父节点 (推荐)
    firstChild – 节点下第一个子元素
    lastChild – 节点下最后一个子元素
    childNodes - 节点（元素）的子节点 

DOM事件
    onclick        当用户点击某个对象时调用的事件句柄。
    ondblclick     当用户双击某个对象时调用的事件句柄。
    
    onfocus        元素获得焦点。               
    onblur         元素失去焦点。               
    应用场景：用于表单验证,用户离开某个输入框时,代表已经输入完了,我们可以对它进行验证.

    onchange       域的内容被改变。             
    应用场景：通常用于表单元素,当元素内容被改变时触发.（三级联动）
    
    onkeydown      某个键盘按键被按下。         
    应用场景: 当用户在最后一个输入框按下回车按键时,表单提交.
    
    onkeypress     某个键盘按键被按下并松开。
    onkeyup        某个键盘按键被松开。
    onload         一张页面或一幅图像完成加载。
    onmousedown    鼠标按钮被按下。
    onmousemove    鼠标被移动。
    onmouseout     鼠标从某元素移开。
    onmouseover    鼠标移到某元素之上。
    onmouseleave   鼠标从元素离开
    
    onselect      文本被选中。
    onsubmit      确认按钮被点击。


    改变 HTML 内容
    改变元素内容的最简答的方法是使用 innerHTML ，innerText。

    改变 CSS 样式
    <p id="p2">Hello world!</p>
    document.getElementById("p2").style.color="blue"

    改变 HTML 属性
    elementNode.setAttribute(name,value)
    elementNode.getAttribute(name)<-------------->elementNode.value(DHTML)

    创建新的 HTML 元素
    createElement(name)

    删除已有的 HTML 元素
    elementNode.removeChild(node)

    关于class的操作
    elementNode.className
    elementNode.classList.add
    elementNode.classList.remove

页面加载完后再执行JS
===
把JS文件放在BODY的最下方


1.js方法

    window.onload=test;
    function test(){
    //要执行的代码
    }

2.jquery方式
    $(docunment).ready(function(){
    //要执行的代码。
    });
    推荐用jquery 

window.onload：必须等到页面内包括图片的所有元素加载完毕后才能执行。 
$(document).ready()：是DOM结构绘制完毕后就执行，不必等到加载完毕。

JQuery
===

###JQuery对象
    jQuery 对象就是通过jQuery包装DOM对象后产生的对象

    jquery的基础语法：$(selector).action()

    $("#test").html()
    // 意思是指：获取ID为test的元素内的html代码。其中html()是jQuery里的方法
    // 这段代码等同于用DOM实现代码： document.getElementById("test").innerHTML;

    method1:
    $("document").ready(function)

    method2:
    $().ready(function)

    method3:
    $(function)

    css("propertyname","value");

### 选择器和筛选器
#### 基本选择器

    $("*")          
    $("#id")        
    $(".class")  
    $("p")          标签选择器
    $("p, div")     联合选择器

#### 层级选择器

    父子关系
    $("s1 s2")      派生选择器--在s1内部获得全部的s2节点(不考虑层次), 包括子子孙孙
    $("s1>s2")      直接子元素选择器--考虑层次:在s1内部获得s2的子元素节点

    兄弟关系
    $("s1+s2")      直接兄弟选择器--在s1后边获得紧紧挨着的第一个兄弟关系的s2节点
    $("s1~s2")      后续全部兄弟关系结点选择器--在s1后边获得全部兄弟关系的s2节点

#### 基本筛选器-并且(过滤)选择器

    $("s:first")  
    $("s:last")  
    $("s:eq(2)")    eq(下标) 下标从0计算, equal()
    $("s:even") 
    $("s:odd") 
    $("s:gt(1)")    gt(索引值) 下标大于条件索引值, great than
    $("s:lt(1)")    lt(索引值) 下标小于条件索引值, less than
    $("s:header")   header 获得h1/h2/h3...的标题元素
    $("s:not()")    

#### 内容过滤选择器

    $(“s:contains()”)
    $(“s:empty”)
    $(“s:has()”)    内部包含指定元素的选择器
    $(“s:parent”)   寻找的节点必须作为父元素节点存在

#### 属性选择器

    $('[attr="value"]')   
    $('[attr1="v1"] [attr2="v2"]')      and
    $('[attr1="v1"], [attr2="v2"]')     or

    选择指定属性值等于给定字符串或改字符串为前缀（该字符串后跟一个连字符“-”）的元素
    $("[attr|='value']")

    选择指定属性具有包含一个给定的子字符串的元素。（选择给定的属性是以包含某些值的元素）
    $("[attr*='value']")
    
    选择指定属性用空格分隔的值中包含一个给定的元素。
    $("[attr~='value']")

    选择指定属性是以给定元素结尾的元素。这个元素比较是区分大小写的。
    $("[attr='value']")

    选择指定属性就是以给定字符串开始的元素。
    $("[attr^='value']")

    选择指定属性不等于这个值的元素
    $("[attr!='value']")

    选择所有具有指定属性的元素，该属性可以是任何值。
    $("[attribute]")


#### 表单选择器

    $("[type='text']")----->$(":text") 注意只适用于input标签  : $("input:checked")

#### 筛选器

    $("s").eq()  
    $("s").first()  
    $("s").hasclass()
    $("s").children()     
    $("s").find()

    $("s").next()    
    $("s").nextAll()    
    $("s").nextUntil()
    $("s").prev()  
    $("s").prevAll()  
    $("s").prevUntil()
    $("s").parent()  
    $("s").parents()  
    $("s").parentUntil()
    $("s").siblings()

#### 属性操作

    --------------------------属性
    $("").attr();
    $("").removeAttr();
    $("").prop();
    $("").removeProp();
    --------------------------CSS类
    $("").addClass(class|fn)
    $("").removeClass([class|fn])
    --------------------------HTML代码/文本/值
    $("").html([val|fn])
    $("").text([val|fn])
    $("").val([val|fn|arr])
    ---------------------------
    $("").css("color","red")

    //对于HTML元素本身就带有的固有属性，在处理时，使用prop方法。
    //对于HTML元素自定义的DOM属性，在处理时，使用attr方法。

#### 文档处理
    
    //创建一个标签对象
    $("<p>")


    //内部插入

    $("").append(content|fn)      ----->$("p").append("<b>Hello</b>");
    $("").appendTo(content)       ----->$("p").appendTo("div");
    $("").prepend(content|fn)     ----->$("p").prepend("<b>Hello</b>");
    $("").prependTo(content)      ----->$("p").prependTo("#foo");

    //外部插入

    $("").after(content|fn)       ----->$("p").after("<b>Hello</b>");
    $("").before(content|fn)      ----->$("p").before("<b>Hello</b>");
    $("").insertAfter(content)    ----->$("p").insertAfter("#foo");
    $("").insertBefore(content)   ----->$("p").insertBefore("#foo");

    //替换
    $("").replaceWith(content|fn) ----->$("p").replaceWith("<b>Paragraph. </b>");

    //删除

    $("").empty()
    $("").remove([expr])

    //复制

    $("").clone([Even[,deepEven]])

#### css操作

    $("").css(name|pro|[,val|fn])

    位置
    $("").offset([coordinates])
    $("").position()
    $("").scrollTop([val])
    $("").scrollLeft([val])

    尺寸
    $("").height([val|fn])
    $("").width([val|fn])
    $("").innerHeight()
    $("").innerWidth()
    $("").outerHeight([soptions])
    $("").outerWidth([options])

#### 事件

    $("").on(eve,[selector],[data],fn) 


'''
    <div>
      <button id="btn">添加新的p元素</button>
      <p>第一个p元素</p>
      <p>第二个p元素</p>
      <p>第三个p元素</p>
      <p>第四个p元素</p>
      <p>第五个p元素</p>
    </div>

    <script>
    $("#btn").click(function(){
      $("div").append("<p>这是一个新的p元素</p>");
    });
    </script>

    $("div").on("click","p",function(){
        alert($(this).text());
    })
'''
