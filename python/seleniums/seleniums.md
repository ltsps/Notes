# 移动最顶部
driver.execute_script(document.documentElement.scrollTop=0)
# 移动至最底部
1. driver.execute_script(document.documentElement.scrollTop=document.documentElement.scrollHeight)
2. driver.execute_script(window.scrollTo(0,document.documentElement.scrollHeight)
# 移动至元素可见
element=driver.find_element(By.XPAHT,'')
driver.execute_script("arguments[0].scrollIntoView();",element) ##向下滚动至元素可见
driver.execute_script("arguments[0].scrollIntoView();",element) ##向上滚动至元素可见

# 页面缩放
driver.execute_script(document.body.style.zoom='1') ## 相当于ctrl+[+-]
# 元素定位获取
xpath定位
Chrome调试：Console下输入$x(xpath定位),
1. 通过id定位
'//*[@id="kw"]'   #*号匹配任何标签
'//input[@xx='kw']'   # xx为input标签中的属性名称<input xx=kw> </input>
2. 多个属性组合
'//input[@type="text" and @name="wd"]'
3. 多个相对路径
'//*[@id="keeplogin"]//input[@type="checkbox"]
4. 索引定位
'//*[@att=tesxt]/option[3]'
5. 模糊匹配
● contains模糊匹配text:contains
● '/a[contains(text(),"包含的文字"]')
● '/a[contains(@att,"包含的文字"]')
● '//input[contains(@att,"xx")]')  # 模糊匹配某个属性
● //a[not(contains(@class,"disabled"))]/span[text()="加入发货台"])
● '//input[starts-with(@att, 'xx')]') #模糊匹配属性值以xx开头
● '//input[ends-with(@att, 'xx')]') #模糊匹配属性值以xx结尾
● '//input[matchs(text(), 'xx')]')   #正则表达式匹配
driver.find_elements(By.XPATH,'//div[text()="发货时间："]')
driver.find_elements(By.XPATH,'//div[contains(text(),"FH")]/../div[2]')

# 其它标签
driver.page_source
