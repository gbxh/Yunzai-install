# 云崽机器人全自动安装脚本  
会慢慢适配更多系统的  
## Ubuntu系统  
### Ubuntu一键安装云崽3.0&喵喵插件（beta）
```
wget -O install.sh https://raw.githubusercontent.com/gbxh/Yunzai-install/main/Yunzai3-ubuntu.sh && sudo bash install.sh
```
### Ubuntu一键安装宝塔面板&云崽3.0&喵喵插件（beta）
适用于没有GUI的服务器，用起来更好
```
wget -O install.sh https://raw.githubusercontent.com/gbxh/Yunzai-install/main/Yunzai3withBaota-ubuntu.sh && sudo bash install.sh
```
脚本对比：
| 脚本对比 | 普通脚本 | Lite脚本  | 宝塔脚本 |
| ------------ | ----------- | ----------- | ----------- |
| 云崽主体 | √         | √         | √         |
| 云崽版本 | V3          | V3          | V3          |
| 宝塔面板 | ×          | ×          | √         |
| 喵喵插件 | √         | √         | √         |
| Node.Js      | V16         | V16         | V16         |
| Redis        | √         | √         | √         |
| Chrome       | √         | √         | √         |
| 字体       | 汉仪文黑85W | 汉仪文黑85W | 汉仪文黑85W |
| ffmpeg       | √         | ×          | √         |
| opencore-amr | √         | ×          | √         |
| python3      | √         | ×          | √         |
测试机型：[goormIDE](https://ide.goorm.io)免费容器（Ubuntu 18）  
实测没有问题，感谢[大佬的这篇帖子](https://github.com/Le-niao/Yunzai-Bot/issues/154)，受益匪浅
  
  
  
### 下一批适配的系统：centOS，Windows server
