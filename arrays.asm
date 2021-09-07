include macros.asm

; Modelos donde el ensamblador dividira los bloques de memoria
.model small

.stack 64h

.data
	lineas db '|-----------------------------------------|', '$'
	titulo db ' Jose Velasquez - 201800722 - HT2 ', '$'
	lista1 dw 20, 50, 98, 54, 35, 789, 415, 347, 500, 600
	lista2 db 10, 5, 2, 5, 7, 63, 11, 21, 50, 60
	; lista2 dw 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	divisible db ' Es divisible', '$'
	noDivisible db ' No es divisible', '$'
	barraVertical db '|'

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
		
		mov si, 0
		inicio:
			xor ax, ax
			xor dx, dx
			
			mov ax, lista1[si]
			mov cl, 5
			div cl
			
			Imprimir ah
			cmp ah, 0
			jne validacionIncorrecta
			
			ImprimirCadena divisible
			
			ImprimirEspacio al
			regreso:
			add si, 2
			cmp si, 20
		jne inicio
		jmp noEncicla
		
		validacionIncorrecta:
			ImprimirCadena noDivisible
			ImprimirEspacio al
			jmp regreso
		
		noEncicla:
		ImprimirCadena lineas
		; ax = 4C00H -> 
		mov ax, 4C00H
		INT 21H
	main endp
end