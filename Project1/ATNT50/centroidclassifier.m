function result = centroidclassifier(trainData,testData)
  result = [];  
  trainX = trainData(2:size(trainData,1),:);
  trainY = trainData(1,:);
  testX = testData(2:size(testData,1),:);
  [centroidX,r] = findcentroid(trainX,trainY);
  %disp(centroidX);
	dist = [];
  for i = 1:size(testX,2)
    dist = [dist;euclid_dist(centroidX,testX(:,i))];
  end;
  r = [r;dist];
	%disp(dist);
  [val,ind] = min(dist');
  result = r(1,ind);
end;