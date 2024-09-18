Proceso TablasDeFrecuencia

    Definir datos, frecuencia, frecuenciaAcumulada, total, i, j, k Como Entero
    Definir frecuenciaRelativa, frecuenciaAcumuladaRelativa, porcentaje Como Real
    Definir numDatos, numDatosUnicos Como Entero
    Definir existe Como Logico 

    Escribir "¿Cuantos datos va a ingresar?: "
    Leer numDatos

    Dimension listaDatos[numDatos]
    Dimension listaFrecuencia[numDatos]
    Dimension listaFrecuenciaAcumulada[numDatos]
    Dimension listaFrecuenciaRelativa[numDatos]
    Dimension listaFrecuenciaAcumuladaRelativa[numDatos]
    Dimension listaPorcentaje[numDatos]
    Dimension listaDatosUnicos[numDatos]

    Para i <- 1 Hasta numDatos Con Paso 1
        Escribir "Ingrese el dato ", i, ": "
        Leer listaDatos[i]
    FinPara

    numDatosUnicos <- 0
    Para i <- 1 Hasta numDatos Con Paso 1

        existe <- Falso
        Para j <- 1 Hasta numDatosUnicos Con Paso 1
            Si listaDatos[i] = listaDatosUnicos[j] Entonces
                existe <- Verdadero
            FinSi
        FinPara

        Si NO existe Entonces
            numDatosUnicos <- numDatosUnicos + 1
            listaDatosUnicos[numDatosUnicos] <- listaDatos[i]
        FinSi
    FinPara

    total <- 0
    Para i <- 1 Hasta numDatosUnicos Con Paso 1
        frecuencia <- 0
        Para j <- 1 Hasta numDatos Con Paso 1
            Si listaDatosUnicos[i] = listaDatos[j] Entonces
                frecuencia <- frecuencia + 1
            FinSi
        FinPara
        listaFrecuencia[i] <- frecuencia
        total <- total + frecuencia
    FinPara

    frecuenciaAcumulada <- 0
    Para i <- 1 Hasta numDatosUnicos Con Paso 1
        frecuenciaAcumulada <- frecuenciaAcumulada + listaFrecuencia[i]
        listaFrecuenciaAcumulada[i] <- frecuenciaAcumulada
    FinPara

    Para i <- 1 Hasta numDatosUnicos Con Paso 1
        frecuenciaRelativa <- listaFrecuencia[i] / total
        listaFrecuenciaRelativa[i] <- frecuenciaRelativa
        frecuenciaAcumuladaRelativa <- listaFrecuenciaAcumulada[i] / total
        listaFrecuenciaAcumuladaRelativa[i] <- frecuenciaAcumuladaRelativa
        porcentaje <- frecuenciaRelativa * 100
        listaPorcentaje[i] <- porcentaje
    FinPara
	
    Escribir "Dato | Frecuencia Absoluta | Frecuencia Acumulada | Frecuencia Relativa | Frecuencia Acumulada Relativa | Porcentaje"
    Para i <- 1 Hasta numDatosUnicos Con Paso 1
		Escribir listaDatos[i], "    | ", listaFrecuencia[i], "                   | ", listaFrecuenciaAcumulada[i], "                    | ", listaFrecuenciaRelativa[i], "                 | ", listaFrecuenciaAcumuladaRelativa[i], "                           | ", listaPorcentaje[i]    
	FinPara
FinProceso