# Bewilder
仿百思不得骑姐[ShenYj](https://github.com/ShenYj)
<hr>

------
### - 注册登录界面:

整个界面分为三部分,并分别通过协议的方式,与控制器结藕,处理按钮点击事件
- [x] 顶部视图(包含左侧关闭按钮;右侧注册登录切换按钮)   `JSTopLoginViewCloseControllerDelegate`
- [x] 中间视图(包含登录界面;注册界面)                 `JSCenterLoginViewDelegate`
- [x] 底部视图(包含SSO登录的三个按钮及其他子控件)       `JSSSOLoginViewDelegate`
<br>效果图:<br>
![注册登录](https://github.com/ShenYj/Bewilder/blob/master/01-关注:登录注册界面.gif?raw=true)

-------
### - 我的界面:
- [x] 我的界面使用了分组样式的tableView实现,最后一个大区域是用了一个自定义Cell实现
- [x] 设置中只演示了清理缓存功能,以两个文件夹为例,演示清理本地缓存过程
- [x] 在自定义Cell按钮中,通过模型字段判断,如果是H5界面,会使用WebView来进行展示,这里使用了WKWebView
- [x] 在展示H5界面中,底部为自定义的Toolbar,实现了: 后退、前进和刷新界面功能,并进行了是否可以前进和后退的判断处理
<br>效果图:<br>
![我的](https://github.com/ShenYj/Bewilder/blob/master/02-我的_设置_H5展示.gif.gif?raw=true)
