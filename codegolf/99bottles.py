A="bottles of beer"
B="on the wall"
C="Take one down and pass it around,"
v="no more"
g=A[:6]+A[7:]
a=A+" "+B
s=100
p=".\n"
for i in range(1,100):
  c=s-i
  n=c-1
  if c>1:
    print(c,a+",",c,A+".")
    if n>1:
      print(C,n,a+p)
    else:
      print(C,n,g,B+p)
  else:
    print(c,g,B+",",c,g+".\n",v,a+p,"No more",a+",",v,A+".\n","Go to the store and buy some more,","99",a+".")
