clear all;
close all;

%% Risoluzione equazione di poisson -u''(x) = f(x)

L = 1;
N = 100; %Numero di punti nel dominio
x = linspace(0,L,N)'; %Dominio discretizzato
dx = x(2)-x(1); %Passo di discretizzazione

d1 = -2*ones(N,1);
d2 = ones(N-1,1);
D2 = diag(d1) + diag(d2,1) + diag(d2,-1);
D2 = 1/dx^2 * D2;
D2(1,1:2) = [1/dx^2,0];
D2(end,end-1:end) = [0,1/dx^2];

f = ones(length(x),1);
f(1) = 0;
f(end) = 0;

%Soluzione numerica trovata nel vettore u
u = -D2\f;

%Soluzione analitica
uesatta = @(t) -0.5.*(t-1).*t;

plot(x,u,'r*',x,uesatta(x),'k-');
title("Soluzione -u''(x) = 1 con u(0)=u(1)=0");
legend("Sol numerica","Sol esatta");
xlabel("Dominio spaziale");
ylabel("Soluzione u(x)");