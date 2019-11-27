# color scheme                             
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : lwk
#   Email         : 510062390@qq.com
#   File Name     : newdeploy.sh
#   Last Modified : 2019-11-27 21:53
#   Describe      :
#
# ====================================================

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'
_red() { echo -e ${red}$*${none}; }
_green() { echo -e ${green}$*${none}; }
_yellow() { echo -e ${yellow}$*${none}; }
_magenta() { echo -e ${magenta}$*${none}; }
_cyan() { echo -e ${cyan}$*${none}; }
# example
# _red "helloworld"


# 获取系统发行版本
release=`lsb_release -a | grep "Distributor ID:"`
OS_name=${release:16}
echo "your system is $OS_name"

check() {
# 使用示例                                                             
#########################                                              
# a=(git wget)                                                         
# check "${a[*]}"                                                      
# check wget
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

custom_install() {
	# done
	# wget, aria2, lrzsz, bash-completion
	yum install -y wget aria2 lrzsz bash-completion tree htop

	case $OS_name in
	"CentOS")
		grep "aliyun" /etc/yum.repos.d/CentOS-Base.repo &> /dev/null
		if [ $? -ne 0 ];then
			# backup repo
			mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
			# update repo
			wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
			# make cache
			yum makecache
		else
			_green "repo is already"
		fi
		;;
	*)
		_red "only support CentOS"
		;;
	esac
}

git_install() {
	# done
	# install
	yum install -y git
	_green "git has been installed"
	# DNS to speed git
	sed -i '$a\140.82.114.4 github.com' /etc/hosts
	# set email and name
	git config --global user.email "510062390@qq.com"
	git config --global user.name "SeniorCtrlPlayer"
}

zsh_install() {
	echo "zsh"
	cd zsh
	./powerline.sh
	# oh-my-zsh
}

nvim_install() {
	# realitive
	yum install -y cmake gcc gcc-c++ ncurses-devel ctags
	# remove vim
	yum remove vim vi vim-common vim-tiny
	# nvim
	yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	yum install -y neovim python3-neovim
	# 插件管理器
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	py_V=`python -V 2>&1|awk '{print $2}'|awk -F '.' '{print $1}'`
	if [[ $py_V -ne "3" ]];then
		_red "your py_version is not python3"
	else
		pip install pynvim -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
	fi
}

hadoop_install() {
	echo "hadoop"
	# java, hadoop, hbase
}

while :; do
	echo -e "**********自动部署脚本**********\n"
	echo "1. custom"
	echo "2. zsh"
	echo "3. git"
	echo "4. nvim"
	echo "5. hadoop"
	echo -e "\n**********自动部署脚本**********"
	read -p "$(echo -e "请选择(q退出) ${red}1-5$none:" )" choose
	case $choose in
	1)
		custom_install
		;;
	2)
		git_install
		;;
	3)
		;;
	4)
		nvim_install
		;;
	5)
		;;
	q)
		break;;
	esac
done
