function[traindata,testdata] = test(data,name,c,d)
	n = size(data,1);
	a = lower(name(1))-96;
	b = lower(name(end))-96;
	a = a*(c+d)-(c+d-1);
	b = b*(c+d)-(c+d-1);
	traindata = [data(:,a:a+c-1),data(:,b:b+c-1)];
	testdata = [data(:,a+c:a+c+d-1),data(:,b+c:b+c+d-1)];
end;
