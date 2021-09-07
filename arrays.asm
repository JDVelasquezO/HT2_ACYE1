include macros.asm

; Modelos donde el ensamblador dividira los bloques de memoria
.model small

.stack 64h

.data
	lineas db '|-----------------------------------------|', '$'
	titulo db ' Jose Velasquez - 201800722 - HT2 ', '$'
	lista1 dw 20, 50, 98, 54, 35, 789, 415, 347, 500, 600
	lista2 dw 10, 5, 2, 5, 7, 63, 11, 21, 50, 60
	divisible db ' Es divisible', '$'
	noDivisible db ' No es divisible', '$'

.code

	main proc
		mov ax, @data 		; ax es la dirección del registro ax. En el registro ax se guarda lo que está en @data (direccion de la memoria)
		mov ds, ax 			; Lo que tiene ax, se mueve al registro ds
		
		; |----------------------------------------|
		ImprimirCadena lineas
		
		; Espacio
		ImprimirEspacio al
		
		ImprimirCadena titulo
		
		; Espacio
		ImprimirEspacio al
		
		mov ax, 63 			; Aquí la parte izquierda ya tiene 50 -> ax = 55
		mov cl, 5			; La parte derecha ya tiene 10 		  -> cl = 10
		div cl				; Se divide
		
		; Imprimir ah
		ImprimirEspacio al
		cmp ah, 0					;  si ah no es igual a 0
		jne validacionInorrecta		; salta a validacionInorrecta
		
		ImprimirCadena divisible	; de lo contrario sigue el flujo normal
		ImprimirEspacio al
	
		ImprimirCadena lineas
		
		; ax = 4C00H -> 
		mov ax, 4C00H
		INT 21H
	main endp
	
	validacionInorrecta:
		ImprimirCadena noDivisible
		ImprimirEspacio al
		mov ax, 4C00H
		INT 21H
end