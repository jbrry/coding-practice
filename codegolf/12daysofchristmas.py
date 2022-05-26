A=["First","Second","Third","Fourth","Fifth","Sixth","Seventh","Eighth","Ninth","Tenth","Eleventh","Twelfth"]
B=["A","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve"]
C=["Partridge in a Pear Tree.","Turtle Doves, and","French Hens,","Calling Birds,","Gold Rings,","Geese-a-Laying,","Swans-a-Swimming,","Maids-a-Milking,","Ladies Dancing,","Lords-a-Leaping,","Pipers Piping,","Drummers Drumming,"]
for i in range(len(A)):
  print(f"On the {A[i]} day of Christmas\nMy true love sent to me")
  if i == 0:print(f"{B[i]} {C[i]}")
  else:
    print(f"{B[i]} {C[i]}")
    k=i-1
    while k>=0:print(f"{B[k]} {C[k]}");k-=1
  print()