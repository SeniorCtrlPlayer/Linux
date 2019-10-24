# 屏蔽command的标准/错误输出
# git --version > /dev/null 2>&1
# 屏蔽command的所有输出
# git --version &> /dev/null

# 传递的参数为数组
# a=(git wget)
# 传递的为数组的第一个参数
# echo "$a"
# 传递的为数组
# echo "${a[*]}"

# 清除自带的 vi/vim && 安装完整版 vim
# sudo yum remove vi vim-common vim-tiny -y && yum install vim -y

# 检查是否含有某命令
function check(){
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

# 测试是否含有命令数组
a=(git wget)
check "${a[*]}"
