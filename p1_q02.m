clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av1 - Sistemas Elétricos
% Danrley Santos Felix
% Questão 02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Algumas variáveis

ct = 3^0.5;
a = p2r([1 120],true);
pos_seq = [1 a*a a];
alf = p2r([ct -30],true);
alf2 = p2r([ct 30],true);

%% Dados da questão

v_line = 220;
vab = p2r([v_line 0],true);
zl = 0.2j;

% Carga em delta

fp1 = 0.8;
phi1 = acos(0.8);
s1 = 10000;

% Carga em estrela

p2 = 5000;
fp2 = 0.92;
phi2 = acos(fp2);

%% Correntes de linha para a carga em delta

i_line_1 = s1/(ct*v_line);
ia_line_delta = p2r([i_line_1 -phi1],false);
line_currents_delta = ia_line_delta*pos_seq;
ib_line_delta = line_currents_delta(2);
ic_line_delta = line_currents_delta(3);

%% Correntes de fase para a carga em delta

ia_phase_delta = ia_line_delta/alf;
phase_currents_delta = ia_phase_delta*pos_seq;
ib_phase_delta = phase_currents_delta(2);
ic_phase_delta = phase_currents_delta(3);

%% Correntes de linha para a carga em estrela

i_line_2 = p2/(ct*v_line*fp2);
ia_line_y = p2r([i_line_2 -phi2],false);
line_currents_delta = ia_line_y*pos_seq;
ib_line_y = line_currents_delta(2);
ic_line_y = line_currents_delta(3);

%% Tensões de fase para a carga em estrela

van_y = vab/alf2;
phase_voltages_y = van_y*pos_seq;
vbn_y = phase_voltages_y(2);
vcn_y = phase_voltages_y(3);

%% Tensões de fase para o gerador

van_g = van_y + zl*(ia_line_y + ia_line_delta);
phase_voltages_g = van_g*pos_seq;
vbn_g = phase_voltages_g(2);
vcn_g = phase_voltages_g(3);

%% Tensões nos terminais do gerador

vab_g = van_g*alf2;
vbc_g = vbn_g*alf2;
vca_g = vcn_g*alf2;

%% Respostas em módulo e fase

fprintf("Correntes de linha na carga em Delta: ")
ia_line_delta = r2p(ia_line_delta,true);
ib_line_delta = r2p(ib_line_delta,true);
ic_line_delta = r2p(ic_line_delta,true);

[ia_line_delta ib_line_delta ic_line_delta]

fprintf("Correntes de fase na carga em Delta: ")
ia_phase_delta = r2p(ia_phase_delta,true);
ib_phase_delta = r2p(ib_phase_delta,true);
ic_phase_delta = r2p(ic_phase_delta,true);

[ia_phase_delta ib_phase_delta ic_phase_delta]

fprintf("Correntes de linha na carga em Estrela: ")
ia_line_y = r2p(ia_line_y,true);
ib_line_y = r2p(ib_line_y,true);
ic_line_y = r2p(ic_line_y,true);

[ia_line_y ib_line_y ic_line_y]

fprintf("Tensões de fase na carga em Estrela: ")
van_y = r2p(van_y,true);
vbn_y = r2p(vbn_y,true);
vcn_y = r2p(vcn_y,true);

[van_y vbn_y vcn_y]

fprintf("Tensões nos terminais do gerador: ")
vab_g = r2p(vab_g,true);
vbc_g = r2p(vbc_g,true);
vca_g = r2p(vca_g,true);

[vab_g vbc_g vca_g]
