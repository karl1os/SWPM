#!/bin/bash
# =====================================
# title             : func.sh
# description       : Aqui se encuentran todas las funciones del programa
# author            : Carlos Hernandez Navarro
# date              : 19/11/2021
# version			: 0.8
# =====================================


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

	crontab -l > crontabFile;
	if [[ -s crontabFile ]] ; 
	then
		cat crontabFile;
	else
		echo "No hay tareas que mostrar";
	fi
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	cron

}

cronCreate(){

	valid="1";
	while [[ $valid == 1 ]]; do
		echo "Introduce el minuto(s) en el que quieres que se ejecute (0-59) o * cada minuto";
		read minut;
		if [[ $minut = [a-zA-Z]* ]]; then
			echo "Has introducido un valor invalido."
		elif [[ $minut = "*" ]]
		then
			valid="2";
		elif [[ $minut -ge 0 && $minut -le 59 ]] 
		then
			valid="2";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	while [[ $valid == 2 ]]; do
		echo "Introduce la hora(s) en la que quieres que se ejecute (0-23) o * para cada hora";
		read hora;
		if [[ $hora = [a-zA-Z]* ]]; then
			echo "Has introducido un valor invalido."
		elif [[ $hora = "*" ]]
		then
			valid="3";
		elif [[ $hora -ge 0 && $hora -le 23 ]] 
		then
			valid="3";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	while [[ $valid == 3 ]]; do
		echo "Introduce el dia del mes (1-31) o * para cada dia";
		read dia;
		if [[ $dia = [a-zA-Z]* ]]; then
			echo "Has introducido un valor invalido."
		elif [[ $dia = "*" ]]
		then
			valid="4";
		elif [[ $dia -ge 1 && $dia -le 31 ]] 
		then
			valid="4";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	while [[ $valid == 4 ]]; do
		echo "Introduce el mes (1-12) o * para cada mes";
		read mes;
		if [[ $mes = [a-zA-Z]* ]]; then
			echo "Has introducido un valor invalido."
		elif [[ $mes = "*" ]]
		then
			valid="5";
		elif [[ $mes -ge 1 && $mes -le 12 ]] 
		then
			valid="5";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	while [[ $valid == 5 ]]; do
		echo "Introduce el dia de la semana (0=Domingo, 1-Lunes etc) o * para cada dia";
		read semana;
		if [[ $semana = [a-zA-Z]* ]]; then
			echo "Has introducido un valor invalido."
		elif [[ $semana = "*" ]]
		then
			valid="6";
		elif [[ $semana -ge 0 && $semana -le 6 ]] 
		then
			valid="6";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	while [[ $valid == 6 ]]; do
		echo "Introduce el comando que deseas que se ejecute";
		echo -e "Es recomendable proba la ejecucion del comando antes de programarlo.\nEn este punto no hay comprovacion de error en el comando"
		read comando;
		if [[ -n $comando ]] ;
		then
			valid="0";
		else
			echo "Has introducido un valor invalido."
		fi
	done
	crontab -l > crontabFile 2> /dev/null;
	echo "$minut $hora $dia $mes $semana $comando" >> crontabFile;
	crontab -i crontabFile;
	echo "Tarea programada correctamente."
	cat crontabFile;
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	cron

}

cronElim(){

	echo "Introduce el comando que deseas eliminar: ";
	read comDel;
	crontab -l > crontabFile;
	sed -i "/$comDel/d" crontabFile;
	crontab -i crontabFile;
	echo "Comando eliminado satisfactoriamente."
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	cron

}

cronElimAll(){

	crontab -r;
	echo "Todas las tareas eliminadas satisfactoriamente."
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	cron

}
#/////
#///SYST///

sysList(){

	clear
	systemctl --user list-timers --all
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	ctl

}

sysCreate(){

	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "Vamos a configurar la tarea que deseas\n"
	echo -e "Primero debes escribir el nombre de la tarea a ejecutar:\n"
	read titul
	echo -e "#!/bin/bash\n" > $titul.sh
	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "Ahora debes escribir el comando a ejecutar:\n"
	read comando
	echo $comando >> $titul.sh
	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "este es tu ejecutable:\n"
	cat $titul.sh
	read -n 1 -p"Pulsa cualquier tecla para continuar"
	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "Ahora crearemos el servicio que ejecutara el ejecutable con tu comando\n"
	echo -e "Escribe una descripcion de lo que ara esta tarea:\n"
	read descripcion
	echo -e "[Unit]" > $titul.service
	echo -e "Description=$descripcion" >> $titul.service
	echo -e "\n" >> $titul.service
	echo -e "[Service]\n" >> $titul.service
	echo -e "Type=oneshot\n" >> $titul.service
	echo -e "ExecStart=/bin/bash ./$titul.sh" >> $titul.service
	read -n 1 -p"Pulsa cualquier tecla para continuar"
	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "Ahora crearemos el el temporizador que lanzara el servicio\n"
	echo -e "Escribe una descripcion de cuando funcionara esta tarea:\n"
	read desctime
	echo -e "[Unit]\nDescription=$desctime\n" > $titul.timer
	read -n 1 -p"Pulsa cualquier tecla para continuar"
	clear
	echo "================================================================="
	echo -e "\n"
	echo -e "Ahora escribe cuando deseas que se ejecute la tarea\n"
	echo -e "El formato de tiempo es el siguiente (DiaDeLaSemana Año-Mes-Día Hora:Minuto:Segundo):\n"
	echo -e "* Para indicar cualquier valor\n"
	echo -e "Valores separados por comas para indicar un listado de posibles\n"
	echo -e ".. para indicar un rango continuo de valores\n"
	echo -e "/ seguido por un valor. Esto indica que se ejecutará en ese valor y en los múltiplos correspondientes\n"
	echo -e "Los dias deben indicarse en ingles\n"
	read time
	echo -e "[timer]\nOnCalendar=$time\n\n[Install]\nWantedBy=timers.target" >> $titul.timer
	clear
	systemctl --user enable ./$titul.timer
	cat $titul.timer
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	ctl
	
}

