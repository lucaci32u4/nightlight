function [ arr ] = compute(amount) 
  gamma = 2.31;
  arr = zeros(amount, 1); 
  for i = 1 : amount
    arr(i) = i .^ gamma;
  endfor
  
  arr = floor(arr / (max(arr) / amount));
endfunction
