data = load('train.dat');
[m,n] = size(data);
avgUps=0;
iters = 2000;
eta=1;

% for i=1:iters
% 	data = data(randperm(m),:);
% 	[w,ups]=pla(data,eta);
% 	avgUps=avgUps+ups;
% end

% avgUps = avgUps/iters;

maxUps = 50;
data = load('train2.dat');
[W, updates]=pocket(data,eta,maxUps);
W
updates

% for i=1:iters
% 	data = data(randperm(m),:);
% 	[w,ups]=pocket(data,eta,maxUps);
% end
