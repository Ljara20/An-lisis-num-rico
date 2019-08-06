import math



def cuadratica(a, b, c):
    valora = ((b * -1) + (math.sqrt((b**2) - 4 * a * c))) / 2 * a
    valorb = ((b * -1) - (math.sqrt((b**2) - 4 * a * c))) / 2 * a

    print("Resultado 1: " + str(valora))
    print("Resultado 2: " + str(valorb))


def nueva(a, b, c):
    valorc = ((2 * -1) * c) / b + math.sqrt((b ** 2) - 4 * a * c)
    valord = ((2 * -1) * c) / b - math.sqrt((b ** 2) - 4 * a * c)

    print("Resultado 1: " + str(valorc))
    print("Resultado 2: " + str(valord))

if __name__ == "__main__":
    a = float(input("Ingrese un valor para a: "))
    b = float(input("Ingrese un valor para b: "))
    c = float(input("Ingrese un valor para c: "))

    print("\nResultado de cuadratica normal: ")
    cuadratica(a, b, c)
    print("\nResultado de nueva cuadratica: ")
    nueva(a, b, c)