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
c = 3^(1/2);
lag = p2r([1 30],true);
alf = p2r([c -30],true);
a = p2r([1 120],true);
T = [1 1 1; 1 a*a a; 1 a a*a];
    
%% Dados da questão

% Tensões de linha e fase

vab = 380;
vbc = 380*a^2;
vca = 380*a;
vbn = 0;
van = vab;
vcn = -vbc;

% Impedâncias

zfio = 0.1+0.02i;
zn = 0.5+0.1i;
zcarga_pu = 0.3;

% Motor monofásico A

p1a = 8*k;
fp1a = 0.6;
o1a = acos(fp1a);
s1a = p1a/fp1a;
v1a = 220;

% Motor monofásico B

s1b = 5*k;
fp1b = 0.9;
o1b = acos(fp1b);
v1b = 220;

% Motor monofásico C

p1c = 6*k;
fp1c = 0.75;
o1c = acos(fp1c);
s1c = p1c/fp1c;
v1c = 220;

% Motor trifásico

p3 = 60*k;
fp3 = 0.8;
o3 = acos(fp3);
s3 = p3/fp3;
v3 = 380;

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

z0 = (za+zb+zc)/3;
z1 = (za+a*zb+a*a*zc)/3;
z2 = (za+a*a*zb+a*zc)/3;

matriz_z = [z0 z2 z1; z1 z0 z2; z2 z1 z0];


