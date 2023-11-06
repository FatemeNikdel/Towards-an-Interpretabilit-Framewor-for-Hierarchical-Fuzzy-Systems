function  [total_rule premis Num1 Num2 Num3 Aver_Num_label total_class out_RB4]= Fuzzy_Index(fis)


  total_rule = length(fis.rule);
  total_class = length(fis.Outputs.MembershipFunctions);
  NumInputs= length(fis.input);
  premis = 0;
  n = 0;
  comp = 8;
  f_term = 0;
  Num_label = 0;
  Aver_Num_label = 0;
  Num1 = 0;
  Num2 = 0;
  Num3 = 0;
  dum1 = 0;
  dum2 = 0;
  dum3 = 0;
  
  
  if ( ~isempty(total_rule ) )
      for i = 1:total_rule
          for j = 1:NumInputs
              if ( fis.Rules(1, i).Antecedent(j) ~= 0)
                  premis = premis + 1;
                  n = n + 1;
              end
          end
          if (n==1)
              Num1 = Num1 + 1;
          elseif (n==2)
              Num2 = Num2 + 1;
          else
              Num3 = Num3 + 1;
          end
          n = 0;
      end
  end
  
  for  i = 1 : NumInputs
    f_term  = length(fis.Inputs(1, i).MembershipFunctions);
    Num_label = Num_label + f_term;
  end
  % Average number of labels define by input
  Aver_Num_label = Num_label / NumInputs;
  
 % calculate RB1
 RB1 = mamfis('Name',"RB1"); 
  % create input variables and output variable  
RB1 = addInput(RB1,[total_class (NumInputs * total_class*comp)],'Name',"Num_rule");
RB1 = addInput(RB1,[total_class ((2*comp)*NumInputs *total_class)],'Name',"Num_premise");
RB1 = addOutput(RB1,[0 1],'Name',"Rule_dimension");

% create MF for input Num of Rule
  a1 = total_class;
  b1 = total_class;
  c1 = (((NumInputs * total_class * comp)-total_class) /2) + total_class;
  a2 = total_class;
  b2 = (((NumInputs *total_class*comp)-total_class) /2) + total_class;
  c2 = NumInputs *total_class*comp;
  a3 = (((NumInputs *total_class*comp)-total_class) /2) + total_class;
  b3 = NumInputs *total_class*comp;
  c3 = NumInputs *total_class*comp;
  
  RB1 = addMF(RB1,"Num_rule","trimf",[a1,b1,c1],'Name',"Low");
  RB1 = addMF(RB1,"Num_rule","trimf",[a2,b2,c2],'Name',"Medium");
  RB1 = addMF(RB1,"Num_rule","trimf",[a3,b3,c3],'Name',"High");

  % create MF for input num of premise
  a4 = total_class;
  b4 = total_class;
  c4 = (2*comp)*NumInputs *total_class;
  a5 = total_class;
  b5 = (2*comp)*NumInputs *total_class;
  c5 = (2*comp)*NumInputs *total_class;
  
  RB1 = addMF(RB1,"Num_premise","trimf",[a4,b4,c4],'Name',"Low");
  RB1 = addMF(RB1,"Num_premise","trimf",[a5,b5,c5],'Name',"High");
  
  % create MF for Output Rule_dimension
  
  RB1 = addMF(RB1,"Rule_dimension","trimf",[-0.4, 0, 0.4],'Name',"Low");
  RB1 = addMF(RB1,"Rule_dimension","trimf",[0.1, 0.5, 0.9],'Name',"Medium");
  RB1 = addMF(RB1,"Rule_dimension","trimf",[0.6,1,1.4],'Name',"High");
  
  % rule
ruleList = [1,1,1,1,1;
    1,2,3,1,1;
    2,1,2,1,1;
    2,2,3,1,1;
    3,1,3,1,1;
    3,2,3,1,1];

% add rules
RB1 = addRule(RB1,ruleList);
  
 
if(total_rule > c3 && premis > c5)
    out_RB1 = 1;
elseif (total_rule < c3 && premis > c5)
        out_RB1 = 1;
elseif(total_rule > c3 && premis < c5)
    out_RB1 = evalfis(RB1,[c3,premis]);
else
    out_RB1 = evalfis(RB1,[total_rule,premis]);
end
  

 % calculate RB2
 RB2 = mamfis('Name',"RB2"); 
  % create input variables and output variable  
