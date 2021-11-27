#!/bin/bash
# =====================================
# title             : main.sh
# description       : Este programa contiene 3 funciones principales, control de rendimiento (memoria, CPU, disco(s) y red), programacion de tareas (crontab y systemd) y copias de seguridad (tar)
# author            : Carlos Hernandez Navarro
# date              : 19/11/2021
# version			: 0.8
# =====================================

. ./func.sh
printf '\e[8;48;150t'
#=================MENUS PRINCIPALES===============
trap  ''  2
allmenus(){

	clear
	misc
	mainMenu
		case $OPC in
			1)
				clear
				performace
			;;
			2)
				clear
				progtareas
			;;
			3)
				clear
				backups
			;;
			0)
				clear
				exit
			;;
			*)
				clear
				echo "No has seleccionado una opcion valida"
				sleep 1s
				clear
				allmenus
			;;
		esac

}

mainMenu(){

	
	echo "1) Performance"
	echo "2) Programacion de tareas"
	echo "3) Backups"
	echo "0) Salir"
	read OPC
	return $OPC

}

performace(){

	misc
	echo "1) Memoria"
	echo "2) CPU"
	echo "3) Disco-I/O"
	echo "4) Network"
	echo "0) Volver"
	read PER
	case $PER in
		1)
			clear
			mem
		;;
		2)
			clear
			cpu
		;;
		3)
			clear
			disc
		;;
		4)
			clear
			net
		;;
		0)
			clear
			allmenus
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			performace
		;;
	esac

}

progtareas(){

	misc
	echo "1) Cron"
	echo "2) systemctl"
	echo "0) Volver"
	read PRO
	case $PRO in
		1)
			clear
			cron
		;;
		2)
			clear
			ctl
		;;
		0)
			clear
			allmenus
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			progtareas
		;;
	esac

}

backups(){

	misc
	echo "1) Completo"
	echo "2) Diferencial"
	echo "3) Incremental"
	echo "0) Volver"
	read BAC
	case $BAC in
		1)
			clear
			comp
		;;
		2)
			clear
			dif
		;;
		3)
			clear
			inc
		;;
		0)
			clear
			allmenus
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			backups
		;;
	esac

}

#=================================================




#=================MENU PERFORMACE=======================

mem(){

	misc
	echo "Memoria--------------|"
	echo -e "|-----> 1) Modo simple"
	echo -e "|-----> 2) Modo avanzado"
	echo -e "|-----> 0) Volver \n"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network"
	read MEM
	case $MEM in
		1)
			clear
			mem1sim
		;;
		2)
			clear
			mem2comp
		;;
		0)
			clear
			performace
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			mem
		;;
	esac

}

#------------------SUBMENU MEMORIA----------------

mem2comp(){

	misc
	echo "Memoria"
	echo "   Modo simple"
	echo "   Modo avanzado--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network"
	read MEM
	case $MEM in
		1)
			clear
			memcompsimp
		;;
		2)
			clear
			memcomp
		;;
		0)
			clear
			mem
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			mem2comp
		;;
	esac

}

mem1sim(){

	misc
	echo "Memoria"
	echo "   Modo simple--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "   Modo avanzado"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network"
	read MEM
	case $MEM in
		1)
			clear
			memsimp
		;;
		2)
			clear
			memsimpext
		;;
		0)
			clear
			mem
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			mem1sim
		;;
	esac

}

#-------------------------------------------------

cpu(){

	misc
	echo "Memoria"
	echo "CPU--------------|"
	echo -e "|-----> 1) Modo simple"
	echo -e "|-----> 2) Modo avanzado"
	echo -e "|-----> 0) Volver \n"
	echo "Disco-I/O"
	echo "Network"
	read CPU
	case $CPU in
		1)
			clear
			cpu1sim
		;;
		2)
			clear
			cpu2comp
		;;
		0)
			clear
			performace
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			cpu
		;;
	esac

}

#--------------------SUBMENU CPU------------------

cpu1sim(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "   Modo simple--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "   Modo avanzado"
	echo "Disco-I/O"
	echo "Network"
	read CPU
	case $CPU in
		1)
			clear
			cpusimp
		;;
		2)
			clear
			cpusimpext
		;;
		0)
			clear
			cpu
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			cpu1sim
		;;
	esac

}

