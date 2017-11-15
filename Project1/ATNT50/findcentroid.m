function [centroid,res] = findcentroid(trainX,trainY)
    i = 1;
    r =[];
    res = [];
    centroid = [];
    while (i<size(trainY,2))
      c = 1;
      j = i;
      res = [res,(trainY(1,j))];
      %disp(i);
      while(j<size(trainY,2)&&trainY(1,j)== trainY(1,j+1))
        c++;
        j++;
      end;
      %disp(c);
      
      r = sum(trainX(:,i:j),2)/c;
      i = j;
      %disp(i);
      i++;
      centroid = [centroid,r];  
    end;
      
end;