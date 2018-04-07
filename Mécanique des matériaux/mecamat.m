%%Données
l=0.5;
h1=0.75;
h2=(1.5-h1-0.5*l)/sqrt(0.5);
h3=h1;
r=7900;
g=9.81;
E=210000*10^6;
nu=0.3;
e=1; % e se simplifie normalement
A=e*l;
I=(e*l^3)/12;
EA=E*A;
EI=E*I;
G=E/(2*(1+nu));
GAs=G*A*5/6;

syms P MR3 R3

%% Calcul de MR3 et de R3
%AB
N1=@(x) P*e/2 +r*g*e*l*(h2+h3+h1-x);
T1=@(x) R3 + 0.*x;
M1=@(x) 1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3);

%test

NB=N1(h1);tB=T1(h1);MB=M1(h1);
a=1.25*0.5*P*0.5*h1*h1-R3*(h1*h1*h1/3 -1.25* h1*h1/2) -MR3*h1*h1/2 +r*g*e*l*h1*h1*0.5*(0.25*h2+0.875*h3)-1.25*1.25*P*0.5*h1+R3*1.25*(h1*h1*0.5-1.25*h1)+1.25*MR3-1.25*r*g*e*l*h1*(0.25*h2+0.875*h3);
a=a/EI + R3*h1/GAs;
b=0.5*h2*(P*0.5*e+r*g*e*l*(h3+h2-h2*0.5)+R3)/EA -0.5*h2*(P*e*0.5+r*g*e*l*(h2+h3-h2*0.5)-R3)/GAs +MB*h2+h2*h2+0.5*tB*sqrt(0.5)-h2*h2*0.5*sqrt(0.5)*NB+h2*h2*h2*(1/6)*r*g*e*l*sqrt(0.5)/EI;
c=R3*h3/EA;
d=a+b+c; % déplacement selon x=0;
MR3=solve(d,MR3);
M1=@(x) 1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3);
MB=M1(h1);

a1=-1.25*e*P*0.5*h1-R3*(h1*h1*0.5-1.25*h1)+MR3*h1-r*g*e*l*h1*(0.25*h2+0.875*h3);
b1= -MB*h2-h2*h2*0.5*sqrt(0.5)*(tB-NB)-h2*h2*h2*(1/6)*sqrt(0.5)*r*g*e*l;
c1=P*e*0.5*(h3*h3*0.5-0.75*h3)+MR3*h3-r*g*e*l*(0.375*h3*h3-h3*h3*0.5+h3*h3*h3/6);
d1=(a1+b1+c1)/EI; % déplacement dû à un moment =0;
R3=solve(d1,R3);

syms MR3;
N1=@(x) P*e/2 +r*g*e*l*(h2+h3+h1-x);
T1=@(x) R3 + 0.*x;
M1=@(x) 1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3);
MB=M1(h1); tB= T1(h1); NB= N1(h1);
a=1.25*0.5*P*0.5*h1*h1-R3*(h1*h1*h1/3 -1.25* h1*h1/2) -MR3*h1*h1/2 +r*g*e*l*h1*h1*0.5*(0.25*h2+0.875*h3)-1.25*1.25*P*0.5*h1+R3*1.25*(h1*h1*0.5-1.25*h1)+1.25*MR3-1.25*r*g*e*l*h1*(0.25*h2+0.875*h3);
a=a/EI + R3*h1/GAs;
b=0.5*h2*(P*0.5*e+r*g*e*l*(h3+h2-h2*0.5)+R3)/EA -0.5*h2*(P*e*0.5+r*g*e*l*(h2+h3-h2*0.5)-R3)/GAs +MB*h2+h2*h2+0.5*tB*sqrt(0.5)-h2*h2*0.5*sqrt(0.5)*NB+h2*h2*h2*(1/6)*r*g*e*l*sqrt(0.5)/EI;
c=R3*h3/EA;
d=a+b+c;
MR3=solve(d,MR3);

%% Détermination de Pmax
%AB
N1=@(x) P*e/2 +r*g*e*l*(h2+h3+h1-x);
T1=@(x) R3 + 0.*x;
M1=@(x) 1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3);

sig_max_1= abs(N1(0))/A + abs(M1(0))*0.5*l/I;

%BC

