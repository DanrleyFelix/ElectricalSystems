clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av1 - Sistemas Elétricos
% Danrley Santos Felix
% Questão 01 - Solução do gabarito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Algumas variáveis

a = p2r([1 120],true);
neg_seq = [1 a a*a];
alf2 = p2r([3^(1/2) -30],true);

%% Dados da questão

vab = p2r([220 0],true);
zgy = 0.2j;
zl = 0.1+0.5j;
zl = zl+zgy;
z2 = 3;
z2_y = z2/3;
y2_y = 1/z2_y;

zan = 2+1j;
zbn = 1-2j;
zcn = 2;

%% Admitâncias

yan = 1/zan;
ybn = 1/zbn;
ycn = 1/zcn;

yeq_an = yan+y2_y;
yeq_bn = ybn+y2_y;
yeq_cn = ycn+y2_y;

%% Impedâncias equivalentes

zeq_a = zl+(1/yeq_an);
zeq_b = zl+(1/yeq_bn);
zeq_c = zl+(1/yeq_cn);

%% Tensões de linha e fase

line_voltages = vab*neg_seq;
van = vab/alf2;
phase_voltages = van*neg_seq;
van = phase_voltages(1);
vbn = phase_voltages(2);
vcn = phase_voltages(3);

%% Tensão no neutro

yeq_a = 1/zeq_a;
yeq_b = 1/zeq_b;
yeq_c = 1/zeq_c;
yeq_total = yeq_a+yeq_b+yeq_c;
vno = (-1*((van*yeq_a)+vbn*yeq_b+vcn*yeq_c))/(yeq_total);
vao = van+vno;
vbo = vbn+vno;
vco = vcn+vno;

%% Correntes na linha (módulo e fase)

fprintf("Correntes de linha em módulo e fase:")
iaa = r2p(vao*yeq_a,true)
ibb = r2p(vbo*yeq_b,true)
icc = r2p(vco*yeq_c,true)
