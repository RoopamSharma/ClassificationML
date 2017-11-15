function [train,test]= partitionData(data,v)
  ex = size(data,2);
  classes = size(unique(data(1,:)),2);
  each = floor(ex/classes);
  train = [];
  test = [];
  c = floor(v*each);
  train = [];
  test = [];
  i = 1;
  while i<=ex
    train = [train,data(:,i:(i+c-1))];
    test = [test,data(:,i+c:i+each-1)];
    i = i+each;
  end;