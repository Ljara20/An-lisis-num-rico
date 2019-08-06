import math

#Error de redondeo para un número cuando solo se almacenan 4 digitos
def error_redondeo(num):
    digitos = int(num)

    digitos_int = (int(str(digitos).__len__()))
    digitos_float = (int(str(num).__len__()-1))
    numaux = ""
    numdig = ""
    i = 0

    while i < digitos_float + 1:
        #Compruebo que no se tome el punto decimal en el valor a almacenar
        if(str(num)[i] != '.'):
            numdig += str(num)[i]

        #Compruebo que ya se hayan tomado los 4 dígitos a almacenar y que no se almacenen puntos
        if(i > 4 and str(num)[i] != '.'  and numdig.__len__() >= 4): 
            numaux += str(num)[i]

        i += 1

    primer_res = float(numaux) * 10**-digitos_float
    res_aux = primer_res * 10**digitos_int

    #result = res_aux * 10** (digitos_int - 4)
    print("El error de redondeo corresponde a:\n            E = " + str(res_aux))


#Polinomio de taylor con 5 cifras significativas para e^0.5
def taylor():
    print("Polinomio de taylor para e^0.5")
    grado = int(input("A qué grado desea realizar el polinomio? "))
    x = 0.5
    funct = round((math.e)**x,4)
    print ("Resultado real: " + str(funct))

    res_taylor = _doing_taylor(grado, x)

    #print("Resultado aproximado: " + str(res_taylor))
    error = round(abs(funct - res_taylor),10)
    print("Error en la aproximación de grado " + str(grado) + ": " + str(error))


#Se realiza la multiplicación del teorema de Taylor
def _doing_taylor(grado, x):
    
    grd = 0
    res = 0

    for grd in range (grado + 1):
        res += (x**grd)/factorial1(grd)
        res1 = round(res,4)
        print(str(grd) + " Aproximación: " + str(res1))
    
    return res

#Factorial de un número (Utilizado para la función de aproximación con teorema de Taylor)
def factorial1(num):
    aux = num
    result = 1
    while aux != 1 and aux != 0:
        result *= aux
        aux -= 1

    return result

#Calculo de distancia con sus respectivos errores
def distancia():
    vel = float(input("Ingrese la velocidad del recorrido: "))
    ev = float(input("Error de la velocidad: "))
    tiempo = float(input("Ingrese el tiempo del recorrido: "))
    et = float(input("Error del tiempo: "))

    distancia = vel * tiempo
    error_abs = (vel * ev) + (tiempo * et)
    error_rel = ((ev / vel) + (et / tiempo)) * 100
    print("\n\nLa distancia recorrida es de: " + str(distancia))
    print("Con un error absoluto de: " + str(error_abs))
    print("Por lo cual la distancia tiene un rango de variación: ")
    print("   " + str(distancia - error_abs) + " <= d => " + str(distancia + error_abs))
    print("\nEl error relativo es de: " + str(error_rel) + "%")


def polinomio():
    x = float(input("Ingrese un valor para x: "))
    a = [0] * 5
    for j in range(5):
        a[j] = float(input("Ingrese valor en a: "))
    count = 0
    res = a[0]
  
    for i in range(len(a)):
        res = (x * res) + a[i]
        count += 2
    print("\n\nEl resultado de la evaluación del polinomio es: " + str(res) + ". Con un minimo de operaciones de " + str(count))


#Raiz de un numero (7 en el caso de la prueba del ejercicio) y su convergencia al valor real con metodos iterativos
def raiz_it():
    dato = float(input("Ingrese el dato a usar: "))
    if (dato >= 0):
        error = float(input("Error permitido: "))
        vali = float(input("Valor inicial: "))
        result = 0
        cont = 0
        
        result = (0.5 * (vali + (dato / vali)))

        while abs(vali - result) > error:
            vali = result
            result = (0.5 * (vali + (dato/vali)))
            print("resultado " + str(cont) + ": " + str(result))
            cont += 1
            print("El error es: " + str(abs(vali-result)))

        print("\nComprobación: " + str(result) + " ** 2 = " + str(result**2))
        print("El error es: " + str(abs(vali-result)))

#Menú de usuario con los problemas a desarrollar
def welcome():
    print("\n\n===Problemas de análisis numérico===")
    print("======Seleccione el problema======")
    print("[1] Error de redondeo")
    print("[2] Raiz por metodos iterativos")
    print("[3] Teorema de Taylor")
    print("[4] Error en distancia recorrida")
    print("[5] Polinomio")
    print("[s] Salir")
    print("")
    


if __name__ == '__main__':
    cont = 1

    while cont == 1:
        welcome()
        command = input()

        if command == '1':
            error_redondeo(float(input("Ingrese el numero a almacenar: ")))
            break

        elif command == '2':
            raiz_it()

        elif command == '3':
            taylor()

        elif command == '4':
            distancia()
        
        elif command == '5':
            polinomio()
            

        elif command == 'S' or command == 's':
            cont = 0
            print("Has elegido salir del programa")

        else:
            print("Comando equivocado")


