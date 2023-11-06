% iris classification system - Conventional FLS - 2 MFs
% fuzzy inference system

% create a new fis

fis = mamfis('Name',"Iris_FLS");

% IN 1
% create input variables and MF for input Sepal_length
fis = addInput(fis,[0 1],'Name',"sepal_length");
% MF
fis = addMF(fis,"sepal_length","trapmf",[0, 0, 0.4, 0.6],'Name',"small");
fis = addMF(fis,"sepal_length","trapmf",[0.4, 0.6, 1, 1],'Name',"large");

% fis = addMF(fis,"sepal_length","trimf",[0, 0.3, 0.6],'Name',"small");
% fis = addMF(fis,"sepal_length","trimf",[0.4, 0.7, 1],'Name',"large");

% fis = addMF(fis,"sepal_length","gaussmf",[0.25 1],'Name',"small");
% fis = addMF(fis,"sepal_length","gaussmf",[0.75 1],'Name',"large");
% IN 2
% create input variables and MF for input Sepal_length
fis = addInput(fis,[0 1],'Name',"sepal_width");
% MF
fis = addMF(fis,"sepal_width","trapmf",[0, 0, 0.4, 0.6],'Name',"small");
fis = addMF(fis,"sepal_width","trapmf",[0.4, 0.6, 1, 1],'Name',"large");

% fis = addMF(fis,"sepal_width","trimf",[0, 0.3, 0.6],'Name',"small");
% fis = addMF(fis,"sepal_width","trimf",[0.4, 0.7, 1],'Name',"large");

% fis = addMF(fis,"sepal_width","gaussmf",[0.25 1],'Name',"small");
% fis = addMF(fis,"sepal_width","gaussmf",[0.75 1],'Name',"large");
% IN 3
% create input variables and MF for input Sepal_length
fis = addInput(fis,[0 1],'Name',"petal_length");
% MF
fis = addMF(fis,"petal_length","trapmf",[0, 0, 0.4, 0.6],'Name',"small");
fis = addMF(fis,"petal_length","trapmf",[0.4, 0.6, 1, 1],'Name',"large");

% fis = addMF(fis,"petal_length","trimf",[0, 0.3, 0.6],'Name',"small");
% fis = addMF(fis,"petal_length","trimf",[0.4, 0.7, 1],'Name',"large");

% fis = addMF(fis,"petal_length","gaussmf",[0.25 1],'Name',"small");
% fis = addMF(fis,"petal_length","gaussmf",[0.75 1],'Name',"large");
% IN 4
% create input variables and MF for input Sepal_length
fis = addInput(fis,[0 1],'Name',"petal_width");
% MF
fis = addMF(fis,"petal_width","trapmf",[0, 0, 0.4, 0.6],'Name',"small");
fis = addMF(fis,"petal_width","trapmf",[0.4, 0.6, 1, 1],'Name',"large");

% fis = addMF(fis,"petal_width","trimf",[0, 0.3, 0.6],'Name',"small");
% fis = addMF(fis,"petal_width","trimf",[0.4, 0.7, 1],'Name',"large");

% fis = addMF(fis,"petal_width","gaussmf",[0.25 1],'Name',"small");
% fis = addMF(fis,"petal_width","gaussmf",[0.75 1],'Name',"large");
% Out
% create output variable and MF for input Sepal_length
fis = addOutput(fis,[0 1],'Name',"Flower");
% MF
fis = addMF(fis,"Flower","trimf",[0, 0.16, 0.33],'Name',"Sentosa");
fis = addMF(fis,"Flower","trimf",[ 0.33, 0.49, 0.65],'Name',"Versicolor");
fis = addMF(fis,"Flower","trimf",[0.65, 0.81, 1],'Name',"Virginica");


% rule
ruleList = [1, 1, 1, 1, 1,1,1;
1, 1, 1, 2, 2,1,1;
1, 1, 2, 1, 2,1,1;
1, 1, 2, 2, 3,1,1;
1, 2, 1, 1, 1,1,1;
1, 2, 1, 2, 2,1,1;
1, 2, 2, 1, 3,1,1;
1, 2, 2, 2, 3,1,1;
2, 1, 1, 1, 1,1,1;
2, 1, 1, 2, 2,1,1;
2, 1, 2, 1, 2,1,1;
2, 1, 2, 2, 3,1,1;
2, 2, 1, 1, 2,1,1;
2, 2, 1, 2, 3,1,1;
2, 2, 2, 1, 2,1,1;
2, 2, 2, 2, 3,1,1];

% add rules
fis = addRule(fis,ruleList);
