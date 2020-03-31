DIR_ATUAL=$(dirname "$0")
ALIAS_PATH="alias evalu='bash ${DIR_ATUAL}/evalU.sh'"
chmod u+x evalU.sh
if [[ cat ~/Coding/Git/x |grep ALIAS_PATH ==  "" ]]
