% iris classification system - Parallel - 3 MFs
% fuzzy inference system

% create a new fis1

fis1 = mamfis('Name',"Subsystem_1");

% IN 1
% create input variables and MF for input Sepal_length
fis1 = addInput(fis1,[0 1],'Name',"sepal_length");
% MF
% fis1 = addMF(fis1,"sepal_length","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
% fis1 = addMF(fis1,"sepal_length","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
% fis1 = addMF(fis1,"sepal_length","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

fis1 = addMF(fis1,"sepal_length","trimf",[0, 0.25, 0.5],'Name',"small");
fis1 = addMF(fis1,"sepal_length","trimf",[0.25, 0.5, 0.75],'Name',"medium");
fis1 = addMF(fis1,"sepal_length","trimf",[0.5, 0.75, 1],'Name',"large");

% fis1 = addMF(fis1,"sepal_length","gaussmf",[0.25 1],'Name',"small");
% fis1 = addMF(fis1,"sepal_length","gaussmf",[0.5 1],'Name',"medium");
% fis1 = addMF(fis1,"sepal_length","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis1 = addInput(fis1,[0 1],'Name',"sepal_width");
% MF
fis1 = addMF(fis1,"sepal_width","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis1 = addMF(fis1,"sepal_width","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis1 = addMF(fis1,"sepal_width","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis1 = addMF(fis1,"sepal_width","trimf",[0, 0.25, 0.5],'Name',"small");
% fis1 = addMF(fis1,"sepal_width","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis1 = addMF(fis1,"sepal_width","trimf",[0.5, 0.75, 1],'Name',"large");

% fis1 = addMF(fis1,"sepal_width","gaussmf",[0.25 1],'Name',"small");
% fis1 = addMF(fis1,"sepal_width","gaussmf",[0.5 1],'Name',"medium");
% fis1 = addMF(fis1,"sepal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis1 = addOutput(fis1,[0 1],'Name',"Sepal");
% MF
fis1 = addMF(fis1,"Sepal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis1 = addMF(fis1,"Sepal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis1 = addMF(fis1,"Sepal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

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
fis1 = addRule(fis1,ruleList);



% create a new fis2

fis2 = mamfis('Name',"Subsystem_2");

% IN 1
% create input variables and MF for input Sepal_length
fis2 = addInput(fis2,[0 1],'Name',"petal_length");
% MF
fis2 = addMF(fis2,"petal_length","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis2 = addMF(fis2,"petal_length","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis2 = addMF(fis2,"petal_length","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis2 = addMF(fis2,"petal_length","trimf",[0, 0.25, 0.5],'Name',"small");
% fis2 = addMF(fis2,"petal_length","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis2 = addMF(fis2,"petal_length","trimf",[0.5, 0.75, 1],'Name',"large");

% fis2 = addMF(fis2,"petal_length","gaussmf",[0.25 1],'Name',"small");
% fis2 = addMF(fis2,"petal_length","gaussmf",[0.5 1],'Name',"medium");
% fis2 = addMF(fis2,"petal_length","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis2 = addInput(fis2,[0 1],'Name',"petal_width");
% MF
fis2 = addMF(fis2,"petal_width","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis2 = addMF(fis2,"petal_width","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis2 = addMF(fis2,"petal_width","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis2 = addMF(fis2,"petal_width","trimf",[0, 0.25, 0.5],'Name',"small");
% fis2 = addMF(fis2,"petal_width","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis2 = addMF(fis2,"petal_width","trimf",[0.5, 0.75, 1],'Name',"large");

% fis2 = addMF(fis2,"petal_width","gaussmf",[0.25 1],'Name',"small");
% fis2 = addMF(fis2,"petal_width","gaussmf",[0.5 1],'Name',"medium");
% fis2 = addMF(fis2,"petal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis2 = addOutput(fis2,[0 1],'Name',"Petal");
% MF
fis2 = addMF(fis2,"Petal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis2 = addMF(fis2,"Petal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis2 = addMF(fis2,"Petal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

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
fis2 = addRule(fis2,ruleList);




% iris classification system - Parallel - 3 MFs
% fuzzy inference system

% create a new fis3

fis3 = mamfis('Name',"Subsystem_3");

% IN 1
% create input variables and MF for input Sepal_length
fis3 = addInput(fis3,[0 1],'Name',"Sepal");
% MF
fis3 = addMF(fis3,"Sepal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis3 = addMF(fis3,"Sepal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis3 = addMF(fis3,"Sepal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis3 = addMF(fis3,"Sepal","trimf",[0, 0.25, 0.5],'Name',"small");
% fis3 = addMF(fis3,"Sepal","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis3 = addMF(fis3,"Sepal","trimf",[0.5, 0.75, 1],'Name',"large");

% fis3 = addMF(fis3,"Sepal","gaussmf",[0.25 1],'Name',"small");
% fis3 = addMF(fis3,"Sepal","gaussmf",[0.5 1],'Name',"medium");
% fis3 = addMF(fis3,"Sepal","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis3 = addInput(fis3,[0 1],'Name',"Petal");
% MF
fis3 = addMF(fis3,"Petal","trapmf",[-0.36 0 0.2 0.4],'Name',"small");
fis3 = addMF(fis3,"Petal","trapmf",[0.2, 0.4, 0.6, 0.8],'Name',"medium");
fis3 = addMF(fis3,"Petal","trapmf",[0.6, 0.8, 1, 1.2],'Name',"large");

% fis3 = addMF(fis3,"Petal","trimf",[0, 0.25, 0.5],'Name',"small");
% fis3 = addMF(fis3,"Petal","trimf",[0.25, 0.5, 0.75],'Name',"medium");
% fis3 = addMF(fis3,"Petal","trimf",[0.5, 0.75, 1],'Name',"large");

% fis3 = addMF(fis3,"Petal","gaussmf",[0.25 1],'Name',"small");
% fis3 = addMF(fis3,"Petal","gaussmf",[0.5 1],'Name',"medium");
% fis3 = addMF(fis3,"Petal","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis3 = addOutput(fis3,[0 1],'Name',"Flower");
% MF
fis3 = addMF(fis3,"Flower","trimf",[0, 0.16, 0.33],'Name',"Sentosa");
fis3 = addMF(fis3,"Flower","trimf",[ 0.33, 0.49, 0.65],'Name',"Versicolor");
fis3 = addMF(fis3,"Flower","trimf",[0.65, 0.81, 1],'Name',"Virginica");

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
fis3 = addRule(fis3,ruleList);



