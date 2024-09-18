datos = []
n = int(input("¿Cuantos datos va a ingresar?: "))

for i in range(n):
    dato = int(input(f"Ingrese el dato {i+1}: "))
    datos.append(dato)

valores_unicos = sorted(list(set(datos)))  
frecuencia_absoluta = []
frecuencia_acumulada = []
frecuencia_relativa = []
frecuencia_relativa_acumulada = []
porcentajes = []

for valor in valores_unicos:
    frecuencia_absoluta.append(datos.count(valor))

total_datos = sum(frecuencia_absoluta)
acumulada_abs = 0
acumulada_rel = 0

for i in range(len(valores_unicos)):
    acumulada_abs += frecuencia_absoluta[i]
    frecuencia_acumulada.append(acumulada_abs)

    frec_relativa = frecuencia_absoluta[i] / total_datos
    frecuencia_relativa.append(frec_relativa)

    acumulada_rel += frec_relativa
    frecuencia_relativa_acumulada.append(acumulada_rel)

    porcentaje = frec_relativa * 100
    porcentajes.append(porcentaje)

print(f"{'Dato':^10} {'FA':^10} {'FA Acum':^10} {'FR':^10} {'FR Acum':^10} {'%':^10}")
for i in range(len(valores_unicos)):
    print(f"{valores_unicos[i]:^10} {frecuencia_absoluta[i]:^10} {frecuencia_acumulada[i]:^10} {frecuencia_relativa[i]:^10.4f} {frecuencia_relativa_acumulada[i]:^10.4f} {porcentajes[i]:^10.2f}")

print(f"{'Total:':^10} {sum(frecuencia_absoluta):^10} {'':^10} {sum(frecuencia_relativa):^10.4f} {'':^10} {sum(porcentajes):^10.2f}")