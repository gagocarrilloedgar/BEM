function CreateFiguresOfThetaAndSigma(Theta_ideal_r,Sigma_ideal_r,Theta_real,Sigma_real,r)

figure;
plot(r,Theta_real,'b',r,Theta_ideal_r,'g');
title('$\theta_{real}$ and $\theta_{ideal}$ vs r','Interpreter','Latex');
legend('\theta_{real}','\theta_{ideal}','Location','NorthEast');
ylabel('$\theta$','Interpreter','Latex');
xlabel('r','Interpreter','Latex');


figure;
plot(r,Sigma_real,'b',r,Sigma_ideal_r,'g');
title('$\sigma_{real}$ and $\sigma_{ideal}$ vs r','Interpreter','Latex');
legend('\sigma_{real}','\sigma_{ideal}','Location','NorthEast');
ylabel('$\sigma$','Interpreter','Latex');
xlabel('r','Interpreter','Latex');

end