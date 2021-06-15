clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av2 - Sistemas Elétricos
% Danrley Santos Felix
% Questão 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constantes

M = 1000000;
k = 1000;
c = 3^(1/2);
lag = p2r([1 30],true);
alf = p2r([c -30],true);
a = p2r([1 120],true);

%% Dados da questão

Vab = 380;
vbc = 380*a^2;
vca = 380*a;
vbn = 0;
van = vab;
vcn = -vbc;
zfio = 0.1+0.02i;
zn = 0.5+0.1i;
zcarga_pu = 0.3;

