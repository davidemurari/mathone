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

m1 = 1/(2*dx) * ones(N-1,1);
D1 = diag(m1,1)-diag(m1,-1);
D1(1,1:2) = [0,0];
D1(end,end-1:end) = [0,0];

f = zeros(length(x),1);
f(1) = 0;
f(end) = 1/dx^2;

%Soluzione numerica trovata nel vettore u
u = (D2+D1)\f;

%Soluzione analitica
uesatta = @(t) (exp(1)-exp(1-t))./(exp(1)-1);

plot(x,u,'r*',x,uesatta(x),'k-');
title("Soluzione u''+u' = 0 con u(0)=0,u(1)=1");
legend("Sol numerica","Sol esatta");
xlabel("Dominio spaziale");
ylabel("Soluzione u(x)");