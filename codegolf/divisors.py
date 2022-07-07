for i in range(1,101):
	d=[]
	for j in range(1,i+1):
		if i%j==0:d.append(j)
	print(" ".join(str(i) for i in d))