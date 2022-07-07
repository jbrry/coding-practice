M=9
for i in range(1,10):
    for c in range(1,i+1):
        n=c-1
        v=[]
        while n>=1:v.append(n);n-=1
        l="".join(str(x) for x in v[::-1])
        r="".join(str(x) for x in v)
        p=l+str(c)+r
        print(" "*(M-c),p)
    for k in range(1,i):
        c=i-k
        n=c-1
        v=[]
        while n>=1:v.append(n);n-=1
        l="".join(str(x) for x in v[::-1])
        r="".join(str(x) for x in v)
        p=l+str(c)+r
        print(" "*(M-c),p) 
    print()