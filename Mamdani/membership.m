clear; clc; clc;

x = 0:0.01:100;
d1 = 0; 
d2 = 0;
d3 = 50;

o1 = 0; 
o2 = 50;
o3 = 100;

y1 = 50; 
y2 = 100;
y3 = 100;

ds1 = (x-d1)/(d2-d1);
ds2 = (d3-x)/(d3-d2);
sond = max(min(ds1,ds2),0);

os1 = (x-o1)/(o2-o1);
os2 = (o3-x)/(o3-o2);
sono = max(min(os1,os2),0);

ys1 = (x-y1)/(y2-y1);
ys2 = (y3-x)/(y3-y2);
sony = max(min(ys1,ys2),0);


plot(x,sond);
xlabel('X Deðerleri');
ylabel('Uyelik Derecesi');
grid

hold on
plot(x,sono);
plot(x,sony);
hold off