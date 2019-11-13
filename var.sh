java=`echo $JAVA_HOME`
# echo $java
hadoop=`echo $HADOOP_HOME`
if [ -z $JAVA_HOME ];then
	echo "java环境不存在"
fi
if [ -z $hadoop ];then
	echo "hadoop环境已存在"
fi
