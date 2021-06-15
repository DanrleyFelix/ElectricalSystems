clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Av2 - Sistemas Elétricos
% Danrley Santos Felix
% Aline Rafaela da silva costa
% Questão 02
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constantes

M = 1000000;
k = 1000;
c = 3^(1/2);
lag = p2r([1 30],true);
alf = p2r([c -30],true);
a = p2r([1 120],true);

%% Dados da questão

% Gerador

sbase = 60*M;
vbase = 13.8*k;
zg1_pu = 0.15i;

% Motores

fp1 = 0.8;
fp2 = 0.85;
fp3 = 0.9;
o1 = acos(fp1);
o2 = acos(fp2);
o3 = acos(fp3);

sm1 = (15*M)/0.9;
sm2 = (25*M)/0.85;
sm3 = (12*M)/0.9;

vnm = 12.5*k;

% Transformadores

st1 = 70*M;
st2 = 70*M;

vt1p = 15*k;
vt1s = 115*k;
vt2p = 115*k;
vt2s = 15*k;

at1 = vt1p/vt1s;
at2 = vt2p/vt2s;

xcc_pu = 0.1i;

% Tensões de base (Regiões 1, 2 e 3)

vt1_base = vbase;
vt2_base = vt1_base/at1;
vt3_base = vt2_base/at2;

% Linha de transmissão

xlt = 40i;
vlt_base = vt2_base;
zlt_base = vlt_base^2/sbase;

%% (a) Diagrama de impedâncias

% Transformador 1

jxt1_pu = cb(vt1p,st1,xcc_pu,vbase,sbase);

% Linha de transmissão

zlt_pu = xlt/zlt_base;

% Transformador 2

jxt2_pu = cb(vt2p,st2,xcc_pu,vt2_base,sbase);

fprintf("(a) Diagrama de impedâncias:\n")
zg1_pu
jxt1_pu
jxt2_pu
zlt_pu

%% (b) Correntes Ia, Ib e Ic na linha de transmissão

% Correntes no motor

vm_base = vt2_base/at2;

sn1 = p2r([sm1 o1],false);
Im1_pu = conj(sn1/sbase)/conj(vnm/vm_base);

sn2 = p2r([sm2 o2],false);
Im2_pu = conj(sn2/sbase)/conj(vnm/vm_base);

sn3 = p2r([sm3 o3],false);
Im3_pu = conj(sn3/sbase)/conj(vnm/vm_base);

Ipu = Im1_pu+Im2_pu+Im3_pu;

% Correntes reais

Ibase = sbase/(c*vt2_base);
Ia = Ipu*Ibase*lag;
Ib = Ia*a*a;
Ic = Ia*a;

fprintf("(b) Correntes nas fases Ia, Ib e Ic na linha de transmissão:\n")
Ia_mod_fase = r2p(Ia,true)
Ib_mod_fase = r2p(Ib,true)
Ic_mod_fase = r2p(Ic,true)

%% (c) Correntes de fase no delta de T1

Idt1_base = sbase/(c*vt1_base);
Idt1a = (Ipu/alf)*Idt1_base;
Idt1b = Idt1a*a*a;
Idt1c = Idt1a*a;

fprintf("(c) Correntes de fase no delta de T1:\n")
Idt1a_mod_fase = r2p(Idt1a,true)
Idt1b_mod_fase = r2p(Idt1b,true)
Idt1c_mod_fase = r2p(Idt1c,true)

%% (d) As tensões internas em pu do gerador reguladas

% Tensões em cada barra em PU

v4pu = vnm/vt3_base;
v3pu = (Ipu*jxt2_pu+v4pu)/lag;
v2pu = ((Ipu*zlt_pu/lag)+v3pu);
v1pu = ((Ipu*jxt1_pu/lag)+v2pu)*lag;

% Tensões internas no gerador em PU

Ega = (Ipu*zg1_pu+v1pu);
Egb = Ega*a^2;
Egc = Ega*a;

fprintf("(d) As tensões internas em pu do gerador reguladas:\n")
Ega_mod_fase = r2p(Ega,true)
Egb_mod_fase = r2p(Egb,true)
Egc_mod_fase = r2p(Egc,true)