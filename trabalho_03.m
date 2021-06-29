clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trabalho 3 - Sistemas Elétricos
% Danrley Santos Felix
% Aline Rafaela da silva costa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constantes

M = 1000000;
k = 1000;
c = 3^(1/2);
lead = p2r([1 30],true);
alf = p2r([c -30],true);
a = p2r([1 120],true);

%% Dados da questão

% Estimativas

erro = 1e-4;
v1 = 1.025;
v2o = 1;
v3o = 1.03;

% Admitâncias

y12 = -40j;
y13 = -20j;
y23 = -40j;

% Potências

sb = 100*M;
p2 = -400*M;
q2 = -200j*M;
p3 = 300*M;

% Potências em PU

s2_sch = (p2+q2)/sb;
p3_sch = p3/sb;

%% Processo iterativo

iter = 10; % Limite de iterações
v2 = 1:iter;
v2(1) = v2o;
vc3 = 1:iter;
v3 = 1:iter;
v3(1) = v3o;
q3 = 1:iter;

for i = 1:iter
    
    v2(i+1) = ((conj(s2_sch)/conj(v2(i)))+y12*v1+y23*v3(i))/(y12+y23);
    q3(i) = -imag(conj(v3(i))*(v3(i)*(y13+y23)-y13*v1-y23*v2(i+1)));
    s3_sch = p3_sch+q3(i)*1j;
    vc3(i) = ((conj(s3_sch)/conj(v3(i)))+y13*v1+y23*v2(i+1))/(y13+y23);
    e = sqrt((v3(1))^2-(imag(vc3(i)))^2);
    v3(i+1) = e+imag(vc3(i))*1j;
    
    if (abs(v3(i+1) - v3(i)) < erro) && (abs(v2(i+1) - v2(i)) < erro)
        stop_iter = i;
        break
    end 
end

%% Letra a - Tensões nas barras

fprintf("\nIterações para V2:\n")
v2 = v2(1:stop_iter)
fprintf("\nIterações para Vc3:\n")
vc3 = vc3(1:stop_iter)
fprintf("\nIterações para V3:\n")
v3 = v3(1:stop_iter)
q3 = q3(1:stop_iter);
s3_sch

%% Letra b - Potência ativa e reativa na barra 1

s1_sch = conj(v1)*(v1*(y12+y13)-(y12*v2(stop_iter)+y13*v3(stop_iter)))
p1_sch = real(s1_sch)*sb
q1_sch = imag(s1_sch)*sb

