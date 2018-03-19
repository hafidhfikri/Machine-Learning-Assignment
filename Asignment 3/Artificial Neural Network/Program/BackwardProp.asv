function [dW1 dW2 db1 db2] = BackwardProp(A1,A2,E,lr,inp,W2,iterasi)
    %dimulai dari output ke hidden
    D2 = A2*(1-A2)*E;
    dW2 = lr*D2*A1;
    db2 = lr*D2;
    
    %hidden ke input
    D1 = A1*(1-A1)'*(W2*D2);
    dW1 = lr*D1*inp(iterasi,:);
    db1 = lr*D1;
end