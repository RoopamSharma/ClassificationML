function result = knnclassifier(traindata,testdata,k)
  
  trainX = traindata(2:size(traindata,1),:);
  trainY = traindata(1,:);
  testX = testdata(2:size(testdata,1),:);
  dist = [];  
  for i = 1:size(testX,2)
    dist = [dist;euclid_dist(trainX,testX(:,i))];
  end;
  sortDist = {};
  tmpsortDist = {};
  for i = 1:size(dist,1)
    [~,idx] = sort(dist(i,:));
    tmpsortDist = num2cell(dist(i,:)');
    tmpsortDist = [tmpsortDist,num2cell(trainY')];
    tmpsortDist = tmpsortDist(idx,:);
    sortDist = [sortDist,tmpsortDist];
  end; 
  result = findclass(sortDist,k);
end;