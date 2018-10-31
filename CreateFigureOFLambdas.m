function CreateFigureOFLambdas(LambdaMTH,LambdaBEM,LambdaBEMPr,r,N)

LambdaMTH_v = LambdaMTH*ones(N,1);

figure;
plot(r,LambdaMTH_v,'b',r,LambdaBEM,'g',r,LambdaBEMPr,'o');
title('Non dimensional induced velocity \lambda_i','Interpreter','Latex');
legend('\lambda_{MTH}','\lambda_{BEM}','\lambda_{BEM + Pr}','Location','SouthEast');
ylabel('\lambda_i','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

end