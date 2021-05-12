clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av1 - Sistemas Elétricos
% Danrley Santos Felix
% Questão 03
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dados da questão

zab = 16+28j;
zbc = 14.8-6.4j;
zca = 14+8j;
vab = p2r([230 0],true);
vbc = p2r([230 -120],true);
vca = p2r([230 120],true);

%% Correntes de fase

iab = vab/zab;
ibc = vbc/zbc;
ica = vca/zca;

%% Correntes de linha

ia = iab - ica;
ib = ibc - iab;
ic = ica - ibc;

%% Leitura dos wattímetros

vac = vca*-1;
w1 = real(vac*conj(ia));
w2 = real(vbc*conj(ib));

%% Respostas

ia = r2p(ia,true);
ib = r2p(ib,true);
ic = r2p(ic,true);

fprintf("Correntes de llinha")

[ia ib ic]

fprintf("Leitura dos wattímetros W1 e W2")

[w1 w2]