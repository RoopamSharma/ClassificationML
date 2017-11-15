function plotData(y1,y2,t)
  figure;
  x = linspace(1,10,size(y1,2));
  sz = 25;
  c = linspace(1,10,size(y2,2));
  scatter(x,y1,sz,'+');
  hold;
  scatter(x,y2,sz);
  legend('Expected','Predicted');
  title(t);  
  end;