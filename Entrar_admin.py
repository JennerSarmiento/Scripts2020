#!/usr/bin/python3
#-*- coding: utf-8-*-
# Autor: Jenner Sarmiento Mendoza
#Descripció: Crea una funció que rep un nom d'usuari i una contrasenya,
#retorna “True” si el nom d'usuari és "admin" i la contrasenya és "1234"
#També rep el nombre d'intents que s'ha intentat fer login i si no s'ha
# pogut entrar com a “admin” incrementa aquest valor.
#
#Joc de Proves:
#	ENTRADA:							SORTIDA:
#	admin 1234							Bienvenido admin.
#										Numero de intentos=0							
#
#	root 1234							Bienvenido admin.
#	marcos 1234							Numero de intentos=2
#	admin 1234							
#
#-----------------------------------------------------------------------
def contador_errores(user,passwd):
	if user=="admin" and passwd=="1234":
		return True
	else:
		return False
contador_inicial=0
contador_final=2
#--------------------------MAIN-----------------------------------------
#Iniciamos el contador como 0
while contador_inicial <= contador_final:
	user=input("Usuari: ")
	passwd=input("Contrasenya: ")
	
	#Llamamos a la función que vaya llamando a user y password
	login=contador_errores(user, passwd)
	
	#Fem ús d'un if per veure si la funció login es True
	if login == True:
		print ("Bienvenido admin.")
		print(contador_inicial)
		break	
	#Si la funció dona false, augmenti en 1 el comptador	
	contador_inicial +=1
	print ("Numero de intentos: ", contador_inicial)
	if contador_inicial==3:
		print ("Limit d'errors màxim.Torna a intentar-ho en 1 hora") 
