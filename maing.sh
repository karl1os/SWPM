#!/bin/bash
# =====================================
# title             : main.sh
# description       : Este programa funciona en modo grafico via whiptail, contiene 3 funciones principales, control de rendimiento (memoria, CPU, disco(s) y red), programacion de tareas (crontab y systemd) y copias de seguridad (tar)
# author            : Carlos Hernandez Navarro
# date              : 19/11/2021
# version			: 0.8
# =====================================

. ./funcg.sh
#=================MENUS PRINCIPALES===============
trap  ''  2

fullscreen(){

	coman="wmctrl";
	same="fullscreen"
	volver="allmenus";
	installer "$coman" "$volver" "$same";
	wmctrl -r ':ACTIVE:' -b toggle,fullscreen
	whiptail --msgbox $(stty size)
	allmenus

}

mainMenu(){

	whiptail --msgbox $(stty size)
	OPC=$(whiptail --title "Modulo 6 UF 2" \
	               --menu "Elige una opción" 38 110 4 \
	               "1" "Performance" \
			 	   "2" "Programacion de tareas" \
			 	   "3" "Backups" \
			 	   "0" "Salir" \
	               3>&1 1<&2 2>&3)
	return $OPC

}

performace(){

	PER=$(whiptail --title "Modulo 6 UF 2" \
	               --menu "Menu de Rendimiento \n	Elige una opción:" 38 110 5 \
	               "1" "Memoria" \
			 	   "2" "CPU" \
			 	   "3" "Disco-I/O" \
			 	   "4" "Network" \
			 	   "0" "Volver" \
	               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				performace
			fi
		;;
	esac

}

progtareas(){

	PRO=$(whiptail --title "Modulo 6 UF 2" \
	               --menu "Menu de programacion de tareas \n	Elige una opción:" 38 110 3 \
	               "1" "Cron" \
			 	   "2" "systemctl" \
			 	   "0" "Volver" \
	               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				progtareas
			fi
		;;
	esac

}

backups(){

		BAC=$(whiptail --title "Modulo 6 UF 2" \
	               --menu "Menu de copias de seguridad \n	Elige una opción:" 38 110 4 \
	               "1" "Completo" \
			 	   "2" "Diferencial" \
			 	   "3" "Incremental" \
			 	   "0" "Volver" \
	               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				backups
			fi
		;;
	esac

}

#=================================================




#=================MENU PERFORMACE=======================

mem(){

	MEM=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de memoria \n	Elige una opción:" 38 110 3 \
               "1" "Modo simple" \
		 	   "2" "Modo avanzado" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				mem
			fi
		;;
	esac

}

#------------------SUBMENU MEMORIA----------------

mem2comp(){

	MEM=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de memoria AVANZADO\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				mem2comp
			fi
		;;
	esac

}

mem1sim(){
	MEM=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de memoria SIMPLE\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				mem1sim
			fi
		;;
	esac

}

#-------------------------------------------------

cpu(){
	CPU=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de CPU\n	Elige una opción:" 38 110 3 \
               "1" "Modo simple" \
		 	   "2" "Modo avanzado" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				cpu
			fi
		;;
	esac

}

#--------------------SUBMENU CPU------------------

cpu1sim(){
	CPU=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de CPU SIMPLE\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				cpu1sim
			fi
		;;
	esac

}

cpu2comp(){
	CPU=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de CPU AVANZADO\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				cpu2comp
			fi
		;;
	esac

}

#-------------------------------------------------

disc(){
	DIS=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de disco - I/O\n	Elige una opción:" 38 110 3 \
               "1" "Modo simple" \
		 	   "2" "Modo avanzado" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				disc
			fi
		;;
	esac

}

#------------------SUBMENU DISCO------------------

disc1sim(){
	DIS=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de disco - I/O SIMPLE\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				disc1sim
			fi
		;;
	esac

}

disc2comp(){
	DIS=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de disco - I/O AVANZADO\n	Elige una opción:" 38 110 3 \
               "1" "Modo normal" \
		 	   "2" "Modo extendido" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				disc2comp
			fi
		;;
	esac

}

#-------------------------------------------------

net(){
	NET=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de red\n	Elige una opción:" 38 110 3 \
               "1" "Interfaces" \
		 	   "2" "Puertos" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				net
			fi
		;;
	esac

}

#--------------------SUBMENU RED------------------

net1sim(){
	NET=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de red (INTERFACES)\n	Elige una opción:" 38 110 3 \
               "1" "Informacion simplificada" \
		 	   "2" "Informacion extendida" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				net1sim
			fi
		;;
	esac

}

net2comp(){
	NET=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de rendimiento de red (PUERTOS)\n	Elige una opción:" 38 110 3 \
               "1" "Puertos por proceso" \
		 	   "2" "Puertos a la escucha" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				net2comp
			fi
		;;
	esac

}

#-------------------------------------------------

#=================================================


#=============MENU PROGAMACION DE TAREAS===================

#------------------SUBMENU CRON-------------------

cron(){

	touch crontabFile
	CRO=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de programacion de tareas\n	Elige una opción:" 38 110 5 \
               "1" "Mostrar tareas programadas" \
		 	   "2" "Crear tarea programada" \
		 	   "3" "Eliminar una tarea" \
		 	   "4" "Eliminar todas las tareas" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				cron
			fi
		;;
	esac

}

#-------------------------------------------------

#------------------SUBMENU SYSTEMCTL--------------

ctl(){
	CTL=$(whiptail --title "Modulo 6 UF 2" \
               --menu "Menu de programacion de tareas\n	Elige una opción:" 38 110 4 \
               "1" "Listar tareas" \
		 	   "2" "Crear una tarea" \
		 	   "3" "Eliminar una tarea" \
		 	   "0" "Volver" \
               3>&1 1<&2 2>&3)
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
			if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
			then
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			else
				ctl
			fi
		;;
	esac

}

#-------------------------------------------------

#=================================================
fullscreen
