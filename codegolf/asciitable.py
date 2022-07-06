# uncreative but surprisingly a top 100 solution...
A="""   2 3 4 5 6 7
 -------------
0:   0 @ P ` p
1: ! 1 A Q a q
2: " 2 B R b r
3: # 3 C S c s
4: $ 4 D T d t
5: % 5 E U e u
6: & 6 F V f v
7: ' 7 G W g w
8: ( 8 H X h x
9: ) 9 I Y i y
A: * : J Z j z
B: + ; K [ k {
C: , < L \ l |
D: - = M ] m }
E: . > N ^ n ~
F: / ? O _ o DEL"""
print(A)


# d={"AV":"   2 3 4 5 6 7",
# "BV":" -------------",
# "CV":"0:   0 @ P ` p",
# "D":"1:!1AQaq",
# "E":"2:\"2BRbr",
# "F":"3:#3CScs",
# "G":"4:$4DTdt",
# "HV":"5: % 5 E U e u",
# "I":"6:&6FVfv",
# "J":"7:'7GWgw",
# "K":"8:(8HXhx",
# "L":"9:)9IYiy",
# "M":"A:*:JZjz",
# "N":"B:+;K[k{",
# "O":"C:,<L\l|",
# "P":"D:-=M]m}",
# "Q":"E:.>N^n~",
# "RV":"F: / ? O _ o DEL"}

# for k,v in d.items():
#     if "V" in k:
#         print(d[k])
#     else:
#         a=d[k]
#         print(a[:2], " ".join([i for i in a[2:]]))