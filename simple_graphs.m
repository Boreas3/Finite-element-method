%%% SIMPLE
% Abscisses
% 1) Nombre d'éléments
elem_15_4=[500 1832 2892 11160 43473];
elem_15_8=[500 1832 2892 11160 43473];
elem_26_3=[983 3765 5898 23572 94116];
elem_26_6=[983 3765 5898 23572 94116];
% 2) Nombre de degrés de liberté
ddl_15_4=[3074 11133 17529 67309 262531];
ddl_15_8=[3149 11275 17707 67659 262225];
ddl_26_3=[1057 3905 6074 23921 97809];
ddl_26_6=[4081 15341 23945 94987 377851];

% Ordonnées
% 1) Total Potential Energy
tpe_15_4=[24098 24241 24192 24222 24234];
tpe_15_8=[24298 24307 24240 24240 24240];
tpe_26_3=[23812 24152 24133 24203 24229];
tpe_26_6=[24282 24302 24232 24236 24240];
% 2) Temps de calcul
temps_15_4=[0.02 0.06 0.06 0.31 1.33];
temps_15_8=[0.03 0.08 0.24 0.64 2.55];
temps_26_3=[0.02 0.03 0.05 0.22 0.83];
temps_26_6=[0.01 0.09 0.17 0.71 3.42];

%% TPE en fonction du nombre d'éléments
plot(elem_15_4,tpe_15_4)
hold on
plot(elem_15_8,tpe_15_8)
hold on
plot(elem_26_3,tpe_26_3)
hold on
plot(elem_26_6,tpe_26_6)
xlabel('Nombre d''éléments')
ylabel('TPE (J)')
title('TPE en fonction du nombre d''éléments')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best'); 
%% TPE en fonction du nombre de ddl
plot(ddl_15_4,tpe_15_4)
hold on
plot(ddl_15_8,tpe_15_8)
hold on
plot(ddl_26_3,tpe_26_3)
hold on
plot(ddl_26_6,tpe_26_6)
xlabel('Nombre de degrés de liberté')
ylabel('TPE (J)')
title('TPE en fonction du nombre de degrés de liberté')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');
%% Temps de calcul en fonction du nombre d'éléments
plot(elem_15_4,temps_15_4)
hold on
plot(elem_15_8,temps_15_8)
hold on
plot(elem_26_3,temps_26_3)
hold on
plot(elem_26_6,temps_26_6)
xlabel('Nombre d''éléments')
ylabel('Temps de calcul (s)')
title('Temps de calcul en fonction du nombre d''éléments')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');
%% Temps de calcul en fonction du nombre de ddl
plot(ddl_15_4,temps_15_4)
hold on
plot(ddl_15_8,temps_15_8)
hold on
plot(ddl_26_3,temps_26_3)
hold on
plot(ddl_26_6,temps_26_6)
xlabel('Nombre de degrés de liberté')
ylabel('Temps de calcul')
title('Temps de calcul en fonction du nombre de degrés de liberté')
legend('[T15](4)','[T15](8)','[T26](3)','[T26](6)','location','best');