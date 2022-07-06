b=" "
c="*"
for s in range(3,10):
    m=1
    n=s
    while n>=1:
        print(b*n+c*m)
        n-=1
        m+=2
    print(b*s+c+"\n")