%MATLAB Computer Homework#1
%INEL4505-070
%By: Paola A. Nieves | Juan F. Rosario

%%% 3rd Order System Step Response %%%

%TF parameters:
omegan=1;
alphar=1;
a=0.7;
zeta=0.3;

s=tf ('s'); % Define 's' as an LTI object in polynomial form.
num=(((omegan)^2*alphar)/(a))*(s+a);
den=(s^2+2*zeta*omegan*s+omegan^2)*(s+alphar);

G= [num]/[den] %transfer function

figure
subplot(1,2,1)
step(G)
grid

subplot(1,2,2)
pzmap(G)