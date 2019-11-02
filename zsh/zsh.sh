# 安装oh-my-zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
wget -O install.sh https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# 安装zsh
sudo yum install -y zsh

# 配置zsh
# 修改主题配置文件
cmd1="cp zshrc ~/.zshrc"
sed -i "/	setup_zshrc/a \\$cmd1" install.sh
# 屏蔽用户名及主机名
cmd2="sed -i 's/  prompt_context/ #prompt_context/' ~/.oh-my-zsh/themes/agnoster.zsh-theme"
sed -i "/	setup_ohmyzsh/a \\$cmd2" install.sh
./install.sh
