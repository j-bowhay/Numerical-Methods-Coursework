% set parameters
m1 = 0.075;
m2 = 0.055;
% and initial condition
IC = [0.1; -0.05];
% no added mass
m = m1;
[t,y] = ode45(@(t,y) rhs_spring_v2(t,y,m),[0 5],IC);
% with added mass
options = odeset('Events',@springEvent);
m = m1;
[t1,y1,te,ye,ie] = ode45(@(t,y) rhs_spring_v2(t,y,m),[0 5],IC,options);
tstar = te;        % event time
IC = y1(end,:)';   % final state vector [disp; vel]
m = m1+m2;
[t2,y2] = ode45(@(t,y) rhs_spring_v2(t,y,m),[t1(end) 5],IC);
% plot graphs
subplot(2,1,1);
plot(t,y(:,1),'r-',...
    t1,y1(:,1),'g-',t2,y2(:,1),'g-',te,ye(1),'gx');
xlabel('t'); ylabel('x(t)');
xlim([0 5]);
legend('without added mass','with added mass');
subplot(2,1,2);
plot(t,y(:,2),'r-',...
    t1,y1(:,2),'g-',t2,y2(:,2),'g-',te,ye(2),'gx');
xlabel('t'); ylabel('dx/dt(t)');
xlim([0 5]);
legend('without added mass','with added mass');