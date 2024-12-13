```
Valores segun el carnet
X = 4
Y = 5
Z = 1
```

Resumen en limpio de los valores obtenidos.

L1 = 4
L2 = 1
L3 = 1

U1 = 6
U2 = 5
U3 = 6

I = 5
J = 3
K = 3

### b) Dirección de M[5][3][3] en Column Major

S1 = 4
S2 = 12
S3 = 60

addresof(M) + (I-L1)*S1 + (J-L2)*S2 + (K-L3)*S3
= 0 + (5-4)*4 + (3-1)*12 + (3-1)*60
= 4 + 24 + 120
#### = 148

### a) Dirección de M[5][3][3] en Row Major

S3 = 4
S2 = 24
S1 = 120

addresof(M) + (I-L1)*S1 + (J-L2)*S2 + (K-L3)*S3
= 0 + (5-4)*120 + (3-1)*24 + (3-1)*4
= 120 + 48 + 8
#### = 176