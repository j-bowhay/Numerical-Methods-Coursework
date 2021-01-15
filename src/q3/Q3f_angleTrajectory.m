%% solve ODE for a range of theta
% generate range of theta
theta = [0:90];
landingx = zeros(1,91);

for i=theta
    landingx(i+1) = landingPosition(i);
end

%% Plot results
% configure plot
hold on
grid on
set(gca, "DefaultLineLineWidth", 2);
xlabel("\theta_{0}")
ylabel("x")
title("Landing position against theta")

plot(theta,landingx)
plot([0 90], [0 0],'g-')

