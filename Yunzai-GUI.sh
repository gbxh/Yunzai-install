# 检查ROOT权限
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

clear

infotxt="云崽机器人+喵喵插件安装程序BY隔壁小胡"
bashdo="可交互式云崽机器人安装程序测试版"
shver="GUI1.0.0-beta"

green_font="\033[32m"
red_font="\033[31m"
green_bac="\033[42;37m"
red_fonted_bac="\033[41;37m"
color_suffix="\033[0m"

echo "____________________________________"
echo " "
echo -e "${green_font}${infotxt}${color_suffix}"
echo -e "${green_font}简介:${color_suffix} ${bashdo}"
echo -e "${green_font}版本号:${color_suffix} ${shver}"
echo "____________________________________"

function installlte(){
cd ~

echo -e "开始安装依赖库"
echo -e " "
echo -e " "

echo -e "下载NodeJS中"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
echo -e "完成"
echo -e " "

echo -e "安装NodeJS中"
sudo apt-get install -y nodejs
echo -e "完成"
echo -e " "

echo -e "安装Redis中"
sudo apt install redis redis-server -y
echo -e "完成"
echo -e " "

echo -e "安装chromium内核中"
sudo apt install chromium-browser -y
echo -e "完成"
echo -e " "

echo -e "安装运行库中"
sudo apt install libgbm-dev libasound2-dev -y
echo -e "完成"
echo -e " "

echo -e "下载微软雅黑字体中"
sudo apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
echo -e "完成"
echo -e " "

echo -e "开始安装主程序"
echo -e " "
echo -e " "

echo -e "下载云崽机器人主程序"
cd ~
git clone https://github.com/Le-niao/Yunzai-Bot.git
echo -e "完成"
echo -e " "

echo -e "下载喵喵插件"
cd ~/Yunzai-Bot
git clone https://github.com/yoimiya-kokomi/miao-plugin ./plugins/miao-plugin
echo -e "完成"
echo -e " "

echo -e "安装依赖库"
npm install moment
echo export PATH="~/.local/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
echo -e "完成"
echo -e " "

echo -e "安装PNPM"
cd ~/Yunzai-Bot
npm install pnpm -g
pnpm install -P
echo -e "完成"
echo -e " "

echo -e "安装imagesize并启动redis"
cd ~/Yunzai-Bot
npm install image-size
redis-server --save 900 1 --save 300 10 --daemonize yes
echo -e "完成"
echo -e " "
cd ~/Yunzai-Bot

    echo -e ""
    echo -e ""
    echo -e ""
    echo -e "云崽机器人安装完毕"
    echo -e "启动方法：node app"
    echo -e "后台运行指令：npm start"
    echo -e "后台记录日志指令：npm start log"
    echo -e ""
    echo -e ""
    echo -e ""

}
function installfull(){
cd ~

echo -e "开始安装依赖库"
echo -e " "
echo -e " "

echo -e "下载NodeJS中"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
echo -e "完成"
echo -e " "

echo -e "安装NodeJS中"
sudo apt-get install -y nodejs
echo -e "完成"
echo -e " "

echo -e "安装Redis中"
sudo apt install redis redis-server -y
echo -e "完成"
echo -e " "

echo -e "安装chromium内核中"
sudo apt install chromium-browser -y
echo -e "完成"
echo -e " "

echo -e "安装运行库中"
sudo apt install libgbm-dev libasound2-dev -y
echo -e "完成"
echo -e " "

echo -e "下载微软雅黑字体中"
sudo apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
echo -e "完成"
echo -e " "

echo -e "下载汉仪文黑字体中"
sudo apt install xfonts-utils -y
sudo apt install fontconfig -y
sudo mkdir -p /usr/share/fonts/truetype/mihoyo && cd /usr/share/fonts/truetype/mihoyo
sudo wget https://file.letsshareall.com/others/fonts/汉仪文黑-85W_Heavy.ttf -O HanyiWenhei85W-Heavy.ttf
sudo fc-cache -fv
echo -e "完成"
echo -e " "

echo -e "安装ffmpeg和opencore-amr"
sudo apt install gcc g++ make yasm -y
cd /usr/local/src
sudo wget https://sourceforge.net/projects/opencore-amr/files/opencore-amr/opencore-amr-0.1.5.tar.gz/download
sudo tar -xf download -C .
sudo mkdir opencore-amr-0.1.5/build && cd opencore-amr-0.1.5/build
sudo ../configure
sudo make && sudo make install
cd /usr/local/src
sudo git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
sudo mkdir ffmpeg/build && cd ffmpeg/build
sudo ../configure --enable-gpl --enable-version3 --enable-nonfree --disable-ffplay --disable-ffprobe --enable-libopencore-amrnb --enable-libopencore-amrwb
sudo make && sudo make install
echo -e "完成"
echo -e " "

echo -e "安装Python3"
sudo apt install -y zlib1g zlib1g-dev libffi-dev openssl libssl-dev
cd /usr/local/src
sudo wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tar.xz
sudo tar -xf Python-3.10.4.tar.xz
sudo mkdir Python-3.10.4/build && cd Python-3.10.4/build
sudo ../configure
sudo make && sudo make install
sudo rm -rf /usr/bin/python3
sudo ln -s /usr/bin/python3.10 /usr/bin/python3
sudo rm -rf /usr/bin/python
sudo ln -s /usr/bin/python3.10 /usr/bin/python
sudo rm -rf /usr/bin/pip
sudo ln -s /usr/bin/pip3.10 /usr/bin/pip
echo -e "完成"
echo -e " "

echo -e "--------------------------------------------------------"

echo -e "开始安装主程序"
echo -e " "
echo -e " "

echo -e "下载云崽机器人主程序"
cd ~
git clone https://github.com/Le-niao/Yunzai-Bot.git
echo -e "完成"
echo -e " "

echo -e "下载喵喵插件"
cd ~/Yunzai-Bot
git clone https://github.com/yoimiya-kokomi/miao-plugin ./plugins/miao-plugin
echo -e "完成"
echo -e " "

echo -e "安装依赖库"
npm install moment
echo export PATH="~/.local/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
echo -e "完成"
echo -e " "

echo -e "安装PNPM"
cd ~/Yunzai-Bot
npm install pnpm -g
pnpm install -P
echo -e "完成"
echo -e " "

echo -e "安装imagesize并启动redis"
cd ~/Yunzai-Bot
npm install image-size
redis-server --save 900 1 --save 300 10 --daemonize yes
echo -e "完成"
echo -e " "
cd ~/Yunzai-Bot

    echo -e ""
    echo -e ""
    echo -e ""
    echo -e "云崽机器人安装完毕"
    echo -e "启动方法：node app"
    echo -e "后台运行指令：npm start"
    echo -e "后台记录日志指令：npm run log"
    echo -e ""
    echo -e ""
    echo -e ""

}
function tukuai(){
echo -e "安装ffmpeg和opencore-amr"
sudo apt install gcc g++ make yasm -y
cd /usr/local/src
sudo wget https://sourceforge.net/projects/opencore-amr/files/opencore-amr/opencore-amr-0.1.5.tar.gz/download
sudo tar -xf download -C .
sudo mkdir opencore-amr-0.1.5/build && cd opencore-amr-0.1.5/build
sudo ../configure
sudo make && sudo make install
cd /usr/local/src
sudo git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
sudo mkdir ffmpeg/build && cd ffmpeg/build
sudo ../configure --enable-gpl --enable-version3 --enable-nonfree --disable-ffplay --disable-ffprobe --enable-libopencore-amrnb --enable-libopencore-amrwb
sudo make && sudo make install
echo -e "完成"
echo -e " "

echo -e "安装土块插件"
cd ~/Yunzai-Bot
git clone https://github.com/SmallK111407/earth-k-plugin.git ./plugins/earth-k-plugin/
echo -e "完成"
echo -e " "
}
function guoba(){
echo -e "安装锅巴插件"
cd ~/Yunzai-Bot
git clone --depth=1 https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/Guoba-Plugin/
echo -e "完成"
echo -e " "
}
function info(){
    
    echo -e "
    
    时间紧迫 暂无说明
    
    "
    
}
function menu(){
    echo " "
    echo -e "MADE BY 隔壁小胡"
    
    
    echo "____________________________________"
    echo " "
    echo "功能菜单"
    echo " "
    echo -e "1.${green_font}默认安装（推荐）${color_suffix}"
    echo " "
    echo "2.完全安装"
    echo " "
    echo "3.开启Yunzai-Bot后台加载"
    echo " "
    echo "4.启动Redis"
    echo " "
    echo "5.缺失组件修复（非专业人员慎点）"
    echo " "
	echo "6.安装土块插件"
    echo " "
	echo "7.安装锅巴插件"
    echo " "
    echo " "
    echo "0.关于本脚本"
    echo "____________________________________"
    echo " "
    read -p "请输入数字 :" num
    case "$num" in
    	1)
    	installlte
    	;;
    	2)
    	installfull
    	;;
    	3)
    	cd ~/Yunzai-Bot
		npm start
    	;;
    	4)
    	redis-server --save 900 1 --save 300 10 --daemonize yes
    	;;
    	5)
    	sudo apt install -y libatk1.0-0 libcups2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libpango-1.0-0 libcairo2
    	;;
	6)
    	tukuai
	;;
	7)
    	guoba
    	;;
    	0)
    	info
    	;;
    	*)
    	echo -e "${red_font}请输入正确数字 或者 Ctrl+C 终止脚本${color_suffix}"
    	sleep 2s
    	clear
    	menu
    	;;
    esac
}
menu
