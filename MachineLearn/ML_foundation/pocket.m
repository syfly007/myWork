function [W, updates] = pocket(data,eta,maxUps)

[m,n] = size(data);

X = data(:,1:(n-1));
Y = data(:,n);

X = [ones(m, 1) X];
W = zeros(n,1);
Wt = zeros(n,1);

updates = 0;
find = false;

i=1;
k=1;

minErrNum = m;

idx = randperm(m);
while(!find)
	x = X(idx(i),:);
	y = Y(idx(i),:);

	if( sign(x*W) != y)
		Wt = Wt + eta*y*x'

		curErrNum = checkErrNum(X,Y,Wt)

		if(curErrNum < minErrNum)
			minErrNum = curErrNum
			W = Wt
		end

		updates++
		k=1;
		idx = randperm(m);
	else
		k++;
	end

	if(k == m || updates == maxUps)
		find = true;
	end

	i = mod(i,400)+1;
end
end



function [errNum] = checkErrNum(X,Y,W)
	errNum = 0;
	m = size(Y);

	for i=1:m
		x = X(i,:);
		y = Y(i,:);
		if(sign(x*W) != y)
			errNum++;
		end
	end
end