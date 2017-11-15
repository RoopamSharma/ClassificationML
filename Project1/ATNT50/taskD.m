function taskD()
	
	classes = [11:20];
	tr = [5,10,15,20,25,30,35];
	te = [34,29,24,19,14,9,4];
	acc = [];
	for i = 1:7
		[trainX,trainY,testX,testY] = pickData('../Handwrittenletters.txt',classes,tr(i),te(i));
		trainData = [trainY;trainX];
		testData = [testY;testX];
		result = centroidclassifier(trainData,testData);
		count = size(testY,2);
  	%plotData(testY,result,'Centroid Method Classification');
  	c = 0;
  	printf('\n');
  	printf(' Centroid Method Classification------------TrainData:%d,TestData:%d-------------------\n\n',tr(i),te(i));
  	for i =1:count
	 		if result(1,i)==testY(1,i)
	  	 c++;
	 		end;  
	 	%printf(' Predicted Value:%d Actual Value:%d \n',result(1,i),testY(1,i));
  	end;
  	accuracy = c/count*100;
  	printf(' Accuracy: %d%%\n',accuracy);
  	printf('\n');
		acc = [acc,accuracy];
		printf('Press any key to continue.......\n');
		pause;

  end;
	plot([1:7],acc);
	end;