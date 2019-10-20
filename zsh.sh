# 安装powerline字体
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
# cd ..
rm -rf fonts
# 字体测试
# echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"

# 安装zsh
sudo yum install -y zsh

# 配置zsh
# 安装oh-my-zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
wget -c https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh install.sh
# 修改主题配置文件
cmd1="cp zshrc ~/.zshrc"
sed -i "/	setup_zshrc/a \\$cmd1" install.sh
# 屏蔽用户名及主机名
cmd2="sed -i 's/  prompt_context/ #prompt_context/' ~/.oh-my-zsh/themes/agnoster.zsh-theme"
sed -i "/	setup_ohmyzsh/a \\$cmd2" install.sh
sh install.sh
