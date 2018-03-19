function [A1 A2 E] = ForwardProp(inpt,out,W1,b1,W2,b2,iterasi)
    %proses hidden layer
    v= W1'*inpt(iterasi,:)'+b1';
    A1 = 1/(1+exp(-v));
    %proses output layer
    v2 = W2'*A1'+b2; 
    A2 = 1/(1+exp(-v2));
    %hitung error
    E = out(iterasi)-A2;
end