# 屏蔽command的标准/错误输出
# git --version > /dev/null 2>&1
# 屏蔽command的所有输出
# git --version &> /dev/null

# 传递的参数为数组
# a=(git wget)
# 传递的为数组的第一个参数
# echo "$a"

# 检查是否含有某命令
function check(){
# 使用示例
#########################
# a=(git wget)
# check "${a[*]}"
#########################
	cmds=$1
	for cmd in ${cmds[*]}; do
		check=`which $cmd &> /dev/null`
		if [ $? -eq 0 ];then
			echo "yes"
		else
			yum install $cmd -y
		fi
	done
}
check wget

:<<EOF
yum install -y gcc gcc-c++ ncurses-devel python3-devel

# 清除vim，并安装nvim
sudo yum remove vim vi vim-common vim-tiny

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
neovim python3-neovim cmake ctags
i
# 安装自动补全脚本
# wget https://github.com/junegunn/vim-plug/raw/master/plug.vim -C
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive

cd ~/.vim/plugged/YouCompleteMe
python install.py

pip install pynvim -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
EOF
