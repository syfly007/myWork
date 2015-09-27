function [W, updates] = pla(data,eta)

[m,n] = size(data);

X = data(:,1:(n-1));
Y = data(:,n);

X = [ones(m, 1) X];
W = zeros(n,1);

updates = 0;
find = false;

i=1;
k=1;
while(!find)
	x = X(i,:);
	y = Y(i,:);
	if( sign(x*W) != y)
		W = W + eta*y*x';
		updates++;	
		k=1;
	else
		k++;
	end
	if(k == m)
		find = true;
	end

	i = mod(i,400)+1;
end

end