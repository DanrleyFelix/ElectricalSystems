clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av2 - Sistemas Elétricos
% Danrley Santos Felix
% Aline Rafaela da silva costa
% Questão 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constantes

M = 1000000;
k = 1000;
a = p2r([1 120],true);
T = [1 1 1; 1 a*a a; 1 a a*a];
    
%% Dados da questão

queda = 0.03;
v_linha = 380;
v_fase = v_linha/sqrt(3);
van = p2r([v_fase -30],true);
vbn = 0;
vcn = van*a;

% Impedâncias

zfio = 0.1+0.02i;
zn = 0.5+0.1i;

% Motor monofásico A

p1a = 8*k;
fp1a = 0.6;
o1a = acos(fp1a);
s1a = p1a/fp1a;
v1a = 220*(1-queda);

% Motor monofásico B

s1b = 5*k;
fp1b = 0.9;
o1b = acos(fp1b);
v1b = 220*(1-queda);

% Motor monofásico C

p1c = 6*k;
fp1c = 0.75;
o1c = acos(fp1c);
s1c = p1c/fp1c;
v1c = 220*(1-queda);

% Motor trifásico

p3 = 60*k;
fp3 = 0.8;
o3 = acos(fp3);
s3 = p3/fp3;
v3 = 380*(1-queda);

%% Calculando impedâncias e admitâncias

zm1a = p2r([v1a^2/s1a o1a],false);
zm1b = p2r([v1b^2/s1b o1b],false);
zm1c = p2r([v1c^2/s1c o1c],false);
zm3 = p2r([v3^2/s3 o3],false);

ym1a = 1/zm1a;
ym1b = 1/zm1b;
ym1c = 1/zm1c;
ym3 = 1/zm3;

% Admitâncias a, b e c

ya = ym1a+ym3;
yb = ym1b+ym3;
yc = ym1c+ym3;

% Impedâncias a, b e c

za = 1/ya;
zb = 1/yb;
zc = 1/yc;

%% Componentes simétricas

% Tensões

van012 = (T^-1)*[van; vbn; vcn];

% Impedâncias

z0_linha = zfio;
z0 = (za+zb+zc)/3;
z1 = (za+a*zb+a*a*zc)/3;
z2 = (za+a*a*zb+a*zc)/3;

% Solução das equações no formato matricial

matriz_z = [z0+z0_linha+3*zn z2 z1; z1 z0+z0_linha z2; z2 z1 z0+z0_linha];
x = (matriz_z^(-1))*van012; % componentes simétricas
x2 = T*x; % correntes reais
In = 3*x(1); % corrente no fio neutro

%% a) Componentes simétricas das correntes nos fios durante o defeito

fprintf("(a) Componentes simétricas das correntes nos fios:\n")
Ia0 = r2p(x(1),true)
Ia1 = r2p(x(2),true)
Ia2 = r2p(x(3),true)

%% b) As correntes reais nas fases do circuito trifásico durante o defeito

fprintf("(b) As correntes reais nas fases:\n")
Ia = r2p(x2(1),true)
Ib = r2p(x2(2),true)
Ic = r2p(x2(3),true)

%% c) Corrente no fio neutro durante o defeito

fprintf("(c) A corrente no fio neutro:\n")
IN = r2p(In,true)

%% d) A perda elétrica em cada fase (A, B e C) da instalação durante o defeito
fprintf("(d) A perda elétrica em cada fase:\n")
Perda_A = real(zfio)*(abs(x2(1)))^2
Perda_B = real(zfio)*(abs(x2(2)))^2
Perda_C = real(zfio)*(abs(x2(3)))^2
