function B = linearclassifier(X,Y)
  B = pinv(X*X')*X*Y';
  end;