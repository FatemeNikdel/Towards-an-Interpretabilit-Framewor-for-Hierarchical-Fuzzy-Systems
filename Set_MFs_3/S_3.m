% iris classification system - Serial - 3 MFs
% fuzzy inference system

% create a new fis4

fis4 = mamfis('Name',"Subsystem_1");

% IN 1
% create input variables and MF for input Sepal_length
fis4 = addInput(fis4,[0 1],'Name',"sepal_length");
% MF
fis4 = addMF(fis4,"sepal_length","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis4 = addMF(fis4,"sepal_length","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis4 = addMF(fis4,"sepal_length","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis4 = addMF(fis4,"sepal_length","trimf",[0, 0.25, 0.5],'Name',"small");
% fis4 = addMF(fis4,"sepal_length","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis4 = addMF(fis4,"sepal_length","trimf",[0.5, 0.75, 1],'Name',"large");

% fis4 = addMF(fis4,"sepal_length","gaussmf",[0.25 1],'Name',"small");
% fis4 = addMF(fis4,"sepal_length","gaussmf",[0.5 1],'Name',"medium");
% fis4 = addMF(fis4,"sepal_length","gaussmf",[0.75 1],'Name',"large");

% IN 2
% create input variables and MF for input Sepal_length
fis4 = addInput(fis4,[0 1],'Name',"sepal_width");
% MF
fis4 = addMF(fis4,"sepal_width","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis4 = addMF(fis4,"sepal_width","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis4 = addMF(fis4,"sepal_width","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis4 = addMF(fis4,"sepal_width","trimf",[0, 0.25, 0.5],'Name',"small");
% fis4 = addMF(fis4,"sepal_width","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis4 = addMF(fis4,"sepal_width","trimf",[0.5, 0.75, 1],'Name',"large");

% fis4 = addMF(fis4,"sepal_width","gaussmf",[0.25 1],'Name',"small");
% fis4 = addMF(fis4,"sepal_width","gaussmf",[0.5 1],'Name',"medium");
% fis4 = addMF(fis4,"sepal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis4 = addOutput(fis4,[0 1],'Name',"Sepal");
% MF
fis4 = addMF(fis4,"Sepal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis4 = addMF(fis4,"Sepal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis4 = addMF(fis4,"Sepal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% rule
ruleList = [1, 1, 1,1,1;
  1, 2, 1,1,1;
  1, 3, 2,1,1;
  2, 1, 1,1,1;
  2, 2, 2,1,1;
  2, 3, 2,1,1;
  3, 1, 2,1,1;
  3, 2, 3,1,1;
  3, 3, 3,1,1];

% add rules
fis4 = addRule(fis4,ruleList);



% create a new fis5

fis5 = mamfis('Name',"Subsystem_2");

% IN 1
% create input variables and MF for input Sepal_length
fis5 = addInput(fis5,[0 1],'Name',"Sepal");
% MF
fis5 = addMF(fis5,"Sepal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis5 = addMF(fis5,"Sepal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis5 = addMF(fis5,"Sepal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis5 = addMF(fis5,"Sepal","trimf",[0, 0.25, 0.5],'Name',"small");
% fis5 = addMF(fis5,"Sepal","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis5 = addMF(fis5,"Sepal","trimf",[0.5, 0.75, 1],'Name',"large");

% fis5 = addMF(fis5,"Sepal","gaussmf",[0.25 1],'Name',"small");
% fis5 = addMF(fis5,"Sepal","gaussmf",[0.5 1],'Name',"medium");
% fis5 = addMF(fis5,"Sepal","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis5 = addInput(fis5,[0 1],'Name',"petal_width");
% MF
fis5 = addMF(fis5,"petal_width","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis5 = addMF(fis5,"petal_width","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis5 = addMF(fis5,"petal_width","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis5 = addMF(fis5,"petal_width","trimf",[0, 0.25, 0.5],'Name',"small");
% fis5 = addMF(fis5,"petal_width","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis5 = addMF(fis5,"petal_width","trimf",[0.5, 0.75, 1],'Name',"large");

% fis5 = addMF(fis5,"petal_width","gaussmf",[0.25 1],'Name',"small");
% fis5 = addMF(fis5,"petal_width","gaussmf",[0.5 1],'Name',"medium");
% fis5 = addMF(fis5,"petal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis5 = addOutput(fis5,[0 1],'Name',"Sepal_Petal");
% MF
fis5 = addMF(fis5,"Sepal_Petal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis5 = addMF(fis5,"Sepal_Petal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis5 = addMF(fis5,"Sepal_Petal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% rule
ruleList = [1, 1, 1,1,1;
  1, 2, 1,1,1;
  1, 3, 2,1,1;
  2, 1, 1,1,1;
  2, 2, 2,1,1;
  2, 3, 2,1,1;
  3, 1, 2,1,1;
  3, 2, 3,1,1;
  3, 3, 3,1,1];

% add rules
fis5 = addRule(fis5,ruleList);




% iris classification system - Parallel - 3 MFs
% fuzzy inference system

% create a new fis6

fis6 = mamfis('Name',"Subsystem_3");

% IN 1
% create input variables and MF for input Sepal_length
fis6 = addInput(fis6,[0 1],'Name',"Sepal_Petal");
% MF
fis6 = addMF(fis6,"Sepal_Petal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis6 = addMF(fis6,"Sepal_Petal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis6 = addMF(fis6,"Sepal_Petal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis6 = addMF(fis6,"Sepal_Petal","trimf",[0, 0.25, 0.5],'Name',"small");
% fis6 = addMF(fis6,"Sepal_Petal","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis6 = addMF(fis6,"Sepal_Petal","trimf",[0.5, 0.75, 1],'Name',"large");

% fis6 = addMF(fis6,"Sepal_Petal","gaussmf",[0.25 1],'Name',"small");
% fis6 = addMF(fis6,"Sepal_Petal","gaussmf",[0.5 1],'Name',"medium");
% fis6 = addMF(fis6,"Sepal_Petal","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis6 = addInput(fis6,[0 1],'Name',"petal_width");
% MF
fis6 = addMF(fis6,"petal_width","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis6 = addMF(fis6,"petal_width","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis6 = addMF(fis6,"petal_width","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis6 = addMF(fis6,"petal_width","trimf",[0, 0.25, 0.5],'Name',"small");
% fis6 = addMF(fis6,"petal_width","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis6 = addMF(fis6,"petal_width","trimf",[0.5, 0.75, 1],'Name',"large");

% fis6 = addMF(fis6,"petal_width","gaussmf",[0.25 1],'Name',"small");
% fis6 = addMF(fis6,"petal_width","gaussmf",[0.5 1],'Name',"medium");
% fis6 = addMF(fis6,"petal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis6 = addOutput(fis6,[0 1],'Name',"Flower");
% MF
fis6 = addMF(fis6,"Flower","trimf",[0, 0.16, 0.33],'Name',"Sentosa");
fis6 = addMF(fis6,"Flower","trimf",[ 0.33, 0.49, 0.65],'Name',"Versicolor");
fis6 = addMF(fis6,"Flower","trimf",[0.65, 0.81, 1],'Name',"Virginica");

% rule
ruleList = [1, 1, 1,1,1;
  1, 2, 1,1,1;
  1, 3, 2,1,1;
  2, 1, 1,1,1;
  2, 2, 2,1,1;
  2, 3, 2,1,1;
  3, 1, 2,1,1;
  3, 2, 3,1,1;
  3, 3, 3,1,1];

% add rules
fis6 = addRule(fis6,ruleList);



