function [c, ceq]=imo_lab9(x)
ceq=[];
tsym=0:0.1:20;
opt=simset('SrcWorkspace','Current');
sim('imo_lab9_s2',tsym,opt);
%options = optimoptions('fmincon','Algorithm','active-set');
p=[1.2 1.02 0.98 0.9];
t1=1.5;
t2=3.5;
t=tout;
y1 = y(t <= t2); 
y2 = y(t > t2); 
y3 = y(t > t2); 
y4 = y((t >= t1)&(t < t2)); 
% Kryterium sterowania - ograniczenia c(x)<0
c(1)=max(y1-p(1));
c(2)=max(y2-p(2));
c(3)=max(-y3+p(3));
c(4)=max(-y4+p(4));
%Graficzna prezentacja wynik?w
plot(t,y)
hold on;
plot([0 t2],[p(1) p(1)])
plot([t2 20],[p(2) p(2)])
plot([t2 20],[p(3) p(3)])
plot([t1 t2],[p(4) p(4)])
drawnow
hold off;
axis([0 20 0 1.3]);
grid on;
ylabel('y');
xlabel('t[s]')
end
%[x,f,e,o]=fmincon(@(x)(0),1,[],[],[],[],[0 0],[],@func)