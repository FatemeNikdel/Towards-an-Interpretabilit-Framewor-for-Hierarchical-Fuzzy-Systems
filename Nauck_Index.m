function [comp cov part_I Nauck_out] = Nauck_Index(fis)

%fis = tipper()
  total_rule = length(fis.rule);
  total_class = length(fis.Outputs.MembershipFunctions);
  NumInputs= length(fis.input);
  premis = 0;
  comp = 0;
  cov = 0;
  f_term = 0;
  part = 0;
  part_I = 0;
  Nauck_I = 0;
  
  if ( ~isempty(total_rule ) )
      for i = 1:total_rule
          for j = 1:NumInputs
              if ( fis.Rules(1, i).Antecedent(j) ~= 0 )                
                  premis = premis + 1;
              end
          end
      end
  end

% calculate complexity
comp = total_class / premis;


% calculate coverage (assume that SFPs)
total_y1 = 0;
total_y2 = 0;
total_y3 = 0;
cov_trapmf = 0;
cov_gaussmf = 0;
cov_trimf = 0;
for i = 1:NumInputs
  for j = 1:length(fis.Inputs(1, i).MembershipFunctions)
      if (fis.Inputs(1, i).MembershipFunctions(1, j).Type == "trapmf")
      start_end = fis.Inputs(1, i).Range;
      a = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(1);
      b = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(2);
      c = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(3);
      d = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(4);
      %x=start_end[1]:start_end[2]
      x =linspace(start_end(1),start_end(2),11);
      y= max(min( [(x-a)/(b-a), 1, (d-x)/(d-c)] ), 0);
      y(isnan(y)) = 1;
      y = sum(y);
      total_y1 = total_y1 + y;
      cov_trapmf = total_y1 / 11;
      
      %  print(y)
    elseif (fis.Inputs(1, i).MembershipFunctions(1, j).Type == "trimf")
      start_end = fis.Inputs(1, i).Range;
      a = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(1);
      b = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(2);
      c = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(3);
      % x=start_end[1]:start_end[2]
      x =linspace(start_end(1),start_end(2),11);
      y= max(min( [(x-a)/(b-a), (c-x)/(c-b)] ), 0);
      y(isnan(y)) = 1;
      y = sum(y);
      total_y2 = total_y2 + y;
      cov_trimf = total_y2 / 11;
      
    elseif (fis.Inputs(1, i).MembershipFunctions(1, j).Type == "gaussmf")
      start_end = fis.Inputs(1, i).Range;
      sig = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(1);
      c_u = fis.Inputs(1, i).MembershipFunctions(1, j).Parameters(2);
      %  x=start_end[1]:start_end[2]
      x =linspace(start_end(1),start_end(2),11);
      y = exp(-(x - c_u).^2/(2 * sig^2));
      y = sum(y);
      total_y3 = total_y3 + y;
      cov_gaussmf = total_y3 / 11;
      
      end
  end
  total_cov = cov_trapmf + cov_gaussmf + cov_trimf;
  ave_cov = total_cov / NumInputs;
  
  if (ave_cov > 1)
    cov = 1;
  else
    cov = ave_cov;
  end
  
end

% calculate partition index
for  i = 1 : NumInputs
  f_term  = length(fis.Inputs(1, i).MembershipFunctions);
  part = part + (1/(f_term - 1) );
  %print(part)
end

part_I = part / NumInputs;

% Nauck's Index

 Nauck_out = comp * cov * part_I;

  fprintf ("<<< Nauck Index >>>\n")
  fprintf ("Comp : %d\n",round(comp,3))
  fprintf ("Cov : %d\n",round(cov,3))
  fprintf ("Part : %d\n",round(part_I,3))
  fprintf ("Index : %d\n",round(Nauck_out,3))
  
  
  
end

