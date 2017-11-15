function r = findclass(sortDist,k)
  i = 2;
  r = [];
  while i<=size(sortDist,2)
    y = [];
    list = [];
    t = cell2mat(sortDist(1:k,i));
    y = [y,t,zeros(size(t,1),1)];
    for j = 1:size(t,1)
      in = find(t==t(j));
      if(size(in,1)>=y(j,2)) 
        list = [list;(t(j)),size(in,1)];
      end;
    end;
    %disp(list);
    [~,id] = max(list(:,2));
    %disp(max(list(:,2)));
    r = [r,list(id,1)];
    i = i+2;
  end;
end;