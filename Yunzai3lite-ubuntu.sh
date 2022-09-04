curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install redis redis-server -y
sudo apt install chromium-browser -y
sudo apt install libgbm-dev libasound2-dev -y
sudo apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
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
source ~/.bashrc
cd ~/Yunzai-Bot
npm install pnpm -g
pnpm install -P
cd ~/Yunzai-Bot
npm install image-size
redis-server --save 900 1 --save 300 10 --daemonize yes
node app
