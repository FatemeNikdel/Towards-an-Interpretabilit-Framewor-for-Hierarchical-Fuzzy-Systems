clear all;
% H Framework
% Demonstration of framework to the Iris classification problem
% Table 2: Interpretability of the Iris systems; F-3, P-3 and S-3 using the Hmean

run('Set_MFs_3/F_3.m')
run('Set_MFs_3/P_3.m')
run('Set_MFs_3/S_3.m')
% run('Fuzzy_and_Nauck_Index/Fuzzy_Index.m')
% run('Fuzzy_and_Nauck_Index/Nauck_Index.m')

%% 1. Calculate interpretability for each subsystem

% calculate Fuzzy Index for F-2 (FLS)
[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis);
Table_2_Fuzzy_Index_F_3={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_F_3.xls',Table_2_Fuzzy_Index_F_3);
% calculate Nauck Index for F-2 (FLS)
[comp cov part_I Nauck_out] = Nauck_Index(fis);
Table_2_Nauck_Index_F_3={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_F_3.xls',Table_2_Nauck_Index_F_3);

% calculate Fuzzy Index for P-2 (Parallel HFS)
[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis1);
Table_2_Fuzzy_Index_P_3_subsystem1={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_P_3_subsystem1.xls',Table_2_Fuzzy_Index_P_3_subsystem1);
F_sub1_P3=out_RB4;

[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis2);
Table_2_Fuzzy_Index_P_3_subsystem2={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_P_3_subsystem2.xls',Table_2_Fuzzy_Index_P_3_subsystem2);
F_sub2_P3 = out_RB4;

[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis3);
Table_2_Fuzzy_Index_P_3_subsystem3={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_P_3_subsystem3.xls',Table_2_Fuzzy_Index_P_3_subsystem3);
F_sub3_P3 = out_RB4;

% calculate Nauck Index for S-2 (Serial HFS)
[comp cov part_I Nauck_out]=Nauck_Index(fis1);
Table_2_Nauck_Index_P_3_subsystem1={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_P_3_subsystem1.xls',Table_2_Nauck_Index_P_3_subsystem1);
N_sub1_P3 = Nauck_out;

[comp cov part_I Nauck_out]=Nauck_Index(fis2);
Table_2_Nauck_Index_P_2_subsystem2={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_P_3_subsystem2.xls',Table_2_Nauck_Index_P_2_subsystem2);
N_sub2_P3 = Nauck_out;

[comp cov part_I Nauck_out]=Nauck_Index(fis3);
Table_2_Nauck_Index_P_3_subsystem3={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_P_3_subsystem3.xls',Table_2_Nauck_Index_P_3_subsystem3);
N_sub3_P3 = Nauck_out;

% calculate Fuzzy Index for S-2 (Serial HFS)
[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis4);
Table_2_Fuzzy_Index_S_3_subsystem1={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_S_3_subsystem1.xls',Table_2_Fuzzy_Index_S_3_subsystem1);
F_sub1_S3 = out_RB4;

[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis5);
Table_2_Fuzzy_Index_S_3_subsystem2={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_S_3_subsystem2.xls',Table_2_Fuzzy_Index_S_3_subsystem2);
F_sub2_S3 = out_RB4;

[total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]=Fuzzy_Index(fis6);
Table_2_Fuzzy_Index_S_3_subsystem3={'total_rule' 'premis' 'Num1' 'Num2' 'Num3' 'Aver_Num_label' 'total_class' 'out_RB4';
    total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4};
xlswrite('Table_2_Fuzzy_Index_S_3_subsystem3.xls',Table_2_Fuzzy_Index_S_3_subsystem3);
F_sub3_S3 = out_RB4;


% calculate Nauck Index for S-2 (Serial HFS)
[comp cov part_I Nauck_out]=Nauck_Index(fis4);
Table_2_Nauck_Index_S_3_subsystem1={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_S_3_subsystem1.xls',Table_2_Nauck_Index_S_3_subsystem1);
N_sub1_S3 = Nauck_out;

[comp cov part_I Nauck_out]=Nauck_Index(fis5);
Table_2_Nauck_Index_S_3_subsystem2={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_S_3_subsystem2.xls',Table_2_Nauck_Index_S_3_subsystem2);
N_sub2_S3 = Nauck_out;

[comp cov part_I Nauck_out]=Nauck_Index(fis6);
Table_2_Nauck_Index_S_3_subsystem3={'comp' 'cov' 'part_I' 'Nauck_out';
    comp cov part_I Nauck_out};
xlswrite('Table_2_Nauck_Index_S_3_subsystem3.xls',Table_2_Nauck_Index_S_3_subsystem3);
N_sub3_S3 = Nauck_out;


%% 2. Identify the layer-weights (for this case, decreasing weight strategy is applied as be seen in equation (7))

% HFS with 2 layers: P-2
%  l_2_1 = (2*(2-1 + 1)) / (2*(2+1));
%  l_2_2 = (2*(2-2 + 1)) / (2*(2+1));
 l_2_1 = 1/2;
 l_2_2 = 1/2;
%   l_2_1 = (2*1) / (2*(2+1));
%   l_2_2 = (2*2) / (2*(2+1));

% HFS with 3 layers: S-2
%  l_3_1 = (2*(3-1 + 1)) / (3*(3+1));
%  l_3_2 = (2*(3-2 + 1)) / (3*(3+1));
%  l_3_3 = (2*(3-3 + 1)) / (3*(3+1));
% l_3_1 = 1/3;
% l_3_2 = 1/3;
% l_3_3 = 1/3;
  l_3_1 = (2*1) / (3*(3+1));
  l_3_2 = (2*2) / (3*(3+1));
  l_3_3 = (2*2) / (3*(3+1));
%% 3. Calculate the overall interpretability - H Framework (for this case, mean aggregation strategy is applied (Hmean))
% F-2 (Note that Hmean returns the original FLS index (e.g., Nauck and Fuzzy index) when applied to a standard FLS because it has only one subsystem and one layer.)

% P-2 
Hmean_F_P3 =  l_2_1 * ((F_sub1_P3 + F_sub2_P3)/2) +  l_2_2 * F_sub3_P3;
dlmwrite('Table_2_Fuzzy_Index_P_3_Hmean.txt',Hmean_F_P3)
Hmean_N_P3 =  l_2_1 * ((N_sub1_P3 + N_sub2_P3)/2) +  l_2_2 * N_sub3_P3;
dlmwrite('Table_2_Nauck_Index_P_3_Hmean.txt',Hmean_N_P3)
% S-2
Hmean_F_S3 = (l_3_1 * F_sub1_S3) + (l_3_2 * F_sub2_S3) + (l_3_3 * F_sub3_S3);
dlmwrite('Table_2_Fuzzy_Index_S_3_Hmean.txt',Hmean_F_S3)
Hmean_N_S3 = (l_3_1 * N_sub1_S3) + (l_3_2 * N_sub2_S3) + (l_3_3 * N_sub3_S3);
dlmwrite('Table_2_Nauck_Index_S_3_Hmean.txt',Hmean_N_S3)
%%  Calculate the overall interpretability - H Framework (for this case, mean aggregation strategy is applied (Hmean))
% F-2 (Note that Hmean returns the original FLS index (e.g., Nauck and Fuzzy index) when applied to a standard FLS because it has only one subsystem and one layer.)

% P-2 
Hmin_F_P3 =  l_2_1 * (min(F_sub1_P3 , F_sub2_P3)) +  l_2_2 * F_sub3_P3;
dlmwrite('Table_2_Fuzzy_Index_P_3_Hmin.txt',Hmin_F_P3)
Hmin_N_P3 =  l_2_1 * (min(N_sub1_P3 , N_sub2_P3)) +  l_2_2 * N_sub3_P3;
dlmwrite('Table_2_Nauck_Index_P_3_Hmin.txt',Hmin_N_P3)
% S-2
Hmin_F_S3 = (l_3_1 * F_sub1_S3) + (l_3_2 * F_sub2_S3) + (l_3_3 * F_sub3_S3);
dlmwrite('Table_2_Fuzzy_Index_S_3_Hmin.txt',Hmin_F_S3)
Hmin_N_S3 = (l_3_1 * N_sub1_S3) + (l_3_2 * N_sub2_S3) + (l_3_3 * N_sub3_S3);
dlmwrite('Table_2_Nauck_Index_S_3_Hmin.txt',Hmin_N_S3)
%%  Calculate the overall interpretability - H Framework (for this case, mean aggregation strategy is applied (Hmean))
% F-2 (Note that Hmean returns the original FLS index (e.g., Nauck and Fuzzy index) when applied to a standard FLS because it has only one subsystem and one layer.)

% P-2 
Hmax_F_P3 =  l_2_1 * (max(F_sub1_P3 , F_sub2_P3)) +  l_2_2 * F_sub3_P3;
dlmwrite('Table_2_Fuzzy_Index_P_3_Hmax.txt',Hmax_F_P3)
Hmax_N_P3 =  l_2_1 * (max(N_sub1_P3 , N_sub2_P3)) +  l_2_2 * N_sub3_P3;
dlmwrite('Table_2_Nauck_Index_P_3_Hmax.txt',Hmax_N_P3)
% S-2
Hmax_F_S3 = (l_3_1 * F_sub1_S3) + (l_3_2 * F_sub2_S3) + (l_3_3 * F_sub3_S3);
dlmwrite('Table_2_Fuzzy_Index_S_3_Hmax.txt',Hmax_F_S3)
Hmax_N_S3 = (l_3_1 * N_sub1_S3) + (l_3_2 * N_sub2_S3) + (l_3_3 * N_sub3_S3);
dlmwrite('Table_2_Nauck_Index_S_3_Hmax.txt',Hmax_N_S3)





