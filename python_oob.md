类的属性
====
类的数据属性被类和实例共享
```
class A(object):
    name = 'Jack'


a = A()
print(id(A.name))
print(id(a.name))
```

类的函数属性(这里指实例方法/对象方法, 关于类方法@classmethod和静态方法@staticmethod, 后面会写),是绑定在实例上的。实例调用的时候，将实例本身自动作为第一个参数传入类方法。因此，类方法定义的时候，第一个参数都写self，包括__init__方法。

类的继承
====
python是多继承。子类可以继承父类的属性。属性查找是按照类的__mro__属性(一个tuple)顺序查找。
```
class A(object):
    def __init__(self):
        print('=> class A')


class B(A):
    def __init__(self):
        print('=> class B')
        super().__init__()


class C(B):
    def __init__(self):
        print('=> class C')
        super().__init__()


class D(B):
    def __init__(self):
        print('=> class D')
        super().__init__()


class E(C, D):
    def __init__(self):
        print('=> class E')
        super().__init__()


e = E()
```

类的派生
====
子类中添加新的属性或者重写父类的属性，称为类的派生。
```
class A(object):
    def test(self, name):
        print('Hello %s' % name)


class B(A):
    def new_test(self, name, age):
        super().test(name)
        print('age: %d' % age)


b = B()
b.new_test('Jack', 23)
```

类的组合
====
在一个类中用另外一个类的对象作为数据属性，称为类的组合
```
class A(object):
    def test(self, name):
        print('Hello %s' % name)


class B(A):
    a = A()

    def run():
        print('Hello World')


b = B()
b.a.test('Jack')
print(b.a)
```
继承是一种“是”的关系，组合是一种“有”的关系

接口
====
接口提取了一群类共同的函数，可以把接口当做一个函数的集合。
然后让子类去实现接口中的函数。
这么做的意义在于归一化，什么叫归一化，就是只要是基于同一个接口实现的类，那么所有的这些类产生的对象在使用时，从用法上来说都一样。

抽象类
====
抽象类是一个特殊的类，它的特殊之处在于只能被继承，不能被实例化
抽象类与普通类的不同之处在于：抽象类中只能有抽象方法（没有实现功能），该类不能被实例化，只能被继承，且子类必须实现抽象方法。
```
import abc


class File_Type(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def read(self):
        pass

    @abc.abstractmethod
    def write(self):
        pass


class Disk(File_Type):
    def read(self):
        print('%s read' % self.__class__.__name__)

    def write(self):
        print('%s write' % self.__class__.__name__)


class Keyboard(File_Type):
    def read(self):
        print('%s read' % self.__class__.__name__)

    def write(self):
        print('%s write' % self.__class__.__name__)


d = Disk()
d.read()
d.write()
```

多态
====
接口的多种实现方式称为多态

封装
====
属性隐藏，然后提供访问数据的接口。

反射
====
指程序可以访问、检测和修改它本身状态或行为的一种能力（自省）
python面向对象中的反射：通过字符串的形式操作对象相关的属性
四个可以实现自省的函数: hasattr,getattr,setattr,delattr
```
class A(object):
    name = 'Jack'

    def __init__(self, age):
        self._age = age


a = A(23)
print(hasattr(a, 'name'))
print(getattr(A, 'name'))
setattr(A, 'name', 'Rose')
print(getattr(a, 'name'))
delattr(A, 'name')
print(hasattr(A, 'name'))
```

