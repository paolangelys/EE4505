%MATLAB Computer Homework#1
%INEL4505-070
%By: Paola A. Nieves | Juan F. Rosario

%%% 3rd Order System Step Response %%%

%TF parameters:
omegan=1;
alphar_array = [0.1,0.3,0.8,3];
a=0.7;
zeta=0.3;
G=[];

for alphar= alphar_array

    s = tf ('s'); % Define 's' as an LTI object in polynomial form.
    num = (((omegan)^2*alphar)/(a))*(s+a);
    den =(s^2+2*zeta*omegan*s+omegan^2)*(s+alphar);

    G = [G, [num]/[den]] %transfer function  
end

%Plots
valuesAsString = num2str(alphar_array');
cellContent = cellstr("\alpha_{r}= "+ valuesAsString)';
trimmedStrings = strtrim(cellContent);


figure
subplot(1,2,1);

for g = G
    step(g)
    hold on
    grid on
end

legend(trimmedStrings);

hold off
subplot(1,2,2);

for g = G
    pzmap(g)
    hold on
    pole(G)
end

legend(trimmedStrings);