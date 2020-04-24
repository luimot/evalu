#!/bin/bash

COMPIL="!---PROGRAMA COMPILADO SEM ERROS---!"
P_PY="CÓDIGO EM PYTHON..."
P_CPP="CÓDIGO EM C++..."
P_C="CÓDIGO EM C..."
SUCC_M="Lido de std.in e gerada saída em std.out com Sucesso!"
SUCC_B="Gerado arquivo .out com Sucesso!"
SUCC_V="Rodado com sucesso!"
nomePrg=$1
PrgLen=${#nomePrg}
if [ "$1" != "" ];then
	if [[ "$1" == *".py"* ]];then
		echo $P_PY
		echo "Criando "${nomePrg:0:PrgLen-3}"..."
		python ${nomePrg:0:PrgLen-3} < std.in > std.out && echo SUCC_M
			#Arg [null] => Compila e roda com arquivos de in e out
			#Arg [-v] => Re-roda se houver arquivo "programa".out com arquivos de in e out
			#Arg [-b] => Compila e gera "programa.out"
	elif [[ "$1" == *".cpp"* ]];then
		echo $P_CPP
		echo "Criando "${nomePrg:0:PrgLen-4}"..."
		if [ "$2" == "" ];then
			g++ -Wall -O2 $nomePrg -o ${nomePrg:0:PrgLen-4}".out" && ./${nomePrg:0:PrgLen-4}".out" < std.in > std.out && echo $COMPIL && echo $SUCC_M
		
		elif [ "$2" == "-v" ];then
			if [ -s ${nomePrg:0:PrgLen-4}".out" ];then
				./${nomePrg:0:PrgLen-4}".out"< std.in > std.out && echo $SUCC_V
			else
				echo "Não há programas compilados desse código aqui!"
			fi  
		elif [ "$2" == "-b" ];then
			g++ -Wall -O2 $nomePrg -o ${nomePrg:0:PrgLen-4}".out" && echo COMPIL && echo $SUCC_B
		else
			echo "Argumento desconhecido!"
		fi

			#Arg [null] => Compila com só o básico e roda
			#Arg [-v] => Compila e roda com arquivos de in e out
			#Arg [-b] => Compila e gera "programa.out"
	elif [[ "$1" == *".c"* ]];then
		echo $P_C
		if [ "$2" == "-b" ];then
			gcc -Wall -O2 $nomePrg -o ${nomePrg:0:PrgLen-2}".out" && ./${nomePrg:0:PrgLen-2}".out" < std.in > std.out
		elif [ "$2" == "-v" ];then
			gcc -Wall -ansi -pedantic -O2 $nomePrg -o ${nomePrg:0:PrgLen-2}".out" && ./${nomePrg:0:PrgLen-2}".out"
		else
			echo "Sem argumentos, usando modo básico"
			gcc $nomePrg -o ./${nomePrg:0:PrgLen-2}".out" && ./${nomePrg:0:PrgLen-2}".out"
		fi

	else
		echo "Não foi possível identificar a extensão do programa!"
	fi
else
	echo "Sem argumentos! Saindo..."
fi
