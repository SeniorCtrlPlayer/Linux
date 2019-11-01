# 颜色方案
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

i_jdk() {
	echo jdk
}

i_hadoop() {
	echo hadoop
}

autodeploy() {
	read -p "please input app path: " apppath
	# 如果路径不存在就创建路径
	if [ ! -d $apppath ]
	then
		mkdir -p apppath
		echo "the dir has been created"
	else
		echo "the dir exists"
	fi
	while :; do
		echo -e "..........安装环境..........\n"
		echo "1. jdk"
		echo -e "2. hadoop"
		echo -e "\n..........安装环境.........."
		read -p "请选择 1-2: " choose
		case $choose in
		1)
			i_jdk
			break;;
		2)
			i_hadoop
			break;;
		*)
			continue;;
		esac
	done
}

fix_hadoop() {
	# 修补hadoop配置
	file=$HADOOP_HOME/etc/hadoop/hadoop-env.sh
	grep "^export JAVA_HOME" $file &> /dev/null
	if [ $? -ne 0 ];then
		echo "不存在环境"
		sed -i "/# export JAVA_HOME=/a export JAVA_HOME=$JAVA_HOME" $file
	fi
}

while :; do
	echo -e "..........Hadoop环境部署脚本 by SCP..........\n"
	echo "1. 自动部署"
	echo "2. 修复配置"
	echo -e "\n..........Hadoop环境部署脚本 by SCP.........."
	read -p "$(echo 请选择1-2: )" choose
	case $choose in
	1)
		autodeploy
		break;;
	2)
		fix_hadoop
		break;;
	*);;
	esac
done
