from pylab import *

import math

t = arange(-math.pi, 2 * math.pi, 0.01)

r = 2 + cos(3*t)

polar(t, r)

grid(True)

show()