N2=@(x) sqrt(0.5)*(P*e/2+r*g*e*l*(h3+h2-x)+R3);
T2=@(x) sqrt(0.5)*(P*e/2+r*g*e*l*(h3+h2-x)-R3);
M2=@(x) (P*e/2)*(1.25-sqrt(0.5)*x)-MR3-R3*(0.5-sqrt(0.5)*x)+r*g*e*l*(h2*(0.25-x*sqrt(0.5))+h3*(0.875-x*sqrt(0.5))+x.*x*0.5*sqrt(0.5));

sig_max_2= abs(N2(0))/A + abs(M2(0))*0.5*l/I;

%CD

N3=@(x) R3+ 0.*x;
T3=@(x) P*e/2 +r*g*e*l*(h3-x);
M3=@(x) (P*e/2)*(0.75-x) -MR3 +r*g*e*l*(0.375*h3-x*h3+x.*x/2);

sig_max_3= abs(N3(0))/A + abs(M3(0))*0.5*l/I;

Pmax=solve(sig_max_1==250*10^6,P);

%%Analyse des déformations

P=eval(Pmax);
MR3=eval(MR3);
R3=eval(R3);

%AB
N1_2=@(x) (P*e/2 +r*g*e*l*(h2+h3+h1-x)).^2;
T1_2=@(x) (R3 + 0.*x).^2;
M1_2=@(x) (1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3)).^2;

N1_y=@(x) P*e/2 +r*g*e*l*(h2+h3+h1-x);
M1_y=@(x) (1.25*e*P/2 +R3*(x-1.25)-MR3+r*g*e*l*(0.25*h2+0.875*h3))*1.25;

%BC

N2_2=@(x) (sqrt(0.5)*(P*e/2+r*g*e*l*(h3+h2-x)+R3)).^2;
T2_2=@(x) (sqrt(0.5)*(P*e/2+r*g*e*l*(h3+h2-x)-R3)).^2;
M2_2=@(x) ((P*e/2)*(1.25-sqrt(0.5)*x)-MR3-R3*(0.5-sqrt(0.5)*x)+r*g*e*l*(h2*(0.25-x*sqrt(0.5))+h3*(0.875-x*sqrt(0.5))+x.*x*0.5*sqrt(0.5))).^2;

N2_y=@(x) 0.5*(P*e/2+r*g*e*l*(h3+h2-x)+R3);
T2_y=@(x) 0.5*(P*e/2+r*g*e*l*(h3+h2-x)-R3);
M2_y=@(x) ((P*e/2)*(1.25-sqrt(0.5)*x)-MR3-R3*(0.5-sqrt(0.5)*x)+r*g*e*l*(h2*(0.25-x*sqrt(0.5))+h3*(0.875-x*sqrt(0.5))+x.*x*0.5*sqrt(0.5))).*(1.25-sqrt(0.5)*x);

%CD

N3_2=@(x) (R3+ 0.*x).^2;
T3_2=@(x) (P*e/2 +r*g*e*l*(h3-x)).^2;
M3_2=@(x) ((P*e/2)*(0.75-x) -MR3 +r*g*e*l*(0.375*h3-x*h3+x.*x/2)).^2;

T3_y=@(x) P*e/2 +r*g*e*l*(h3-x);
M3_y=@(x) ((P*e/2)*(0.75-x) -MR3 +r*g*e*l*(0.375*h3-x*h3+x.*x/2)).*(0.75-x);

%TPE

U1= 0.5* (integral(N1_2,0,h1)/EA+ integral(T1_2,0,h1)/GAs+integral(M1_2,0,h1)/EI);
U2= 0.5* (integral(N2_2,0,h2)/EA+ integral(T2_2,0,h2)/GAs+integral(M2_2,0,h2)/EI);
U3= 0.5* (integral(N3_2,0,h3)/EA+ integral(T3_2,0,h3)/GAs+integral(M3_2,0,h3)/EI);

TPE= -2*(U1+U2+U3); %Il faut multiplier par 2 car on étudie que la moitié de la structure

%Déplacement

y1= integral(N1_y,0,h1)/EA + integral(M1_y,0,h1)/EI;
y2= integral(N2_y,0,h2)/EA + integral(T2_y,0,h2)/GAs + integral(M2_y,0,h2)/EI;
y3= integral(T3_y,0,h1)/GAs + integral(M3_y,0,h3)/EI;

deplacement= y1+y2+y3;