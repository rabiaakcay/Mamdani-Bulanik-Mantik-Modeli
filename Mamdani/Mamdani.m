%************************************************
% Mamdani Algorithm
clear; clc; clf;
x = 40;  y = 0.2;  z = 0.6;
%X-Number of Students
LXL = 0;                LXT = 0;                     LXR = 50;
MXL = 0;                MXT = 50;                    MXR = 100;
HXL = 50;               HXT = 100;                   HXR = 100;  
% Y-Current Applicability
LYL = 0;                LYT = 0;                     LYR = 0.5;
MYL = 0;                MYT = 0.5;                   MYR = 1;
HYL = 0.5;              HYT = 1;                     HYR = 1;  
% Z-Theoretical Infrastructure Contribution
LZL = 0;                LZT = 0;                     LZR = 0.5;
MZL = 0;                MZT = 0.5;                   MZR = 1;
HZL = 0.5;              HZT = 1;                     HZR = 1;
% W-Will you continue?
NWL = 0;                NWT = 0;                     NWR = 0.5;
UWL = 0;                UWT = 0.5;                   UWR = 1;
YWL = 0.5;              YWT = 1;                     YWR = 1;

%Rules
K=   [  NWT    NWT   NWT
        UWT    UWT   UWT
        YWT    YWT   YWT ];

%Fuzzification
MULX=triangle(LXL, LXT, LXR, x); 
MUMX=triangle(MXL, MXT, MXR, x); 
MUHX=triangle(HXL, HXT, HXR, x);

MULY=triangle(LYL, LYT, LYR, y); 
MUMY=triangle(MYL, MYT, MYR, y); 
MUHY=triangle(HYL, HYT, HYR, y);

MULZ=triangle(LZL, LZT, LZR, z); 
MUMZ=triangle(MZL, MZT, MZR, z); 
MUHZ=triangle(HZL, HZT, HZR, z);

%Rule Processing 
MU = [min([MULX, MULY, MULZ])      min([MUMX, MULY, MULZ])   min([MUHX, MULY, MULZ])
      min([MULX, MULY, MUMZ])      min([MUMX, MULY, MUMZ])   min([MUHX, MULY, MUMZ])
      min([MULX, MULY, MUHZ])      min([MUMX, MULY, MUHZ])   min([MUHX, MULY, MUHZ])
      min([MULX, MUMY, MULZ])      min([MUMX, MUMY, MULZ])   min([MUHX, MUMY, MULZ])
      min([MULX, MUMY, MUMZ])      min([MUMX, MUMY, MUMZ])   min([MUHX, MUMY, MUMZ])
      min([MULX, MUMY, MUHZ])      min([MUMX, MUMY, MUHZ])   min([MUHX, MUMY, MUHZ])
      min([MULX, MUHY, MULZ])      min([MUMX, MUHY, MULZ])   min([MUHX, MUHY, MULZ])
      min([MULX, MUHY, MUMZ])      min([MUMX, MUHY, MUMZ])   min([MUHX, MUHY, MUMZ])
      min([MULX, MUHY, MUHZ])      min([MUMX, MUHY, MUHZ])   min([MUHX, MUHY, MUHZ])];

MUK=[ MU(2,1)*K(1,1)          MU(2,2)*K(1,2)                    
      MU(3,1)*K(2,1)          MU(3,2)*K(2,2)           
      MU(5,1)*K(3,1)          MU(5,2)*K(3,2)];
%Defuzzification 
Total1=0; Total2=0; 
for i=1:3 
  for j=1:2 
      Total1=Total1+MUK(i,j); 
end 
end 
for i=1:9 
  for j=1:3
      Total2=Total2+MU(i,j);
end 
end 
 
z=Total1/Total2 
