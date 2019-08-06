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

def p_falsa(f, a, b, e):
    count = 0
    c = 0
    while b - a >= e:
        count += 1
        c = b - ((f(b) * (a - b))/(f(a) - f(b)))
        if f(c) == 0:
            return c
        else:
            if f(a)  * f(c) > 0:
                a = c
            else:
                b = c
    print("Iteraciones: " + str(count))
    return c

#def f(x): return (x * math.exp(x)) - math.pi

def f(x): return (math.exp(x) - math.pi * (x))

#def f(x): return (math.exp(-x)) - math.log(x)

if __name__ == "__main__":
    a = float(input("Defina punto a del intervalo: "))
    b = float(input("Defina punto b del intervalo: "))
    e = float(input("Defina el error: "))

    if(check(a, b)):
        print(p_falsa(f, a , b, e))
        print(f(p_falsa(f, a , b, e)))
    graph(a, b)