动态导入模块
====
动态反射模块
```
import importlib
importlib.import_module('test.new')
# __import__('test.new')
```
import模块导入
====
在Python中，一个.py文件就称之为一个模块（Module）。使用模块组织代码，最大的好处是大大提高了代码的可维护性
模块一共三种：python标准库、第三方模块、应用程序自定义模块。

    import module1[, module2[,... moduleN]

使用import语句时候，Python解释器通过sys.path的路径搜索。
一个模块可以在当前位置import多次，但是只有第一次导入会执行内容，其他的都为引用内存

    from modname import name1[, name2[, ... nameN]]

为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）。
每一个包目录下面都会有一个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录(文件夹)，而不是一个包。
__init__.py可以是空文件，也可以有Python代码，因为__init__.py本身就是一个模块，而它的模块名就是对应包的名字。调用包就是执行包下的__init__.py文件。import一个包名，就等于执行了这个包下的__init__文件。

    from modulepack1[.modulepack2] import module


设置和调用属性被自动触发的方法`__setattr__`, `__getattr__`,`__delattr__`,` __getattribute__`
====
```
class A(object):

    def __init__(self, name):
        self._name = name

    def __setattr__(self, name, value):
        print('__setattr__ is calling...')
        return super().__setattr__(name, value)

    def __getattr__(self, name):
        print('__getattr__ is calling...')
        return super().__getattr__(name)

    def __getattribute__(self, name):
        print('__getattribute__ is calling...')
        return super().__getattribute__(name)

    def __delattr__(self, name):
        print('__delattr__ is calling...')
        return super().__delattr__(name)


a = A('Jack')
a._name
# a.car
a.name = 'Rose'
del a.name
```

添加修改属性，调用`__setattr__`; 获取存在的属性，调用`__getattribute`; 获取不存在的属性，先调用`__getattribute__`, 然后调用`__getattr__`

包装
====
对于python标准类可以进行派生，修改增加方法。

授权
====
不是继承，而是通过已有的功能授权给对象默认属性，主要是在`__getattr__`方法里面返回对象的默认属性。

描述符
====
### 定义
实现了`__get__()`、`__set__()`和`__delete__()`中的其中任意一种方法的类称之为描述符

### 作用
描述符的作用是用来代理一个类的属性，需要注意的是描述符不能定义在类的构造函数中，只能定义为类的属性，它只属于类的，不属于实例，我们通过查看实例和类的字典即可知晓。

### 应用
描述符是可以实现大部分Python类特性中最底层的数据结构的实现手段，我们常使用的@classmethod、@staticmethd、@property、甚至是`__slots__`等属性都是通过描述符来实现的。它是很多高级库和框架的重要工具之一，是使用到装饰器或者元类的大型框架中的一个非常重要组件。

### 分类
描述符分为数据描述符和非数据描述符。把至少实现了内置属性`__set__()`和`__get__()`方法的描述符称为数据描述符；把实现了除`__set__()`以外的方法的描述符称为非数据描述符。之所以要区分描述符的种类，主要是因为它在代理类属性时有着严格的优先级限制。例如当使用数据描述符时，因为数据描述符大于实例属性，所以当我们实例化一个类并使用该实例属性时，该实例属性已被数据描述符代理，此时我们对该实例属性的操作是对描述符的操作。描述符的优先级的高低如下：

    类属性 > 数据描述符 > 实例属性 > 非数据描述符 > 找不到的属性触发`__getattr__()`


```
    class Descriptor(object):

    """Docstring for Descriptor. """

    def __init__(self, key, expected_type):
        self._key = key
        self._expected_type = expected_type

    """
    self: 描述符实例
    instance: 使用描述符的实例
    owner: 使用描述符的类
    """

    def __set__(self, instance, value):
        print('__set__ is calling...')
        if not isinstance(value, self._expected_type):
            raise TypeError('param:%s should be %s' %
                            (self._key, self._expected_type))
        instance.__dict__[self._key] = value

    def __get__(self, instance, owner):
        print('__get__ is calling...')
        return instance.__dict__[self._key]

    def __delete__(self, instance):
        print('__delete__ is calling...')
        instance.__dict__.pop(self._key)


class Test():
    name = Descriptor('name', str)
    age = Descriptor('age', int)

    def __init__(self, name, age):
        self.name = name
        self.age = age


# 触发__set__方法
t = Test('Jack', 20)

# 触发__set__方法
t.name = 'Rose'

# 触发__get__方法
print(t.name)

# 不会触发__set__方法，因为类属性优先级高于数据描述符
Test.name = 'Rose'
```
### 模拟@classmethod
利用装饰器和`__get__`方法
```
class ClassMethod(object):
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, owner):
        """
        类调动：instance为None, owner是类本身
        实例调用：instance为实例，owner是类本身
        """
        def wrapper(*args, **kwargs):
            print('add function here...')
            print('instance:%s, owner:%s' % (instance, owner))
            return self.func(owner, *args, **kwargs)
        return wrapper


class Test(object):
    @ClassMethod  # run = ClassMethod(run)
    def run(cls, msg):
        print('%s is running and %s' % (cls, msg))


t = Test()
Test.run('new life')
t.run('new life')
```
### 模拟@staticmethod
```
class StaticMethod(object):
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, owner):
        def wrapper(*args, **kwargs):
            print('handling...')
            return self.func(*args, **kwargs)
        return wrapper


class Test(object):
    @StaticMethod
    # test = StaticMethod(test)
    def test(name, age):
        print('name: %s, age: %d' % (name, age))


t = Test()

# handling...
# name: Jack, age: 23
t.test('Jack', 23)

# handling...
# name: Rose, age: 21
Test.test('Rose', 21)

```

### 模拟@property
```
class PropertyMethod(object):
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, owner):
        if instance is None:
            return self
        res = self.func(instance)
        setattr(instance, self.func.__name__, res)
        return res


class Test(object):
    def __init__(self, num):
        self.num = num

    @PropertyMethod
    def test(self):
        return self.num + 3


t = Test(10)
print(t.test)
print(t.__dict__)

```

### 属性访问
#### 类中的数据属性
静态数据，静态属性。类和实例共享。通过属性字典，可以发现，该属性在类的属性字典中，当实例的属性字典中找不到时候，会去找类中的属性。当实例中也定义相同名称的属性, 实例会在自己的属性字典中，创建属性，如果调用的话，会找到新的属性。
```
class A(object):
    def test(self):
        print('hello world')

    @classmethod
    def clstest(cls):
        print('class method')


a = A()
print(a.__dict__)  # {}
print(A.__dict__)  # 'test': <function A.test at 0x112bfec80>
print(a.clstest)  # <bound method A.clstest of <class '__main__.A'>>
a.clstest()  # 'class method' 自动传入类
A.clstest()  # 'class method' 自动传入类
a.test()  # 'hello world'
A.test(a)  # 'hello world'
```

#### 类中的函数属性
当实例去调用类中的普通方法时，是自动把实例对象作为第一个参数传入。
当实例去调用类中的类方法时，自动把类作为第一个参数传入。
当类去调用类中的普通方法, 需要手动传入实例对象，要不然报错。
当类去调用类中的类方法，自动把类作为第一个参数传入。

```
class A(object):
    def __get__(self, instance, owner):
        print('__get__ is calling...')


class B(object):
    a = A()

    def __getattribute__(self, name):
        print('__getattribute__ is calling...')
        return super().__getattribute__(name)


b = B()

# __getattribute__ is calling...
# __get__ is calling...
b.a

print('-' * 30)
b.a = 'shanghai'

print('-' * 30)
# __getattribute__ is calling...
b.a
```
### `__SLOT__`
- 是一个类变量,变量值可以是列表,元祖,或者可迭代对象,也可以是一个字符串(意味着所有实例只有一个数据属性)
- 使用点来访问属性本质就是在访问类或者对象的__dict__属性字典(类的字典是共享的,而每个实例的是独立的)
- 字典会占用大量内存,如果你有一个属性很少的类,但是有很多实例,为了节省内存可以使用__slots__取代实例的__dict__
当你定义__slots__后,__slots__就会为实例使用一种更加紧凑的内部表示。实例通过一个很小的固定大小的数组来构建,而不是为每个实例定义一个字典,这跟元组或列表很类似。
- 关于__slots__的一个常见误区是它可以作为一个封装工具来防止用户给实例增加新的属性。尽管使用__slots__可以达到这样的目的,但是这个并不是它的初衷。更多的是用来作为一个内存优化工具。

```
  class A(object):
    __slots__ = ('name', 'age')

    def __init__(self, name):
        self.name = name


a = A('Jack')
a.age = 23
print(a.__slots__)

# AttributeError: 'A' object has no attribute '__dict__'
# print(a.__dict__)
```

### 函数是实现了`__get__`方法的非数据描述符
```
class A(object):
    def test(self):
        print('test calling...')


a = A()
print(hasattr(a.test, '__get__'))
print(hasattr(a.test, '__set__'))
print(hasattr(a.test, '__delete__'))
a.test = 'shanghai'
print(hasattr(a.test, '__get__'))
del a.test
print(hasattr(a.test, '__get__'))

```
### `__call__`
模仿了函数的用法，使得类像函数
```
class A(object):
    def __call__(self):
        print('__call__ is calling...')

    def test(self):
        print('test is calling...')


a = A()
a()

```
