function [W, updates] = pla(data,eta)

[m,n] = size(data);

X = data(:,1:(n-1));
Y = data(:,n);

X = [ones(m, 1) X];
W = zeros(n,1);

updates = 0;
find = false;

while(!find)
	for i=1:m
		x = X(i,:);
		y = Y(i,:);
		if( sign(x*W) != y)
			W = W + eta*y*x';
			updates++;
			break;	
		end
		if(i == m)
			find = true;
		end
	end
end

end