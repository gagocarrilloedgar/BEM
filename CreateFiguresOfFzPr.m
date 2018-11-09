function CreateFiguresOfFzPr(dF1,dF2,dF3,dF4,r)

figure;
plot(r,dF1,'b',r,dF2,'g',r,dF3,'r',r,dF4);
title('Non dimensional $F_z$ from BEM + Compressibility + Prandtl ','Interpreter','Latex');
legend('v_c = 0 ','v_c = 2.5 ','v_c = 5 ','v_c = 7.5 ','Location','SouthEast');
ylabel('$\frac{dF_z}{dx}$','Interpreter','Latex');
xlabel('$r$','Interpreter','Latex');

end