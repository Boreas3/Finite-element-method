%%% COARSE
% Abscisses
% 1) Nombre d'éléments
elem_15_4=[492 1878 2923 11328 44129];
elem_15_8=[492 1878 2923 11328 44129];
elem_26_3=[965 3817 5937 23814 93819];
elem_26_6=[965 3817 5937 23814 93819];
% 2) Nombre de degrés de liberté
ddl_15_4=[3021 11407 17712 68315 265469];
ddl_15_8=[3091 11547 17887 68663 266165];
ddl_26_3=[1033 3955 6110 24161 94513];
ddl_26_6=[3997 15545 24095 98951 376665];

% Ordonnées
% 1) Total Potential Energy
tpe_15_4=[24124 24242 24272 25270 25300];
tpe_15_8=[24300 24310 24316 24298 24300];
tpe_26_3=[23772 24116 24176 24262 24281];
tpe_26_6=[24242 24271 24288 24297 24294];
% 2) Temps de calcul
temps_15_4=[0.01 0.06 0.07 0.34 1.39];
temps_15_8=[0.03 0.1 0.14 0.64 2.7];
temps_26_3=[0.02 0.02 0.06 0.29 1.03];
temps_26_6=[0.02 0.06 0.06 0.31 1.33];

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

