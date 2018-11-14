function CreateFiguresOfPower(dPt_dx_MTH,dPt_dx_BEM,dPt_dx_Pr,r)

figure;
plot(r,dPt_dx_MTH(:,1),'b',r,dPt_dx_BEM(:,1),'g',r,dPt_dx_Pr(:,1),'r');
title('$dF_x$ for $v_c =0$ ','Interpreter','Latex');
legend('dFx_{MTH}','dFx_{BEM}','dFx_{BEM + Pr}','Location','SouthEast');
ylabel('$\frac{dF_x}{dx}$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

end