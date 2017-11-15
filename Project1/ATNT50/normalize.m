function data = normalize(d)
  data = (d(2:size(d,1),:)-mean(d(2:size(d,1),:),2))./range(d(2:size(d,1),:),2); 
	end;