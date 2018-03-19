function [W1 b1 W2 b2 TotMSE] = ProsesLatih(P,T,lr,in,hidden,out,epoch)
    W1 = rand(in,hidden);
    b1 = rand(1,hidden);
    W2 = rand(hidden,out);
    b2 = rand(1,out)
    nRow = size(P,1);
    TotMSE = [];
    MaxMSE = 10^-5;
    MSE = MaxMSE+1;
    ee = 1;
    %for j=1:epoch
    while (ee <= epoch) & (MSE>MaxMSE)
        TotEr = [];
        for i = 1:nRow
            [A1 A2 E] = ForwardProp(P,T,W1,b1,W2,b2,i);
            TotEr = [TotEr E];

            [dW1 dW2 db1 db2] = BackwardProp(A1,A2,E,lr,P,W2,i);

            %perbaikan bobot
            W1 = W1+dW1';
            W2 = W2+dW2';

            %perbaikan bias
            b1 = b1+db1';
            b2 = b2+db2';
        end
        MSE = mean(TotEr.^2);
        TotMSE = [TotMSE MSE];
        ee = ee + 1;
    end

%plot(TotMSE)
end
