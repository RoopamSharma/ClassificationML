function main(type)
	addpath('../matlab');
  %Sample example
  %trainData = load('trainDataXY.txt');
  %testData = load('testDataXY.txt');
  
  %ATNT Photo DataSet
	%data1 = load('../ATNTFaceImages400.txt');
  %[trainData,testData] = partitionData(data1,0.8);
  
  %Hand written letters Dataset
  data1 = load('../HandWrittenLetters.txt');
  %Case1
	%[trainData,testData] = test(data1,name,30,9);
	
	[trainData,testData] = partitionData(data1,0.8);
  %{
	disp('TrainData:');disp('');
	disp('ClassLabels:');
	printf('%d ',trainData(1,:));disp('');
	disp('trainX:');
	disp(trainData(2:end,:));disp('');
	disp('TestData:');disp('');
	disp('ClassLabels:');
	printf('%d ',testData(1,:));
	disp('');
	disp('testX:');
	disp(testData(2:end,:));
	%}
	testY = testData(1,:);
  
  % Part-1 --------------KNN Classification---------------------------------------------
	if strfind(type,'knn')>0||strfind(type,'all')>0
	k =5;
	
  result = knnclassifier(trainData,testData,k);
  count = size(testY,2);
	%disp(result);
	%disp(testY);
  %plotData(testY,result,'KNN Classification');
  c = 0;
  printf('\n');
  printf(' KNN Classification with k:%d -------------------------------\n\n',k);
  for i =1:count
	 if result(1,i)==testY(1,i)
	   c++;
	 end;  
	 %printf(' Predicted Value:%d Actual Value:%d \n',result(1,i),testY(1,i));
  end;
  accuracy = c/count*100;
  printf(' Accuracy: %d%%\n',accuracy);
  printf('\n');
  Kacc = [];
	acc = CrossValidate(data1,2,'knn');
	Kacc = [Kacc,acc];
	acc = CrossValidate(data1,3,'knn');
	Kacc = [Kacc,acc];
	acc = CrossValidate(data1,5,'knn');
	Kacc = [Kacc,acc];
	acc = CrossValidate(data1,10,'knn');
	Kacc = [Kacc,acc];
	scatter(Kacc,[1,2,3,4]);
	hold;
	printf(' Press any key to continue..............\n\n');
  %pause;
	end;
  % Part-2 --------------Centroid Method Classification---------------------------------
  
 if strfind(type,'cent')>0||strfind(type,'all')>0
  
  result = centroidclassifier(trainData,testData);
	count = size(testY,2);
  %plotData(testY,result,'Centroid Method Classification');
  c = 0;
  printf('\n');
  printf(' Centroid Method Classification-------------------------------\n\n');
  for i =1:count
	 if result(1,i)==testY(1,i)
	   c++;
	 end;  
	 %printf(' Predicted Value:%d Actual Value:%d \n',result(1,i),testY(1,i));
  end;
  accuracy = c/count*100;
  printf(' Accuracy: %d%%\n',accuracy);
  printf('\n');
  Cacc = [];
	acc = CrossValidate(data1,2,'cent');
	Cacc = [Cacc,acc];
	acc = CrossValidate(data1,3,'cent');
	Cacc = [Cacc,acc];
	acc = CrossValidate(data1,5,'cent');
	Cacc = [Cacc,acc];
	acc = CrossValidate(data1,10,'cent');
	Cacc = [Cacc,acc];
	scatter(Cacc,[1,2,3,4]);
	printf(' Press any key to continue..............\n');
  %pause;
	
 end;
  
  % Part-3 --------------Linear Regression Classification--------------------------------
if strfind(type,'linear')>0||strfind(type,'allll')>0
  
	[~,id] = unique(trainData(1,:));
	classes = trainData(1,:)(sort(id));
  v = ones(1,size(classes,2));
  s = diag(v);
  X = trainData(2:size(trainData,1),:);
  
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
  accuracy = c/count*100;
  printf(' Accuracy: %d%%\n',accuracy);
  printf('\n');
  [Lacc] = CrossValidate(data1,5,'linear');
	scatter(Lacc,[1,2,3,4]);
	printf(' Press any key to continue..............\n');
  %pause;
	
	end;
  
  % Part-4 --------------SVM Classification-----------------------------------------------
if strfind(type,'svm')>0||strfind(type,'all')>0
   
	 %trainData(2:size(trainData,1),:) = normalize(trainData);
	 %testData(2:size(testData,1),:) = normalize(testData);
	 
	 model = svmtrain(trainData(1,:)',trainData(2:size(trainData,1),:)','');
  %disp(model);
	[predict_label, accuracy, prob_estimates] = svmpredict(testY',testData(2:size(testData,1),:)', model, '');
	for i = 1:size(predict_label,1)
		%printf(' Predicted Value:%c Actual Value:%c \n',predict_label(i,1)+96,testY(1,i)+96);
	end;
	Sacc = [];
	acc = CrossValidate(data1,2,'svm');
	Sacc = [Sacc,acc];
	acc = CrossValidate(data1,3,'svm');
	Sacc = [Sacc,acc];
	acc = CrossValidate(data1,5,'svm');
	Sacc = [Sacc,acc];
	acc = CrossValidate(data1,10,'svm');
	Sacc = [Sacc,acc];
	scatter(Sacc,[1,2,3,4]);
	legend('KNN','Centroid','SVM');
	title('Accuracies')
end;
