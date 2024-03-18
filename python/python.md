#### 1. 单前导下划线 _var（弱提示，给程序员提示）
from my_module import *
external_func()
23
_internal_func()
NameError: "name '_internal_func' is not defined"
import my_module
my_module.external_func()
23
my_module._internal_func()
42
##### 2. 单末尾下划线 var_
解决命名冲突
#### 3. 双前导下划线 __var
防止被子类重写
class Test:
   def __init__(self):
       self.foo = 11
       self._bar = 23
       self.__baz = 23
t = Test()
dir(t)
['_Test__baz', '__class__', '__delattr__', '__dict__', '__dir__',
'__doc__', '__eq__', '__format__', '__ge__', '__getattribute__',
'__gt__', '__hash__', '__init__', '__le__', '__lt__', '__module__',
'__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__',
'__setattr__', '__sizeof__', '__str__', '__subclasshook__',
'__weakref__', '_bar', 'foo']

class ExtendedTest(Test):
   def __init__(self):
       super().__init__()
       self.foo = 'overridden'
       self._bar = 'overridden'
       self.__baz = 'overridden'
t2 = ExtendedTest()
t2.foo
'overridden'
t2._bar
'overridden'
t2.__baz
AttributeError: "'ExtendedTest' object has no attribute '__baz'"

#### 获取py文件的目录和绝对路径
os.path.dirname(__file__)
os.path.abspath(__file__)
#### 升级pip
python -m pip install --upgrade pip
#### 使用国内源下载
pip3 install pandas -i https://pypi.tuna.tsinghua.edu.cn/simple

### 使用虚拟环境
python3 -m venv venv_dir
### 进入虚拟环境
venv_dir/bin/activate
### 退出
deactivate

python3 -m http.server 8000
