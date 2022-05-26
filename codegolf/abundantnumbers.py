for n in range(1,201):
	x=[]
	for j in range(1,n):
		if n%j==0:x.append(j)
	if sum(x)>n:print(n)