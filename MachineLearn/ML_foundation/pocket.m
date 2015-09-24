function [W, updates] = pocket(data,eta,maxUps)

[m,n] = size(data);

X = data(:,1:(n-1));
Y = data(:,n);

X = [ones(m, 1) X];
W = zeros(n,1);

updates = 0;
find = false;

minErrNum = m;
curErrNum = m;


while(!find)

	idx=randperm(m);
	for i=1:m
		i
		x = X(idx(i),:);
		y = Y(idx(i),:);
		if( sign(x*W) != y)
			Wt = W + eta*y*x';

			curErrNum=0;
			for j=1:m
				xt = X(j,:);
				yt = Y(j,:);
				if( sign(xt*Wt) != yt)
					curErrNum++;
				end
			end

			if(curErrNum < minErrNum)
				W = Wt;
				minErrNum = curErrNum
				updates++
				if(updates == maxUps)
					find = true;
					break;	
				end
			end

			break;
		end

		if(i == m)
			find = true;
		end
	end
end

end