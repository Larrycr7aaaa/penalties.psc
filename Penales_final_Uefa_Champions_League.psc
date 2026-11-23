Algoritmo Penales_final_Uefa_Champions_League
	Definir E1, E2 Como Caracter
	Definir P1, P2, i Como Entero
	Definir falloP1, falloP2, atajadaP1, atajadaP2 Como Entero
	Definir Direccion_Del_uno, Direccion_Por_dos Como Entero
	Definir Direccion_Del_dos, Direccion_Por_uno Como Entero
	
	// Ciclo MIENTRAS: detectar error si los nombres quedan vacíos
	Escribir "Ingrese el nombre del Equipo 1:"
	Leer E1
	Mientras E1 = "" Hacer
		Escribir "Error de usuario: El nombre no puede estar vacío. Ingrese el Equipo 1:"
		Leer E1
	FinMientras
	
	Escribir "Ingrese el nombre del Equipo 2:"
	Leer E2
	Mientras E2 = "" Hacer
		Escribir "Error de usuario: El nombre no puede estar vacío. Ingrese el Equipo 2:"
		Leer E2
	FinMientras
	
	// Inicialización de marcadores y registros
	P1 <- 0
	P2 <- 0
	falloP1 <- 0
	falloP2 <- 0
	atajadaP1 <- 0
	atajadaP2 <- 0
	
	// Ciclo REPETIR: mantiene la tanda hasta lograr 3 goles de ventaja
	Repetir
		Escribir "=========================================="
		Escribir "MARCADOR: ", E1, " ", P1, " - ", P2, " ", E2
		Escribir "=========================================="
		
		// --- TURNO EQUIPO 1 (Patea Del_uno vs Arquero Por_dos) ---
		Escribir "Turno de patear: ", E1
		// Ciclo PARA: mostrar las 9 direcciones del arco
		Para i <- 1 Hasta 9 Con Paso 1 Hacer
			Segun i Hacer
				1: Escribir "1: derecha-abajo"
				2: Escribir "2: derecha-medio"
				3: Escribir "3: derecha-arriba"
				4: Escribir "4: medio-abajo"
				5: Escribir "5: mitad-medio"
				6: Escribir "6: medio-arriba"
				7: Escribir "7: izquierda-abajo"
				8: Escribir "8: izquierda-medio"
				9: Escribir "9: izquierda-arriba"
			FinSegun
		FinPara
		Escribir "(Menor a 1 o mayor a 9 se registra como penal fallado)"
		Leer Direccion_Del_uno
		
		Si Direccion_Del_uno >= 1 Y Direccion_Del_uno <= 9 Entonces
			Escribir "Turno del arquero de ", E2, " (Elija una dirección del 1 al 9):"
			Leer Direccion_Por_dos
			
			// Ciclo MIENTRAS: detectar error de usuario en el arquero
			Mientras Direccion_Por_dos < 1 O Direccion_Por_dos > 9 Hacer
				Escribir "Error de usuario: El arquero debe elegir entre 1 y 9. Intente de nuevo:"
				Leer Direccion_Por_dos
			FinMientras
			
			Si Direccion_Del_uno <> Direccion_Por_dos Entonces
				Escribir "¡GOOOOL de ", E1, "!"
				P1 <- P1 + 1
			SiNo
				Escribir "¡Qué atajada del arquero de ", E2, "!"
				atajadaP2 <- atajadaP2 + 1
			FinSi
		SiNo
			// Registro de números < 1 o > 9 como penaltis fallados
			Escribir "¡Penal fallado por ", E1, "! La mandó fuera como Gabriel Magalhães contra el PSG."
			falloP1 <- falloP1 + 1
		FinSi
		
		Escribir "------------------------------------------"
		
		// --- TURNO EQUIPO 2 (Patea Del_dos vs Arquero Por_uno) ---
		Escribir "Turno de patear: ", E2
		Para i <- 1 Hasta 9 Con Paso 1 Hacer
			Segun i Hacer
				1: Escribir "1: derecha-abajo"
				2: Escribir "2: derecha-medio"
				3: Escribir "3: derecha-arriba"
				4: Escribir "4: medio-abajo"
				5: Escribir "5: mitad-medio"
				6: Escribir "6: medio-arriba"
				7: Escribir "7: izquierda-abajo"
				8: Escribir "8: izquierda-medio"
				9: Escribir "9: izquierda-arriba"
			FinSegun
		FinPara
		Escribir "(Menor a 1 o mayor a 9 se registra como penal fallado)"
		Leer Direccion_Del_dos
		
		Si Direccion_Del_dos >= 1 Y Direccion_Del_dos <= 9 Entonces
			Escribir "Turno del arquero de ", E1, " (Elija una dirección del 1 al 9):"
			Leer Direccion_Por_uno
			
			// Ciclo MIENTRAS: detectar error de usuario en el arquero
			Mientras Direccion_Por_uno < 1 O Direccion_Por_uno > 9 Hacer
				Escribir "Error de usuario: El arquero debe elegir entre 1 y 9. Intente de nuevo:"
				Leer Direccion_Por_uno
			FinMientras
			
			Si Direccion_Del_dos <> Direccion_Por_uno Entonces
				Escribir "¡GOOOOL de ", E2, "!"
				P2 <- P2 + 1
			SiNo
				Escribir "¡Qué atajada del arquero de ", E1, "!"
				atajadaP1 <- atajadaP1 + 1
			FinSi
		SiNo
			// Registro de números < 1 o > 9 como penaltis fallados
			Escribir "¡Penal fallado por ", E2, "! La mandó fuera como Gabriel Magalhães contra el PSG."
			falloP2 <- falloP2 + 1
		FinSi
		
	Hasta Que P1 - P2 = 3 O P2 - P1 = 3
	
	// Resumen final con registro completo de goles, fallos y atajadas
	Escribir "=========================================="
	Escribir "MARCADOR FINAL: ", E1, " ", P1, " - ", P2, " ", E2
	Escribir "------------------------------------------"
	Escribir "REGISTRO DE ", E1, ": ", P1, " goles | ", falloP1, " fallados | ", atajadaP1, " atajadas"
	Escribir "REGISTRO DE ", E2, ": ", P2, " goles | ", falloP2, " fallados | ", atajadaP2, " atajadas"
	Escribir "=========================================="
	
	Si P1 > P2 Entonces
		Escribir "¡", E1, " es campeón de La Champions!"
	SiNo
		Escribir "¡", E2, " es campeón de La Champions!"
	FinSi
FinAlgoritmo