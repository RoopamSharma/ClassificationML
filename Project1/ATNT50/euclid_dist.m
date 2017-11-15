function d = euclid_dist(instance1,instance2) 
      d = sum((instance1 - instance2).^2).^.5; 
  end