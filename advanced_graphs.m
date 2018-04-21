%%% ADVANCED
% Abscisses
% 1) Nombre d'�l�ments
elem_15_4=[];
elem_15_8=[];
elem_26_3=[];
elem_26_6=[];
% 2) Nombre de degr�s de libert�
ddl_15_4=[];
ddl_15_8=[];
ddl_26_3=[];
ddl_26_6=[];

% Ordonn�es
% 1) Total Potential Energy
tpe_15_4=[];
tpe_15_8=[];
tpe_26_3=[];
tpe_26_6=[];
% 2) Temps de calcul
temps_15_4=[];
temps_15_8=[];
temps_26_3=[];
temps_26_6=[];

%% TPE en fonction du nombre d'�l�ments
plot(elem_15_4,tpe_15_4)
hold on
plot(elem_15_8,tpe_15_8)
hold on
plot(elem_26_3,tpe_26_3)
hold on
plot(elem_26_6,tpe_26_6)
xlabel('Nombre d''�l�ments')
ylabel('TPE (J)')
title('TPE en fonction du nombre d''�l�ments')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best'); 
%% TPE en fonction du nombre de ddl
plot(ddl_15_4,tpe_15_4)
hold on
plot(ddl_15_8,tpe_15_8)
hold on
plot(ddl_26_3,tpe_26_3)
hold on
plot(ddl_26_6,tpe_26_6)
xlabel('Nombre de degr�s de libert�')
ylabel('TPE (J)')
title('TPE en fonction du nombre de degr�s de libert�')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');
%% Temps de calcul en fonction du nombre d'�l�ments
plot(elem_15_4,temps_15_4)
hold on
plot(elem_15_8,temps_15_8)
hold on
plot(elem_26_3,temps_26_3)
hold on
plot(elem_26_6,temps_26_6)
xlabel('Nombre d''�l�ments')
ylabel('Temps de calcul (s)')
title('Temps de calcul en fonction du nombre d''�l�ments')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');
%% Temps de calcul en fonction du nombre de ddl
plot(ddl_15_4,temps_15_4)
hold on
plot(ddl_15_8,temps_15_8)
hold on
plot(ddl_26_3,temps_26_3)
hold on
plot(ddl_26_6,temps_26_6)
xlabel('Nombre de degr�s de libert�')
ylabel('Temps de calcul')
title('Temps de calcul en fonction du nombre de degr�s de libert�')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');