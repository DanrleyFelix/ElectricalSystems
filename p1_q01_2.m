clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av1 - Sistemas Elétricos
% Danrley Santos Felix
% Questão 01 - Método mais adequado
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
z2_delta = 3;
y2_delta = 1/z2_delta;

z1 = 2+1j;
z2 = 2;
z3 = 1-2j;

%% Delta equivalente para a carga em Y

zabc = z1*z2 + z2*z3 + z1*z3;
za = zabc/z3;
zb = zabc/z1;
zc = zabc/z2;

%% Admitâncias e impedâncias equivalentes nas cargas em delta

ya = 1/za;
yb = 1/zb;
yc = 1/zc;

yeq_a = ya+y2_delta;
yeq_b = yb+y2_delta;
yeq_c = yc+y2_delta;

zeq_a = 1/yeq_a;
zeq_b = 1/yeq_b;
zeq_c = 1/yeq_c;

%% Estrela equivalente para a carga em Delta equivalente

zabc_y = zeq_a + zeq_b + zeq_c;
z1_y = (zeq_a*zeq_c)/zabc_y;
z2_y = (zeq_a*zeq_b)/zabc_y;
z3_y = (zeq_b*zeq_c)/zabc_y;

%% Impedância equivalente na linha + carga

zeq_al = zl+(1/z1_y);
zeq_bl = zl+(1/z2_y);
zeq_cl = zl+(1/z3_y);

%% Tensões de linha e fase

line_voltages = vab*neg_seq;
van = vab/alf2;
phase_voltages = van*neg_seq;
van = phase_voltages(1);
vbn = phase_voltages(2);
vcn = phase_voltages(3);

%% Tensão no neutro

yeq_al = 1/zeq_al;
yeq_bl = 1/zeq_bl;
yeq_cl = 1/zeq_cl;
yeq_total = yeq_al+yeq_bl+yeq_cl;
vno = (-1*((van*yeq_al)+vbn*yeq_bl+vcn*yeq_cl))/(yeq_total);
vao = van+vno;
vbo = vbn+vno;
vco = vcn+vno;

%% Correntes na linha (módulo e fase)

fprintf("Correntes de linha em módulo e fase:")
iaa = r2p(vao*yeq_al,true)
ibb = r2p(vbo*yeq_bl,true)
icc = r2p(vco*yeq_cl,true)
