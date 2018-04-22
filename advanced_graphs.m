%%% ADVANCED
% Abscisses
% 1) Nombre d'éléments
elem_15_4=[720 1260 2760 4680 8360];
elem_15_8=[720 1260 2760 4680 8360];
elem_26_3=[60 220 840 3840 18700  87200];
elem_26_6=[60 22 840 3440 21300 85800];
% 2) Nombre de degrés de liberté
ddl_15_4=[4400 7665 16713 28273 50408];
ddl_15_8=[4481 7771 16867 28467 50657];
ddl_26_3=[76 258 913 4011 19023 87023];
ddl_26_6=[273 957 3507 14063 85951 344715];

% Ordonnées
% 1) Total Potential Energy
tpe_15_4=[24164 24194 24220 24234 24240];
tpe_15_8=[24248 24250 24250 24252 24252];
tpe_26_3=[11142 11422 11780 12087 12131 12130]*2;
tpe_26_6=[11448 11654 12088 12104 12119 12137];
% 2) Temps de calcul
temps_15_4=[0.04 0.06 0.15 0.21 0.4];
temps_15_8=[0.07 0.11 0.33 0.41 0.67];
%temps_26_3=[];
%temps_26_6=[];

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
%hold on
%plot(elem_26_3,temps_26_3)
%hold on
%plot(elem_26_6,temps_26_6)
xlabel('Nombre d''éléments')
ylabel('Temps de calcul (s)')
title('Temps de calcul en fonction du nombre d''éléments')
legend('[T15](4)','[T15](8)','location','best');
%% Temps de calcul en fonction du nombre de ddl
plot(ddl_15_4,temps_15_4)
hold on
plot(ddl_15_8,temps_15_8)
%hold on
%plot(ddl_26_3,temps_26_3)
%hold on
%plot(ddl_26_6,temps_26_6)
xlabel('Nombre de degrés de liberté')
ylabel('Temps de calcul')
title('Temps de calcul en fonction du nombre de degrés de liberté')
legend('[T15](4)','[T15](8)','location','best');
