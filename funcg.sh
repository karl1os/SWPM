#!/bin/bash
# =====================================
# title             : func.sh
# description       : Aqui se encuentran todas las funciones del programa
# author            : Carlos Hernandez Navarro
# date              : 19/11/2021
# version			: 0.8
# =====================================

allmenus(){
	
	whiptail --msgbox $(stty size)
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
				wmctrl -r ':ACTIVE:' -b remove,fullscreen
				exit
			;;
			*)
				if (whiptail --title "Advertencia" --yesno "Esta apunto de salir, realmente desea hacerlo?" 38 110);
				then
					wmctrl -r ':ACTIVE:' -b remove,fullscreen
					exit
				else
					allmenus
				fi
			;;
		esac

}

#///memoria///

memsimp(){

	coman="free";
	uso="Muestra la memoria disponible i/o en uso RAM y swap";
	salida="cat ./memsimp.txt"
	free -h > memsimp.txt
	elim="./memsimp.txt"
	help="\ttotal: muestra la memoria total \n\tused: muestra la memoria usada \n\tfree: 
	muestra la memoria libre \n\tshared: memoria compartida por múltiples procesos \n\t
	buff: memoria reservada por el sistema\n\tcache: archivos usados recientemente 
	almacenados en RAM \n\tavalible: memoria disponible \n";
	volver="mem1sim";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

memsimpext(){

	coman="watch -n 1 free -h";
	uso="Muestra la memoria disponible i/o en uso RAM y swap con actualizaciones cada segundo";
	salida="cat ./memsimp.txt"
	free -tlh > memsimp.txt
	elim="./memsimp.txt"
	help="\ttotal: muestra la memoria total \n\tused: muestra la memoria usada \n\tfree: 
	muestra la memoria libre \n\tshared: memoria compartida por múltiples procesos \n\t
	buff: memoria reservada por el sistema\n\tcache: archivos usados recientemente 
	almacenados en RAM \n\tavalible: memoria disponible \n";
	volver="mem1sim";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

memcompsimp(){

	awk 'NR==6,NR==14 {print}' /proc/meminfo | column -t > memcomptmp.txt
	awk '$3=="kB"{$2=$2/1024;$3="MB"} 1' memcomptmp.txt | column -t > memcomp.txt
	rm memcomptmp.txt;
	coman="cat /proc/meminfo";
	uso="Muestra cierta informacion avanzada de RAM y swap";
	salida="cat ./memcomp.txt";
	elim="./memcomp.txt"
	help="\tSwapCached: memoria duplicada en RAM y SWAP\n\tActive/Inactive: Memoria que 
	se ha usado recientemente y no se ha intercambiado o la inversa\n\tActive/Inactive(anon): Memoria anonima que 
	se ha usado recientemente y no se ha intercambiado o la inversa\n\tActive(archivo): Memoria de cache de pagina que 
	se ha usado recientemente y no se recupera hasta que se necesita\n\tInactive(archivo): Memoria de caché de página 
	que se puede recuperar sin un gran impacto en el rendimiento\n\tMas info: https://access.redhat.com/solutions/406773\n";
	volver="mem2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";	

}

memcomp(){

	awk 'NR==6,NR==14 {print}' /proc/meminfo | column -t > memcomptmp.txt
	awk 'NR==16,NR==36 {print}' /proc/meminfo | column -t >> memcomptmp.txt
	awk 'NR==51,NR==53 {print}' /proc/meminfo | column -t >> memcomptmp.txt
	awk '$3=="kB"{$2=$2/1024;$3="MB"} 1' memcomptmp.txt | column -t > memcomp.txt
	rm memcomptmp.txt;
	coman="cat /proc/meminfo";
	uso="Muestra informacion avanzada de RAM y swap";
	salida="cat ./memcomp.txt";
	elim="./memcomp.txt"
	help="\tSwapCached: memoria duplicada en RAM y SWAP\n\tActive/Inactive: Memoria que 
	se ha usado recientemente y no se ha intercambiado o la inversa\n\tMapped: Archivos 
	que se han mapeado, como bibliotecas\n\tPageTables: Cantidad de memoria dedicada al 
	nivel más bajo de tablas de página\n\tDirectMap4k/2M/1G: la cantidad de memoria que se 
	asigna a páginas estándar de 4kb, 2MB o 1GB\n\tMas info: 
	https://access.redhat.com/solutions/406773\n";
	volver="mem2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";	

}
#/////



#///CPU///

cpusimp(){

	coman="inxi";
	same="cpusimp"
	volver="cpu1sim";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre la CPU";
	salida="inxi -C"
	elim="./cpusimp.txt"
	help="\tTopology: Muestra la configuracion fisica de los nucleos en la CPU\n\tModel: 
	Muestra el modelo de CPU\n\tBits: Muestra la arquitectura en bits de la CPU\n\tType: 
	Muestra el tipo de CPU: \n\t\tMT: CPU multi / hiperproceso, más de 1 subproceso por núcleo.
	\n\t\tMCP: Procesador de múltiples núcleos (más de 1 núcleo por CPU)\n\t\tSMP: Procesamiento 
	múltiple simétrico (más de 1 CPU física)\n\t\tUP: Procesador Uni (un solo núcleo)\n\tCache: 
	Muestra los diferentes niveles de memoria cache de la CPU\n\tSpeed: Muestra las velocidades 
	Actual, Max/Min asi como el de cada nucleo por separado(frequencia)\n";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

cpusimpext(){

	coman="inxi";
	same="cpusimp"
	volver="cpu1sim";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre la CPU";
	salida="inxi -Cf"
	elim="./cpusimp.txt"
	help="\tTopology: Muestra la configuracion fisica de los nucleos en la CPU\n\tModel: 
	Muestra el modelo de CPU\n\tBits: Muestra la arquitectura en bits de la CPU\n\tType: 
	Muestra el tipo de CPU: \n\t\tMT: CPU multi / hiperproceso, más de 1 subproceso por núcleo.
	\n\t\tMCP: Procesador de múltiples núcleos (más de 1 núcleo por CPU)\n\t\tSMP: Procesamiento 
	múltiple simétrico (más de 1 CPU física)\n\t\tUP: Procesador Uni (un solo núcleo)\n\tCache: 
	Muestra los diferentes niveles de memoria cache de la CPU\n\tSpeed: Muestra las velocidades 
	Actual, Max/Min asi como el de cada nucleo por separado(frequencia)\n\tFlags: Muestra el 
	registro de estado actual del procesador\n";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

cpucompsimp(){

	lscpu > cpucomptmp.txt
	awk 'NR==1,NR==2 {print}' ./cpucomptmp.txt > cpucomp.txt
	awk 'NR==5,NR==8 {print}' ./cpucomptmp.txt >> cpucomp.txt
	awk 'NR==11,NR==15 {print}' ./cpucomptmp.txt >> cpucomp.txt
	rm cpucomptmp.txt;
	coman="lscpu";
	uso="Muestra informacion avanzada sobre la CPU";
	salida="cat ./cpucomp.txt";
	elim="./cpucomp.txt"
	help="\tArquitectura: arquitectura de la CPU (x86 x64)\n\tModo de operacion: Indica 
	el modo de arquitectura del procesador con el que puede operar\n\tCPU(s): Indica la 
	cantidad total de CPUs (físicos y virtuales)\n\tID de fabricante: Muestra el nombre 
	del fabricante del procesador\n\tNombre del modelo: imprime el nombre y modelo 
	completo del procesador\n\tCPU MHz: indica los distintos rangos de frecuencia con los
	 que trabaja el procesador\n\tCaché: Capacidad de memoria cache de los distintos 
	 niveles\n\tMas informacion: https://denovatoanovato.net/comando-lscpu/\n";
	volver="cpu2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

cpucomp(){

	lscpu > cpucomptmp.txt
	awk 'NR==1,NR==24 {print}' ./cpucomptmp.txt > cpucomp.txt
	rm cpucomptmp.txt;
	coman="lscpu";
	uso="Muestra informacion avanzada sobre la CPU";
	salida="cat ./cpucomp.txt";
	elim="./cpucomp.txt"
	help="\tArquitectura: arquitectura de la CPU (x86 x64)\n\tModo de operacion: Indica 
	el modo de arquitectura del procesador con el que puede operar\n\tCPU(s): Indica la 
	cantidad total de CPUs (físicos y virtuales)\n\tID de fabricante: Muestra el nombre 
	del fabricante del procesador\n\tNombre del modelo: imprime el nombre y modelo 
	completo del procesador\n\tCPU MHz: indica los distintos rangos de frecuencia con los
	 que trabaja el procesador\n\tCaché: Capacidad de memoria cache de los distintos 
	 niveles\n\tMas informacion: https://denovatoanovato.net/comando-lscpu/\n";
	volver="cpu2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}
#/////



#///disc///
discsimp(){

	coman="df --total -h";
	same="discsimp"
	volver="disc1sim";
	uso="Muestra informacion global sobre los discos duros";
	salida="df --total -h | awk 'NR==1{print} END{print}'"
	help="\ts.ficheros: Muestra el disco o directorio analizado\n\tTamaño: Muestra el 
	tamaño total de memoria\n\tUsados: Muestra cuanta memoria esta siendo usada\n\tDisp: 
	Muestra cuanta memoria queda disponible\n\tUso: Muestra en porcentaje cuanta 
	memoria esta en uso\n\tMontado: Muestra en que lugar logico se encuentra el disco 
	o directorio\n";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

discsimpext(){

	coman="df --total -h";
	same="discsimp"
	volver="disc1sim";
	uso="Muestra informacion global sobre los discos duros";
	salida="df --total -h"
	help="\ts.ficheros: Muestra el disco o directorio analizado\n\tTamaño: Muestra el 
	tamaño total de memoria\n\tUsados: Muestra cuanta memoria esta siendo usada\n\t
	Disp: Muestra cuanta memoria queda disponible\n\tUso: Muestra en porcentaje cuanta 
	memoria esta en uso\n\tMontado: Muestra en que lugar logico se encuentra el disco 
	o directorio\n";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

disccompsimp(){

	coman="ioping";
	same="disccompsimp"
	volver="disc2comp";
	installer "$coman" "$volver" "$same";
	uso="Mida la latencia en /dev/sda utilizando 5 solicitudes de lectura/escritura";
	salida="sudo ioping -c 5 /dev/sda | tail -4"
	help="\tPrimera linea: Muestra primeramente sobre que directorio se ha realizado la prueba
	 (/dev/sda)\n\tTambien muestra el tamaño total del directorio o disco\n\tSegunda linea: 
	 Muestra el numero de peticiones completadas, el tiempo que ha tardado, tamaño de datos 
	 leidos, operaciones de lectura/escritura por segundo (iops) y la velocidad de estas.
	 \n\tTercera linea: muestras las peticiones generadas con los mimsmos campos que la segunda 
	 linea\n\tQuarta linea: tiempo minimo, tiempo medio, tiempo maximo y desviacion estandar de 
	 las operaciones\n";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

disccomp(){

	coman="ioping";
	same="disccomp"
	volver="disc2comp";
	installer "$coman" "$volver" "$same";
	uso="Mide la tasa de búsqueda de /dev/sda";
	salida="sudo ioping -R /dev/sda"
	help="\tPrimera linea: \n\t\tMuestra primeramente sobre que directorio se ha realizado la prueba
	 (/dev/sda)\n\t\tTambien muestra el tamaño total del directorio o disco\n\tSegunda linea: 
	 \n\t\tMuestra el numero de peticiones completadas\n\t\tel tiempo que ha tardado\n\t\ttamaño de datos 
	 leidos\n\t\toperaciones de lectura/escritura por segundo (iops) y la velocidad de estas.
	 \n\tTercera linea: \n\t\tmuestras las peticiones generadas con los mimsmos campos que la segunda 
	 linea\n\tQuarta linea: \n\t\ttiempo minimo\n\t\ttiempo medio\n\t\ttiempo maximo\n\t\tdesviacion estandar de 
	 las operaciones\n";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

#/////



#///NET///
netsimp(){

	coman="net-tools";
	same="netsimp"
	volver="net1sim";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre las interfaces de red";
	salida="cat netinfo.txt"
	ip a | grep enp > netinfo.txt
	ifconfig | awk '/lo:/{print}' >> netinfo.txt
	ifconfig | sed '1,/lo/d' | awk 'NR==1{print}' >> netinfo.txt
	elim="./netinfo.txt"
	help="\teth0/enp0s3: Nombre de la interfaz\n\tBROADCAST: Es una interfaz de transmisión, 
	lo que significa que tiene una dirección de transmisión válida\n\tMULTICAST: Admite multidifusión
	\n\tUP: La interfaz se ha habilitado y se está ejecutando\n\tLOWER_UP: Hay actividad de señal en 
	la capa física (hay un cable enchufado)\n\tmtu 1500: La unidad de transferencia máxima es 1500
	\n\tqdisc pfifo_fast: Se usa para el estado de cola\n\tstate UP: La interfaz de red está 
	funcionando\n\tgroup default: Grupo de interfaz\n\tqlen 1000: Longitud de la cola de transmisión
	\n\tinet: Direccion IP\n\t brd: direccion de broadcast\n";
	volver="net1sim";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

netsimpext(){

	coman="net-tools";
	same="netsimpext"
	volver="net1sim";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre las interfaces de red";
	salida="ifconfig"
	help="\teth0/enp0s3: Nombre de la interfaz\n\tBROADCAST: Es una interfaz de transmisión, 
	lo que significa que tiene una dirección de transmisión válida\n\tMULTICAST: Admite multidifusión
	\n\tUP: La interfaz se ha habilitado y se está ejecutando\n\tLOWER_UP: Hay actividad de señal en 
	la capa física (hay un cable enchufado)\n\tmtu 1500: La unidad de transferencia máxima es 1500
	\n\tqdisc pfifo_fast: Se usa para el estado de cola\n\tstate UP: La interfaz de red está 
	funcionando\n\tgroup default: Grupo de interfaz\n\tqlen 1000: Longitud de la cola de transmisión
	\n\tinet: Direccion IP\n\t brd: direccion de broadcast\n";
	volver="net1sim";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

netcompsimp(){

	coman="lsof";
	same="netcompsimp"
	volver="net2comp";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre los puertos (mas comunes) en uso por proceso";
	salida="sudo lsof -i:22,80,443,21";
	help="\tCOMMAND: Muestra que comando esta usando el puerto\n\tPID: Identificador del proceso\n\tUSER: 
	Muestra que usuario esta haciendo uso de ese proceso\n\tFD: Número de descriptor del puerto\n\tTYPE: 
	Tipo de nodo asociado con el puerto\n\tNODE: Muestra el protocolo de conexion\n\tNAME: Descripcion 
	del puerto y otras caracteristicas\n";
	volver="net2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver";

}

netcomp(){

	coman="lsof";
	same="netcompsimp"
	volver="net2comp";
	installer "$coman" "$volver" "$same";
	uso="Muestra informacion sobre los puertos en escucha (LISTEN)";
	salida="cat netcomp.txt";
	sudo lsof -i -P -n | awk NR==1'{print}' > netcomp.txt
	sudo lsof -i -P -n | grep LISTEN >> netcomp.txt
	elim="netcomp.txt"
	help="\tCOMMAND: Muestra que comando esta usando el puerto\n\tPID: Identificador del proceso\n\tUSER: 
	Muestra que usuario esta haciendo uso de ese proceso\n\tFD: Número de descriptor del puerto\n\tTYPE: 
	Tipo de nodo asociado con el puerto\n\tNODE: Muestra el protocolo de conexion\n\tNAME: Descripcion 
	del puerto y otras caracteristicas\n";
	volver="net2comp";
	result "$coman" "$uso" "$salida" "$help" "$volver" "$elim";

}

#/////



#progtareas
#=========
#///CRON///

cronList(){

	crontab -l > crontabFile
	if [[ -s crontabFile ]] ; 
	then
		whiptail --title "CRONTTAB" \
               --textbox ./crontabFile 38 110 \;
	else
		whiptail --title "CRONTTAB" --msgbox "No hay tareas que mostrar" 38 110
	fi
	clear
	cron

}

cronCreate(){

	valid="1";
	while [[ $valid == 1 ]]; do
		minut=$(whiptail --inputbox "Introduce el minuto(s) en el que quieres que se ejecute (0-59) o * cada minuto" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ $minut = [a-zA-Z]* ]]; then
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		elif [[ $minut = "*" ]]
		then
			valid="2";
		elif [[ $minut -ge 0 && $minut -le 59 ]] 
		then
			valid="2";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	while [[ $valid == 2 ]]; do
		hora=$(whiptail --inputbox "Introduce la hora(s) en la que quieres que se ejecute (0-23) o * para cada hora" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ $hora = [a-zA-Z]* ]]; then
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		elif [[ $hora = "*" ]]
		then
			valid="3";
		elif [[ $hora -ge 0 && $hora -le 23 ]] 
		then
			valid="3";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	while [[ $valid == 3 ]]; do
		dia=$(whiptail --inputbox "Introduce el dia del mes (1-31) o * para cada dia" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ $dia = [a-zA-Z]* ]]; then
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		elif [[ $dia = "*" ]]
		then
			valid="4";
		elif [[ $dia -ge 1 && $dia -le 31 ]] 
		then
			valid="4";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	while [[ $valid == 4 ]]; do
		mes=$(whiptail --inputbox "Introduce el mes (1-12) o * para cada mes" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ $mes = [a-zA-Z]* ]]; then
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		elif [[ $mes = "*" ]]
		then
			valid="5";
		elif [[ $mes -ge 1 && $mes -le 12 ]] 
		then
			valid="5";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	while [[ $valid == 5 ]]; do
		semana=$(whiptail --inputbox "Introduce el dia de la semana (0=Domingo, 1-Lunes etc) o * para cada dia" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ $semana = [a-zA-Z]* ]]; then
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		elif [[ $semana = "*" ]]
		then
			valid="6";
		elif [[ $semana -ge 0 && $semana -le 6 ]] 
		then
			valid="6";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	while [[ $valid == 6 ]]; do
		comando=$(whiptail --inputbox "Introduce el comando que deseas que se ejecute" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
		if [[ -n $comando ]] ;
		then
			valid="0";
		else
			whiptail --title "CRONTTAB" --msgbox "Has introducido un valor invalido" 38 110
		fi
	done
	crontab -l > crontabFile 2> /dev/null;
	echo "$minut $hora $dia $mes $semana $comando" >> crontabFile;
	crontab -i crontabFile;
	whiptail --title "CRONTTAB" --msgbox "Tarea programada correctamente." 38 110
	whiptail --title "CRONTTAB" \
               --textbox ./crontabFile 38 110 \;
	clear
	cron

}

cronElim(){

	comDel=$(whiptail --inputbox "Introduce el comando que deseas eliminar:" 38 110 --title "CRONTTAB" 3>&1 1>&2 2>&3)
	crontab -l > crontabFile;
	sed -i "/$comDel/d" crontabFile;
	crontab -i crontabFile;
	whiptail --title "CRONTTAB" --msgbox "Comando eliminado satisfactoriamente." 38 110
	clear
	cron

}

cronElimAll(){

	crontab -r;
	whiptail --title "CRONTTAB" --msgbox "Todas las tareas eliminadas satisfactoriamente" 38 110
	clear
	cron

}
#/////
#///SYST///

sysList(){

	systemctl --user list-timers --all > timersFile
	whiptail --title "programacion de tareas systemd" \
               --textbox ./timersFile 38 110 \;

	ctl

}

sysCreate(){

	titul=$(whiptail --inputbox "Vamos a configurar la tarea que deseas\nPrimero debes escribir el nombre de la tarea a ejecutar" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	echo -e "#!/bin/bash\n" > $titul.sh
	comando=$(whiptail --inputbox "Ahora debes escribir el comando a ejecutar" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	echo $comando >> $titul.sh
	whiptail --title "Modulo 6 UF 2" \
               --textbox ./$titul.sh 38 110 \;
	descripcion=$(whiptail --inputbox "Ahora crearemos el servicio que ejecutara el ejecutable con tu comando\nEscribe una descripcion de lo que ara esta tarea" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	echo -e "[Unit]" > $titul.service
	echo -e "Description=$descripcion" >> $titul.service
	echo -e "\n" >> $titul.service
	echo -e "[Service]\n" >> $titul.service
	echo -e "Type=oneshot\n" >> $titul.service
	echo -e "ExecStart=/bin/bash ./$titul.sh" >> $titul.service
	desctime=$(whiptail --inputbox "Ahora crearemos el el temporizador que lanzara el servicio\nEscribe una descripcion de cuando funcionara esta tarea:\n" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	echo -e "[Unit]\nDescription=$desctime\n" > $titul.timer
	time=$(whiptail --inputbox "Ahora escribe cuando deseas que se ejecute la tarea\nEl formato de tiempo es el siguiente (DiaDeLaSemana Año-Mes-Día Hora:Minuto:Segundo)\n* Para indicar cualquier valor\nValores separados por comas para indicar un listado de posibles\n.. para indicar un rango continuo de valores\n/ seguido por un valor. Esto indica que se ejecutará en ese valor y en los múltiplos correspondientes\nLos dias deben indicarse en ingles" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	echo -e "[timer]\nOnCalendar=$time\n\n[Install]\nWantedBy=timers.target" >> $titul.timer
	systemctl --user enable ./$titul.timer
	whiptail --title "Modulo 6 UF 2" \
               --textbox ./$titul.timer 38 110 \;
    whiptail --title "systemd" --msgbox "tarea creada satisfactoriamente." 38 110
	ctl
	
}

sysElim(){

	clear
	systemctl --user list-timers --all > timersFile
	whiptail --title "programacion de tareas systemd" \
               --textbox ./timersFile 38 110 \;
	opc=$(whiptail --inputbox "Que tarea deseas eliminar?" 38 110 --title "systemd" 3>&1 1>&2 2>&3)
	systemctl --user disable $opc.timer
    whiptail --title "systemd" --msgbox "tarea eliminada satisfactoriamente." 38 110
	ctl

	
}

#/////
#=========




#backups
#=========

comp(){

	propietario=$(hostname -s)
	acopiar=$(whiptail --inputbox "Aqui podras realizar copias de seguridad completas de directorios o archivos\nLo primero que debes indicar es la ruta de aquello que deseas copiar\nIndica la ruta completa" 38 110 --title "backups" 3>&1 1>&2 2>&3)
	name=$(whiptail --inputbox "Ahora indica un nombre para la copia" 38 110 --title "backups" 3>&1 1>&2 2>&3)
	file_name="$name-$propietario"
	whiptail --title "backups" \
               --textbox $file_name 38 110 \;
	dest=$(whiptail --inputbox "Ahora debes indicar el destino donde se guardara la copia\nse recomienda un lugar diferente al disco de origen\n" 38 110 --title "backups" 3>&1 1>&2 2>&3)
	tar -czf $dest/$file_name.tgz $acopiar
	whiptail --title "backups" --msgbox "Copia realizada" 38 110
	backups

}

#----------------------------------------------------FALTA COMPLETAR EL DIFERENCIAL Y EL INCREMENTAL---------------------
dif(){

	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior"
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior."
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior.."
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior..."
	sleep 0.3s
	clear
	backups

}

inc(){

	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior"
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior."
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior.."
	sleep 0.3s
	clear
	echo -e "Apartado incompleto\n"
	echo -e "Volviendo al menu anterior..."
	sleep 0.3s
	clear
	backups
	

}

#=========




#impresion de resultados

result(){

	echo -e "comando: " $1 "\n" > resultados.txt
	echo -e "Uso: $2 \n" >> resultados.txt
	echo -e "Salida:\n" >> resultados.txt
	eval "$3" >> resultados.txt
	
	echo -e "\n" >> resultados.txt
	echo -e "Ayuda: \n" >> resultados.txt
	echo -e $4 >> resultados.txt
	whiptail --title "Modulo 6 UF 2" \
               --textbox ./resultados.txt 38 110 \;
	if [ -f $6 ]; then
		rm -r $6 2> /dev/null
	fi
	rm -r resultados.txt 2> /dev/null
	eval "$5"
	

}

#=========


#otras funciones especiales

installer(){

	if [ "$(dpkg -l | awk -v pat="$1" '$0 ~ pat{print }'|wc -l)" -ge 1 ];
	then 
		return; 
	else 
		if (whiptail --title "Intalacion" --yesno "Es necesario instalar un paquete ($1) desea instalar el paquete?" 38 110);
		then
			whiptail --title "Intalacion" --msgbox "Porfavor espere mientras se completa la isntalacion" 38 110
			sudo apt install $1 -y 2> dev/null
		else
			$2
		fi
	fi
	return;
}


#=========
