function CreateFiguresOfCl(Cl_vector_MTH,Cl_vector_BEM,Cl_vector_Pr,r)

figure;
plot(r(2:end-1,1),Cl_vector_MTH(2:end-1,1),'b',r(2:end-1,1),Cl_vector_BEM(2:end-1,1),'g',r(2:end-1,1),Cl_vector_Pr(2:end-1,1),'r');
title('$C_l$ for $v_c = 0$ ','Interpreter','Latex');
legend('Cl_{MTH}','Cl_{BEM}','Cl_{BEM + Pr}','Location','SouthEast');
ylabel('$C_l$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

end