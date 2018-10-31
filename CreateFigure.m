function CreateFigure(X,Y,X_unif,Y_chip,Y_spline,Y_axis,figuretitle)

figure;
plot(X,Y,'o',X_unif,Y_chip,'-',X_unif,Y_spline,'-.');
title(figuretitle,'Interpreter','Latex');
legend('Sample Points','pchip','spline','Location','SouthEast');
ylabel(Y_axis,'Interpreter','Latex');
xlabel('$\alpha$','Interpreter','Latex');

end