sysElim(){

	clear
	systemctl --user list-timers --all
	echo -e "Que tarea deseas eliminar?"
	read opc
	systemctl --user disable $opc.timer
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	ctl

	
}

#/////
#=========




#backups
#=========

comp(){

	propietario=$(hostname -s)
	echo "#=============================================="
	echo -e "Aqui podras realizar copias de seguridad completas de directorios o archivos"
	echo -e "Lo primero que debes indicar es la ruta de aquello que deseas copiar"
	read -p 'Indica la ruta completa: ' acopiar
	echo -e "\n"
	echo -e "Ahora indica un nombre para la copia\n"
	read -p "Nombre: " name
	file_name="$name-$propietario"
	echo $file_name
	echo -e "\n"
	echo -e "Ahora debes indicar el destino donde se guardara la copia,\nse recomienda un lugar diferente al disco de origen\n"
	read -p "Indica aqui la ruta de destino: " dest
	read -n 1 -p"Pulsa cualquier tecla para continuar"
	clear
	echo -e "La copia de seguridad se esta realizando espere porfavor...\n"
	echo -e "Origen: $acopiar\n"
	echo -e "Destino: $dest\n"
	echo -e "Propietario: $propietario\n"
	tar -czf $dest/$file_name.tgz $acopiar
	echo -e "Copia realizada"
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
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

	echo -e "comando: " $1 "\n";
	echo -e "Uso: $2 \n";
	echo -e "Salida:\n";
	eval "$3"
	if [ -f $6 ]; then
		rm -r $6 2> /dev/null
	fi
	echo -e "\n";
	echo -e "Ayuda: \n"
	echo -e $4
	read -n 1 -p"Pulsa cualquier tecla para volver"
	clear
	eval "$5"

}

#=========


#otras funciones especiales

installer(){

	if [ "$(dpkg -l | awk -v pat="$1" '$0 ~ pat{print }'|wc -l)" -ge 1 ];
	then 
		return; 
	else 
		echo "Es necesario instalar un paquete ($1) desea instalar el paquete? [y/n]:"
		read opcins
		clear
		case $opcins in
			y)
				sudo apt install $1 -y
			;;
			n)
				echo "no se instalara el paquete, volviendo al menu anterior"
				sleep 0.3
				clear
				echo "no se instalara el paquete, volviendo al menu anterior."
				sleep 0.3
				clear
				echo "no se instalara el paquete, volviendo al menu anterior.."
				sleep 0.3
				clear
				echo "no se instalara el paquete, volviendo al menu anterior..."
				sleep 0.3
				clear
				$2
			;;
			*)
				clear
				echo "No has seleccionado una opcion valida"
				sleep 1s
				clear
				$3
			;;
		esac
	fi
	# if [ "$(dpkg -l | awk '/$1/ {print }'|wc -l)" -ge 1 ];
	# then 
	# 	return; 
	# else
	# 	clear 
	# 	echo "Parece que ha habido algun problema para instalar el paquete ($1)"
	# 	echo "¡¡¡ Porfavor ejecute este script con root !!!"
	# 	echo "Para ejecutar el script como root debe escribir \"sudo ./main.sh\""
	# 	read -n 1 -p"Pulsa cualquier tecla para volver" 
	# 	clear
	# 	$2
	# fi
	return;
}

misc(){

	cat << "EOF"

      _//       _//    _////     _/////    _//     _//_//
      _/ _//   _///  _//    _//  _//   _// _//     _//_//           _//    
      _// _// _ _//_//        _//_//    _//_//     _//_//          _//     
      _//  _//  _//_//        _//_//    _//_//     _//_//         _//      
      _//   _/  _//_//        _//_//    _//_//     _//_//       _/    _//  
      _//       _//  _//     _// _//   _// _//     _//_//       _//     _//
      _//       _//    _////     _/////      _/////   _////////   _// _//  

                         _//     _//_////////           
                         _//     _//_//        _// _/   
                         _//     _//_//       _/     _//
                         _//     _//_//////        _//  
                         _//     _//_//          _//    
                         _//     _//_//        _//      
                           _/////   _//       _//////// 

EOF
	return

}
#=========