RB2 = addInput(RB2,[0 (NumInputs * total_class*comp)],'Name',"Num_rule_1");
RB2 = addInput(RB2,[0 ((comp/2)*NumInputs *total_class)],'Name',"Num_rule_2");
RB2 = addInput(RB2,[0 ((comp/4)*NumInputs *total_class)],'Name',"Num_rule_3_more");
RB2 = addOutput(RB2,[0 1],'Name',"Rule_complexity");

% create MF for input Num_rule_1
  a6 = 0;
  b6 = 0;
  c6 = NumInputs *total_class*comp;
  a7 = 0;
  b7 = NumInputs *total_class*comp;
  c7 = NumInputs *total_class*comp;
  
  RB2 = addMF(RB2,"Num_rule_1","trimf",[a6,b6,c6],'Name',"Low");
  RB2 = addMF(RB2,"Num_rule_1","trimf",[a7,b7,c7],'Name',"High");

  % create MF for input Num_rule_2
  a8 = 0;
  b8 = 0;
  c8 = (comp/2)*NumInputs *total_class;
  a9 = 0;
  b9 = (comp/2)*NumInputs *total_class;
  c9 = (comp/2)*NumInputs *total_class;
  
  RB2 = addMF(RB2,"Num_rule_2","trimf",[a8,b8,c8],'Name',"Low");
  RB2 = addMF(RB2,"Num_rule_2","trimf",[a9,b9,c9],'Name',"High");
  
  
  % create MF for input Num_rule_3_more
  a10 = 0;
  b10 = 0;
  c10 = (comp/4)*NumInputs *total_class;
  a11 = 0;
  b11 = (comp/4)*NumInputs *total_class;
  c11 = (comp/4)*NumInputs *total_class;
  
  RB2 = addMF(RB2,"Num_rule_3_more","trimf",[a10,b10,c10],'Name',"Low");
  RB2 = addMF(RB2,"Num_rule_3_more","trimf",[a11,b11,c11],'Name',"High");
  
  % create MF for Output Rule_dimension
  
  RB2 = addMF(RB2,"Rule_complexity","trimf",[-0.4, 0, 0.4],'Name',"Low");
  RB2 = addMF(RB2,"Rule_complexity","trimf",[0.1, 0.5, 0.9],'Name',"Medium");
  RB2 = addMF(RB2,"Rule_complexity","trimf",[0.6,1,1.4],'Name',"High");
  
  % rule
ruleList = [1, 1, 1, 1,1,1;
    1, 2, 1, 2,1,1;
    2, 1, 1, 1,1,1;
    2, 2, 1, 2,1,1;
    1, 1, 2, 3,1,1;
    1, 2, 2, 3,1,1;
    2, 1, 2, 2,1,1;
    2, 2, 2, 3,1,1];

% add rules
RB2 = addRule(RB2,ruleList);

if(Num1 > c7)
    eval1 = c7;
else
    eval1 = Num1;
end
if(Num2 > c9)
    eval2 = c9;
else
    eval2 = Num2;
end
if(Num3 > c11)
    eval3 = c11;
else
    eval3 = Num3;
end
  out_RB2 = evalfis(RB2 , [eval1,eval2,eval3]);

 % calculate RB3
 RB3 = mamfis('Name',"RB3"); 
  % create input variables and output variable  
RB3 = addInput(RB3,[0 1],'Name',"Rule_dimension");
RB3 = addInput(RB3,[0 1],'Name',"Rule_complexity");
RB3 = addOutput(RB3,[0 1],'Name',"Rule_inter");

