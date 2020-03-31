#!/bin/bash

compil="----PROGRAMA COMPILADO SEM ERROS----"
p_py="CÓDIGO EM PYTHON..."
p_cpp="CÓDIGO EM C++..."
p_c="CÓDIGO EM C..."
succM="Lido de std.in e gerada saída em std.out com Sucesso!"
succB="Gerado arquivo .out com Sucesso!"
succV="Rodado com sucesso!"
nomePrg=$1
PrgLen=${#nomePrg}
if [ "$1" != "" ];then
	if [[ "$1" == *".py"* ]];then
		echo $p_py
		echo "Criando "${nomePrg:0:PrgLen-3}"..."
		python ${nomePrg:0:PrgLen-3} < std.in > std.out && echo succM
			#Arg [null] => Compila e roda com arquivos de in e out
			#Arg [-v] => Re-roda se houver arquivo "programa".out com arquivos de in e out
			#Arg [-b] => Compila e gera "programa.out"
	elif [[ "$1" == *".cpp"* ]];then
		echo $p_cpp
		echo "Criando "${nomePrg:0:PrgLen-4}"..."
		if [ "$2" == "" ];then
			g++ -Wall -O2 $nomePrg -o ${nomePrg:0:PrgLen-4}".out" && ./${nomePrg:0:PrgLen-4}".out" < std.in > std.out && echo $succM
		
		elif [ "$2" == "-v" ];then
			if [ -s ${nomePrg:0:PrgLen-4}".out" ];then
				./${nomePrg:0:PrgLen-4}".out"< std.in > std.out && echo $succV
			else
				echo "Não há programas compilados desse código aqui!"
			fi  
		elif [ "$2" == "-b" ];then
			g++ -Wall -O2 $nomePrg -o ${nomePrg:0:PrgLen-4}".out" && echo $succB
		else
			echo "Argumento desconhecido!"
		fi

	elif [[ "$1" == *".c"* ]];then
		echo $p_c
		if [ "$2" == "-s" ];then
			gcc -Wall -O2 nomePrg -o ${nomePrg:0:PrgLen-2}".out" && ./${nomePrg:0:PrgLen-2}".out" < std.in > std.out
		elif [ "$2" == "-n" ];then
			gcc -Wall -ansi -pedantic -O2 nomePrg -o ${nomePrg:0:PrgLen-2}".out"
			clear
			./${nomePrg:0:PrgLen-2}".out"
		else
			echo "Sem argumentos, usando modo básico"
			gcc nomePrg -o ./${nomePrg:0:PrgLen-2}".out" && clear && ./${nomePrg:0:PrgLen-2}".out"
		fi

	else
		echo "Não foi possível identificar a extensão do programa!"
	fi
else
	echo "Sem argumentos! Saindo..."
fi
