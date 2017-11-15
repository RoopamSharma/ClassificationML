function[acc] =  CrossValidate(data1,kfold,type)
	  
		if strfind(type,'knn')>0
		k =5;
	 	accuracy = [];
		data = data1;
		l = 1;
		s =  ceil(size(data,2)/kfold);
		q = 1;
		while l<=size(data,2)
	  	%disp(data(1:5,:));
	  	[trainData1,testData1] = partitionData(data,0.8);
	  	result = knnclassifier(trainData1,testData1,k);
	  	%disp(result);
	  	testY1 = testData1(1,:);
	  	count = size(testY1,2);
	  	% plotData(testY,result,'KNN Classification');
	  	c = 0;
	  	printf('\n');
	  	printf(' %d-NN Classification Cross-Validation %d -------------------------------\n\n',k,q);
	  	for i =1:count
				if result(1,i)==testY1(1,i)
			  	c++;
				endif;  
	  	%  printf(' Predicted Value:%d Actual Value:%d \n',result(1,i),testY(1,i));
	  	endfor;
	  	t = c/count*100;
			printf(' Accuracy: %d%%\n',t);
	  	accuracy = [accuracy,t];
	  	l = l+s;
	  	q++;
	  	data = modifyData(data,kfold);
		endwhile;
		%printf(' Accuracy: %d%%\n',accuracy);
		printf('\n');
		printf(' Press any key to continue..............\n\n');
		%pause;
		printf('Average accuracy for %d-fold validation:%d',kfold,mean(accuracy));
	  acc = mean(accuracy);
		end;
	 
	if strfind(type,'cent')>0 
	accuracy = [];
	data = data1;
	l = 1;
	s =  ceil(size(data,2)/kfold);
	q = 1;
	while l<=size(data,2)
	  [trainData1,testData1] = partitionData(data,0.8);
	  result = centroidclassifier(trainData1,testData1);
	  testY1 = testData1(1,:);      
	  count = size(testY1,2);
	  %plotData(testY1,result,'Centroid Method Classification');
	  c = 0;
	  printf('\n');
	  printf(' Centroid Method Classification-------------------------------%d\n\n',q);
	  for i =1:count
			if result(1,i)==testY1(1,i)
				c++;
			end;  
		%	printf(' Predicted Value:%d Actual Value:%d \n',result(1,i),testY1(1,i));
	  end;
		t = c/count*100;
		printf(' Accuracy: %d%%\n',t);
		accuracy = [accuracy,t];
		l = l+s;
		q++;
		data = modifyData(data,kfold);
  endwhile;
	%printf(' Accuracy: %d%%\n',accuracy);
	printf('\n');
	printf(' Press any key to continue..............\n\n');
	printf('Average accuracy for %d-fold validation:%d',kfold,mean(accuracy));
	acc = mean(accuracy);
	%pause;
	end;
	
	%{
	if strfind(type,'linear')>0  
	accuracy = [];
	data = data1;
	l = 1;
	s =  ceil(size(data,2)/kfold);
	q = 1;
	while l<size(data,2)
		[trainData,testData] = partitionData(data,0.8);
	  [~,id] = unique(trainData(1,:));
	classes = trainData(1,:)(sort(id));
  v = ones(1,size(classes,2));
  s = diag(v);
  X = trainData(2:size(trainData,1),:);
  testY = testData(1,:);
  
  %disp(size(X));
  Y =[];
	c = 1;
	
	
  for j = 1:size(classes,2) 	
		k = find(trainData(1,:)==classes(j)); 
		for i = min(k):max(k)
			Y = [Y,s(:,c)];	
		end	
		c++;		
	end;
  %disp(size(Y));
	minBeta = linearclassifier(X,Y); 
  y = minBeta'*testData(2:size(testData,1),:);
  %gives class number
  
  [~,ind] = max(y);
  count = size(testY,2);
  %plotData(testY,ind,'Linear Regression Classification');
  c = 0;
  printf('\n');
  printf(' Linear Regression Classification-------------------------------\n\n');
  
	res =[];
	c = 0;
	for i =1:size(ind,2)
			res(1,i) = classes(ind(1,i));
	end
	
	for i =1:count
	 if res(1,i)==testY(1,i)
	   c++;
	 end;  
	 %printf(' Predicted Value:%c Actual Value:%c \n',res(1,i)+96,testY(1,i)+96);
  end;
  t = c/count*100;
 	accuracy = [accuracy,t];
	l = l+s;
	q++;
	data = modifyData(data,kfold);
  end;
	printf(' Accuracy: %d%%\n',accuracy);
	printf('\n');
	printf(' Press any key to continue..............\n\n');
	printf('Average accuracy for %d-fold validation:%d',kfold,mean(accuracy));
	%pause; 
end;
%}

if strfind(type,'svm')>0
		acc = [];
		data = data1;
		l = 1;
		s =  ceil(size(data,2)/kfold);
		q = 1;
		while l<=size(data,2)
	  	[trainData1,testData1] = partitionData(data,0.8);
	  	model = svmtrain(trainData1(1,:)',trainData1(2:size(trainData1,1),:)','');		
	  	testY1 = testData1(1,:);      
  		[predict_label, accuracy, prob_estimates] = svmpredict(testY1',testData1(2:size(testData1,1),:)', model, '');
   		acc = [acc,accuracy(1,1)];
			l = l+s;
	 		data = modifyData(data,kfold);
  	end;
		printf('   All accuracies:\n');
		disp(acc);
		acc = mean(acc);
		printf('Average accuracy for %d-fold validation:%d',kfold,acc);
	end;
	 
end;