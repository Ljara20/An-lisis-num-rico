import math

from matplotlib import pyplot


def graph():
    x = range(1, 15)
    pyplot.plot(x, [f(i) for i in x])
    pyplot.xlim(1, 3)
    pyplot.ylim(-2, 2)
    pyplot.show()


def secante(f, a, b, e):
    count = 0
    while abs(b - a) >= e:
        count += 1
        aux = b
        aux1 = (b - (f(b) * (a - b)) / (f(a) - f(b)))
        a = aux
        b = aux1
    print("Iteraciones: " + str(count))
    return b

#def f(x): return (x * math.exp(x)) - math.pi

def f(x): return (math.exp(x) - math.pi * (x))

#def f(x): return ((x**2) - 3*x - 4)

if __name__ == "__main__":
    a = float(input("Defina un punto x0: "))
    b = float(input("Defina un punto x1: "))
    e = float(input("Defina el error: "))

    print(secante(f, a, b, e))
    print(f(secante(f, a, b, e)))
    graph()