function plot_graph_cgp(dims, data, weights, gtitle, type)
if type == 1
    loglog(dims, data(:,1)', '-s', 'DisplayName', num2str(weights(1)));
else
    semilogx(dims, data(:,1)', '-s', 'DisplayName', num2str(weights(1)));
end
hold on;
for i = 1:length(weights)
    if type == 1
        loglog(dims, data(:,i)', '-s', 'DisplayName', num2str(weights(i)));
    else
        semilogx(dims, data(:,i)', '-s', 'DisplayName', num2str(weights(i)));
    end
    hold on;
    legend('show');
end
hold off
title(gtitle);
end