cpu2comp(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "   Modo simple"
	echo "   Modo avanzado--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "Disco-I/O"
	echo "Network"
	read CPU
	case $CPU in
		1)
			clear
			cpucompsimp
		;;
		2)
			clear
			cpucomp
		;;
		0)
			clear
			cpu
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			cpu2comp
		;;
	esac

}

#-------------------------------------------------

disc(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O--------------|"
	echo -e "|-----> 1) Modo simple"
	echo -e "|-----> 2) Modo avanzado"
	echo -e "|-----> 0) Volver \n"
	echo "Network"
	read DIS
	case $DIS in
		1)
			clear
			disc1sim
		;;
		2)
			clear
			disc2comp
		;;
		0)
			clear
			performace
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			disc
		;;
	esac

}

#------------------SUBMENU DISCO------------------

disc1sim(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O"
	echo "   Modo simple--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "   Modo avanzado"
	echo "Network"
	read DIS
	case $DIS in
		1)
			clear
			discsimp
		;;
		2)
			clear
			discsimpext
		;;
		0)
			clear
			disc
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			disc1sim
		;;
	esac

}

disc2comp(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O"
	echo "   Modo simple"
	echo "   Modo avanzado--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "Network"
	read DIS
	case $DIS in
		1)
			clear
			disccompsimp
		;;
		2)
			clear
			disccomp
		;;
		0)
			clear
			disc
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			disc2comp
		;;
	esac

}

#-------------------------------------------------

net(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network--------------|"
	echo -e "|-----> 1) Interfaces"
	echo -e "|-----> 2) Puertos"
	echo -e "|-----> 0) Volver \n"
	read NET
	case $NET in
		1)
			clear
			net1sim
		;;
		2)
			clear
			net2comp
		;;
		0)
			clear
			performace
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			net
		;;
	esac

}

#--------------------SUBMENU RED------------------

net1sim(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network"
	echo "   Modo simple--------------|"
	echo -e "   |------>  1) Modo normal"
	echo -e "   |------>  2) Modo extendido"
	echo -e "   |------>  0) Volver \n"
	echo "   Modo avanzado"
	read NET
	case $NET in
		1)
			clear
			netsimp
		;;
		2)
			clear
			netsimpext
		;;
		0)
			clear
			net
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			net1sim
		;;
	esac

}

net2comp(){

	misc
	echo "Memoria"
	echo "CPU"
	echo "Disco-I/O"
	echo "Network"
	echo "   Modo simple"
	echo "   Modo avanzado---------------------|"
	echo -e "   |------>  1) Puertos por proceso"
	echo -e "   |------>  2) Puertos a la escucha"
	echo -e "   |------>  0) Volver \n"
	read NET
	case $NET in
		1)
			clear
			netcompsimp
		;;
		2)
			clear
			netcomp
		;;
		0)
			clear
			net
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			net2comp
		;;
	esac

}

#-------------------------------------------------

#=================================================


#=============MENU PROGAMACION DE TAREAS===================

#------------------SUBMENU CRON-------------------

cron(){

	misc
	touch crontabFile
	echo "Cron-------------------------------------|"
	echo -e "|-----> 1) Mostrar tareas programadas"
	echo -e "|-----> 2) Crear tarea programada"
	echo -e "|-----> 3) Eliminar una tarea"
	echo -e "|-----> 4) Eliminar todas las tareas"
	echo -e "|-----> 0) Volver \n"
	echo "systemctl"
	read CRO
	case $CRO in
		1)
			cronList
		;;
		2)
			cronCreate
		;;
		3)
			cronElim
			
		;;
		4)
			cronElimAll
			
		;;
		0)
			if [ -f crontabFile ]; then
				rm crontabFile 2> /dev/null
			fi
			clear
			progtareas
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			cron
		;;
	esac

}

#-------------------------------------------------

#------------------SUBMENU SYSTEMCTL--------------

ctl(){

	miscq
	echo "Cron"
	echo "systemctl--------------|"
	echo -e "|-----> 1) Listar tareas"
	echo -e "|-----> 2) Crear una tarea"
	echo -e "|-----> 3) Eliminar una tarea"
	echo -e "|-----> 0) Volver \n"
	read CTL
	case $CTL in
		1)
			sysList
		;;
		2)
			sysCreate
		;;
		3)
			sysElim

		;;
		0)
			clear
			progtareas
		;;
		*)
			clear
			echo "No has seleccionado una opcion valida"
			sleep 1s
			clear
			ctl
		;;
	esac

}

#-------------------------------------------------

#=================================================
allmenus 	
