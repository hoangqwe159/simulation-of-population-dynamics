function [yval] = PopGrowthDelay(y0, r, h, K, s, steps)
    yval = zeros(1, steps + 1);
    yval(1) = y0;
    for i=1:steps
        temp = y0;
        if (i - s) >= 1
            temp = yval(i - s);
        end
        yval(i+1) = yval(i) * (1 + h*r - h*r*temp/K);
    end
%     figure
%     plot(1:steps+1,yval,"b","LineWidth",2)
%     title(["s = ",num2str(s)])

end