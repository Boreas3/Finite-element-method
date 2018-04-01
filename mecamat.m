h1=0.75;
h2=0.56;
h3=0.5;
l=0.5;
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
Pmax=15571000; %remplacer P par syms P puis trouver Pmax pour zone AB,BC et CD
P=Pmax;


%AB
N1=@(x) P*e/2 +r*g*e*l*(h1+h2+h3-x);
M1=@(x) 1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3) + 0.*x;

N1_2=@(x) (P*e/2 +r*g*e*l*(h1+h2+h3-x)).^2;
M1_2=@(x) (1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3) + 0.*x).^2;

N1_x=@(x) P*e/2 +r*g*e*l*(h1+h2+h3-x);
M1_x=@(x) 1.25*(1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3) + 0.*x);

M1_y=@(x) 1.5*(1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3) + 0.*x);

%BC

N2=@(x) (P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5);
T2=@(x) (P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5);
M2=@(x) 1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3)-x.*sqrt(0.5).*(P*e/2 +r*g*e*l*(h1+h2-x.*0.5));

N2_2=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5)).^2;
T2_2=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5)).^2;
M2_2=@(x) (1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3)-x.*sqrt(0.5).*(P*e/2 +r*g*e*l*(h1+h2-x.*0.5))).^2;

N2_x=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5))*sqrt(0.5);
T2_x=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5))*sqrt(0.5);
M2_x=@(x) (1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3)-x.*sqrt(0.5).*(P*e/2 +r*g*e*l*(h1+h2-x.*0.5))).*(1.25-sqrt(0.5)*x);

N2_y=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5))*sqrt(0.5);
T2_y=@(x) ((P*0.5*e+r*g*e*l*(h2+h3-x))*sqrt(0.5))*sqrt(0.5);
M2_y=@(x) (1.25*P*e*0.5 + r*g*e*l*(0.5*h2+h3)-x.*sqrt(0.5).*(P*e/2 +r*g*e*l*(h1+h2-x.*0.5))).*(1.5-sqrt(0.5)*x);

%CD

T3= @(x) 0.5*e*P + r*g*e*l*x;
M3= @(x) x.*(P*e*0.5+ r*g*e*l*0.5*x);

T3_2= @(x) (0.5*e*P + r*g*e*l*x).^2;
M3_2= @(x) (x.*(P*e*0.5+ r*g*e*l*0.5*x)).^2;

T3_x= @(x) (0.5*e*P + r*g*e*l*x);
M3_x= @(x) (x.*(P*e*0.5+ r*g*e*l*0.5*x)).*x;

M3_y= @(x) (x.*(P*e*0.5+ r*g*e*l*0.5*x))*0.25;

%TPE

U1= 0.5* (integral(N1_2,0,h1)/EA+ integral(M1_2,0,h1)/EI);
U2= 0.5* (integral(N2_2,0,h2)/EA+ integral(T2_2,0,h2)/GAs+integral(M2_2,0,h2)/EI);
U3= 0.5* (integral(M3_2,0,h3)/EI+ integral(T3_2,0,h3)/GAs);

TPE= -(U1+U2+U3);

%Déplacement

x1= integral(N1_x,0,h1)/EA+ integral(M1_x,0,h1)/EI;
x2= integral(N2_x,0,h2)/EA+ integral(T2_x,0,h2)/GAs+integral(M2_x,0,h2)/EI;
x3= integral(M3_x,0,h3)/EI+ integral(T3_x,0,h3)/GAs;

x=x1+x2+x3;

y1= integral(M1_y,0,h1)/EI;
y2= integral(N2_y,0,h2)/EA+ integral(T2_y,0,h2)/GAs+integral(M2_y,0,h2)/EI;
y3= integral(M3_y,0,h3)/EI;

y=y1+y2+y3;

theta1= integral(N1,0,h1)/EA+ integral(M1,0,h1)/EI;
theta2= integral(N2,0,h2)/EA+ integral(T2,0,h2)/GAs+integral(M2,0,h2)/EI;
theta3= integral(M3,0,h3)/EI+ integral(T3,0,h3)/GAs;

theta=theta1+theta2+theta3;

xtot=x+0.5*l*theta;

deplacement=sqrt(xtot^2 +y^2);