% create MF for input Rule_dimension  
  RB3 = addMF(RB3,"Rule_dimension","trimf",[-0.4, 0, 0.4],'Name',"Low");
  RB3 = addMF(RB3,"Rule_dimension","trimf",[0.1, 0.5, 0.9],'Name',"Medium");
  RB3 = addMF(RB3,"Rule_dimension","trimf",[0.6,1,1.4],'Name',"High");

  % create MF for input Rule_complexity  
  RB3 = addMF(RB3,"Rule_complexity","trimf",[-0.4, 0, 0.48],'Name',"Low");
  RB3 = addMF(RB3,"Rule_complexity","trimf",[0.1, 0.5, 0.9],'Name',"Medium");
  RB3 = addMF(RB3,"Rule_complexity","trimf",[0.6,1,1.4],'Name',"High");
  
  % create MF for Output Rule_inter
  
  RB3 = addMF(RB3,"Rule_inter","trimf",[-0.25, 0, 0.25],'Name',"Very Low");
  RB3 = addMF(RB3,"Rule_inter","trimf",[0, 0.25, 0.5],'Name',"Low");
  RB3 = addMF(RB3,"Rule_inter","trimf",[0.25, 0.5, 0.75],'Name',"Medium");
  RB3 = addMF(RB3,"Rule_inter","trimf",[0.5, 0.75, 1],'Name',"High");
  RB3 = addMF(RB3,"Rule_inter","trimf",[0.75, 1, 1.25],'Name',"Very High");
  
  % rule
ruleList = [1, 1, 5,1,1;
    1, 2, 4,1,1;
    1, 3, 2,1,1;
    2, 1, 4,1,1;
    2, 2, 3,1,1;
    2, 3, 1,1,1;
    3, 1, 2,1,1;
    3, 2, 1,1,1;
    3, 3, 1,1,1];

% add rules
RB3 = addRule(RB3,ruleList);
  
  out_RB3 = evalfis(RB3,[out_RB1,out_RB2]);
  
   % calculate RB4
 RB4 = mamfis('Name',"RB4"); 
  % create input variables and output variable  
RB4 = addInput(RB4,[0 1],'Name',"Rule_inter");
RB4 = addInput(RB4,[2 9],'Name',"Average_label");
RB4 = addOutput(RB4,[0 1],'Name',"Inter_index");

% create MF for input Rule_inter  
  RB4 = addMF(RB4,"Rule_inter","trimf",[-0.25, 0, 0.25],'Name',"Very Low");
  RB4 = addMF(RB4,"Rule_inter","trimf",[0, 0.25, 0.5],'Name',"Low");
  RB4 = addMF(RB4,"Rule_inter","trimf",[0.25, 0.5, 0.75],'Name',"Medium");
  RB4 = addMF(RB4,"Rule_inter","trimf",[0.5, 0.75, 1],'Name',"High");
  RB4 = addMF(RB4,"Rule_inter","trimf",[0.75, 1, 1.25],'Name',"Very High");


  % create MF for input Average_label  
  a12=2;
  b12=2;
  c12=9;
  a13=2;
  b13=9;
  c13=9;
  RB4 = addMF(RB4,"Average_label","trimf",[a12,b12,c12],'Name',"Low");
  RB4 = addMF(RB4,"Average_label","trimf",[a13,b13,c13],'Name',"High");
  
  % create MF for Output Rule_inter
  
  RB4 = addMF(RB4,"Inter_index","trimf",[-0.25, 0, 0.25],'Name',"Very Low");
  RB4 = addMF(RB4,"Inter_index","trimf",[0, 0.25, 0.5],'Name',"Low");
  RB4 = addMF(RB4,"Inter_index","trimf",[0.25, 0.5, 0.75],'Name',"Medium");
  RB4 = addMF(RB4,"Inter_index","trimf",[0.5, 0.75, 1],'Name',"High");
  RB4 = addMF(RB4,"Inter_index","trimf",[0.75, 1, 1.25],'Name',"Very High");
  
  % rule
ruleList = [1, 1, 1,1,1;
    1, 2, 1,1,1;
    2, 1, 2,1,1;
    2, 2, 1,1,1;
    3, 1, 3,1,1;
    3, 2, 1,1,1;
    4, 1, 4,1,1;
    4, 2, 2,1,1;
    5, 1, 5,1,1;
    5, 2, 3,1,1];

% add rules
RB4 = addRule(RB4,ruleList);

  out_RB4 = evalfis(RB4,[out_RB3,Aver_Num_label]);
  
  fprintf ("<<< Fuzzy Index >>>\n")
  fprintf ("NR : %d\n",total_rule)
  fprintf ("NP : %d\n",premis)
  fprintf ("NRi=1 : %d\n",Num1 )
  fprintf ("NRi=2 : %d\n",Num2 )
  fprintf ("NRi>=3 : %d\n",Num3 )
  fprintf ("terms : %d\n",Aver_Num_label)
  fprintf ("NC : %d\n",total_class )
  fprintf ("Index : %d\n", round(out_RB4,3) )  
  
end