DIR_ATUAL=$(dirname "$0")
ALIAS_PATH="alias evalu='bash ${DIR_ATUAL}/evalU.sh'"
BRC_PATH="~/Coding/Git/x"
STATE=cat $BRC_PATH |grep $ALIAS_PATH ==  ""
chmod u+x evalU.sh
if [ $STATE ];then
	echo $ALIAS_PATH >> ~/Coding/Git/x
fi
	
