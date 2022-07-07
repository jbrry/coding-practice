diag="\u2571"
vertical="\u2502"
horizontal="\u2500"
vertex="\u2588"
space=" "

for size in range(1,8):
    top = space*(1+size) + vertex + horizontal*(4*size) + vertex
    print(top)
    front_space = size
    # top of cube
    for i in range(0, size):
        back_space = i
        if i == 0:
            print(space*(front_space) + diag + space*(4*size) + diag + vertical)
        else:
            print(space*(front_space) + diag + space*(4*size) + diag + space*(back_space) + vertical)
        front_space -= 1 # front space gets closer to margin
    print(vertex + horizontal*(4*size) + vertex + space*(size) + vertical)
    
    back_space += 1
    for i in range(1, 2*size+1):
        # back corner, put vertex at the end
        if i == size:
            print(vertical + space*(4*size) + vertical + space*(back_space) + vertex)
        # approaching bottom corner, move line closer
        elif i > size:
            back_space -= 1
            print(vertical + space*(4*size) + vertical + space*(back_space) + diag)
        # straight line
        elif i < size:
            print(vertical + space*(4*size) + vertical + space*(back_space) + vertical)
    # bottom
    print(vertex + horizontal*(4*size) + vertex)
    print()

# golfed version:
d="\u2571"
v="\u2502"
h="\u2500"
n="\u2588"
s=" "
for x in range(1,8):
    t=s*(1+x)+n+h*(4*x)+n
    print(t)
    f=x
    for i in range(0,x):
        b = i
        if i==0:print(s*(f)+d+s*(4*x)+d+v)
        else:print(s*(f)+d+s*(4*x)+d+s*(b)+v)
        f-=1
    print(n+h*(4*x)+n+s*(x)+v)
    b += 1
    for i in range(1,2*x+1):
        if i==x:print(v+s*(4*x)+v+s*(b)+n)
        elif i>x:b-=1;print(v+s*(4*x)+v+s*(b)+d)
        elif i<x:print(v+s*(4*x)+v+s*(b)+v)
    print(n+h*(4*x)+n+"\n")