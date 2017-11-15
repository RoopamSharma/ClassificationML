function[traindata,testdata] = test1(data1)
	n = size(data1,1);
	traindata = [data1(:,703:732),data1(:,1:30)];
	testdata = [data1(:,733:741),data1(:,31:39)];
end;
