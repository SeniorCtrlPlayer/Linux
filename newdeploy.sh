# color scheme                             
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

custom() {
	# wget, aria2, lrzsz, bash-completion
	# yum install -y wget aria2 lrzsz bash-completion

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
			echo "repo is already aliyun"
		fi
		;;
	"Ubuntu")
		echo "Ubuntu"
		;;
	*)
		echo "your system is unspported"
		;;
	esac
}

zsh() {
	echo "zsh"
	# oh-my-zsh
}

conda() {
	echo "miniconda"
	# miniconda
}

nvim() {
	echo "nvim"
	# nvim, ycm
}

hadoop() {
	echo "hadoop"
	# java, hadoop, hbase
}

while :; do
	echo -e "**********自动部署脚本**********\n"
	echo "1. custom"
	echo "2. zsh"
	echo "3. miniconda3"
	echo "4. nvim"
	echo "5. hadoop"
	echo "6. "
	echo -e "\n**********自动部署脚本**********"
	read -p "$(echo -e "请选择(q退出) ${red}1-2$none:" )" choose
	case $choose in
	1)
		custom
		;;
	2)
		;;
	3)
		;;
	4)
		;;
	5)
		;;
	6)
		;;
	q)
		break;;
	esac
done
