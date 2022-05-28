import sys
m={"M":1000,"CM":900,"D":500,"CD":400,"C":100,"XC":90,"L":50,"XL":40,"X":10,"IX":9,"V":5,"IV":4,"I":1}
def f(x):
	if x<4e3:s=""
	else:"("+f(x/1e3)+")";x%=1e3
	for l,n in m.items():
		while x>=n:s+=l;x-=n
	print(s)
y=sys.argv[1:]
for x in y:f(int(x))