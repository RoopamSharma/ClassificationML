function trainData = modifyData(trainData,k)
    ex = size(trainData,2);
    v = (k-1)/k;
    classes = size(unique(trainData(1,:)),2);
    each = floor(ex/classes);
    c = floor(v*each);
    i = 1;
    while i <=size(trainData,2)
     data = trainData(:,i+c:i+each-1);
     trainData(:,i:i+each-1) = [data,trainData(:,i:(i+c-1))];   
     i = i + each;
    end;
  end;