import math

from matplotlib import pyplot


def graph():
    x = range(1, 15)
    pyplot.plot(x, [f(i) for i in x])
    pyplot.xlim(1, 3)
    pyplot.ylim(-2, 2)
    pyplot.show()


def check(a, b):
    if f(a) * f(b) < 0:
        return True


def triseccion(f, a, b, e):
    count = 0
    d = 0
    c = 0
    while b - a >= e:
        count += 1
        c = a + ((b - a) / 3)
        d = c + ((b - a) / 3)
        if f(c) == 0:
            return c

        elif f(d) == 0:
            return d

        else:
            if f(a) * f(c) > 0:

                if f(c) * f(d) > 0:
                    a = d
                else:
                    a = c
                    b = d
            else:
                b = c
    print("El numero de iteraciones es: " + str(count))
    return d


#def f(x): return (x * math.exp(x)) - math.pi

def f(x): return (math.exp(x) - math.pi * (x))

if __name__ == "__main__":
    a = float(input("Defina punto a del intervalo: "))
    b = float(input("Defina punto b del intervalo: "))
    e = float(input("Defina el error: "))

    if(check(a, b)):
        print(triseccion(f, a , b, e))
        print(f(triseccion(f, a , b, e)))
    graph(a, b)