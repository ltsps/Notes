#### 1. 单前导下划线 _var（弱提示，给程序员提示）
```
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
```
##### 2. 单末尾下划线 var_
解决命名冲突
#### 3. 双前导下划线 __var
防止被子类重写
```python
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
```
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
source venv_dir/bin/activate
### 退出
deactivate
### cursor/vscode IDE设置虚拟环境
打开命令面板‌
使用快捷键 Ctrl+Shift+P（Windows/Linux）或 Cmd+Shift+P（macOS）。
‌选择 Python 解释器‌
输入并选择 Python: Select Interpreter，从列表中找到虚拟环境对应的解释器（路径通常包含 venv 或虚拟环境名称

手动配置 .vscode/settings.json
```json
{
    "python.defaultInterpreterPath": "venv/Scripts/python.exe" 
}
```

python3 -m http.server 8000

### 装饰器的使用
```python
示例一
def log(level):
    def decorator(func):
        def wrapper(*args, **kwargs):
            print(f"[{level}] 调用函数: {func.__name__}")
            return func(*args, **kwargs)
        return wrapper
    return decorator

@log("INFO")
def say_hello():
    print("Hello!")
say_hello()
# 等价于 say_hello = log("INFO")(say_hello)
```
```python
示例二
import time

def timer(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        print(f"{func.__name__} 执行时间: {end_time - start_time} 秒")
        return result
    return wrapper

@timer
def calculate_sum(n):
    return sum(range(n + 1))

# 等价于 calculate_sum = timer(calculate_sum)
calculate_sum(1000000)  # 会输出函数执行时间
```
