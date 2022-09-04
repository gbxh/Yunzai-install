curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt update && sudo apt install nodejs -y
sudo apt install redis redis-server -y
sudo apt install chromium-browser -y
sudo apt install libgbm-dev libasound2-dev -y
sudo apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
sudo apt install xfonts-utils -y
sudo apt install fontconfig -y
sudo mkdir -p /usr/share/fonts/truetype/mihoyo && cd /usr/share/fonts/truetype/mihoyo
sudo wget https://file.letsshareall.com/others/fonts/汉仪文黑-85W_Heavy.ttf -O HanyiWenhei85W-Heavy.ttf
sudo fc-cache -fv
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
sudo echo "/usr/local/lib" >> /etc/ld.so.conf
sudo ldconfig
sudo apt install -y zlib1g zlib1g-dev libffi-dev openssl libssl-dev
cd /usr/local/src
sudo wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tar.xz
sudo tar -xf Python-3.10.4.tar.xz
sudo mkdir Python-3.10.4/build && cd Python-3.10.4/build
sudo ../configure
sudo make && sudo make install
cd ~
git clone https://github.com/Le-niao/Yunzai-Bot.git
cd ~/Yunzai-Bot
git clone https://github.com/yoimiya-kokomi/miao-plugin ./plugins/miao-plugin
npm install moment
cd ~/Yunzai-Bot
git clone https://github.com/lcwf/python-plugin.git ./plugins/python-plugin
npm install node-schedule
cd ~/Yunzai-Bot/plugins/python-plugin
pip install -r requirement.txt
echo export PATH="~/.local/bin:$PATH" >> ~/.bashrc
source ./bashrc
cd ~/Yunzai-Bot
npm install
cd ~/Yunzai-Bot
redis-server --save 900 1 --save 300 10 --daemonize yes
node app
