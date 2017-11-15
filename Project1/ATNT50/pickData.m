function[trainX,trainY,testX,testY] = pickData(fname,classes,trSize,teSize)
	trainData = [];
	testData = [];	
	data = load(fname);
	for i = 1:range(classes)+1
		labels = find(classes(i)==data(1,:));
		trainData = [trainData,data(:,labels(1):labels(trSize))];
		testData = [testData,data(:,labels(trSize+1):labels(trSize+teSize))];
	end;
	
	trainX = trainData(2:end,:);
	trainY = trainData(1,:);
	testX = testData(2:end,:);
	testY = testData(1,:);
	%saveData(trainData,testData);
end;