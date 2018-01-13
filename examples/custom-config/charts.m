close all; clear; clc

M = csvread('data.csv');
M = M';
overhead = median(M(:,1));
ops = M(:,2:end);
sizes = 2.^(0:1:20);

%% box plot
boxplot(ops-overhead)
xticklabels(string(sizes))

%% histogram
figure
idxs = fliplr(1+5:5:21);
for i = idxs
    histogram(ops(:,i))
    hold on
end
legend('apply at size ' + string(sizes(idxs)))