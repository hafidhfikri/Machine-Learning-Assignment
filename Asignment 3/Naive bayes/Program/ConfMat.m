function [tp tn fp fn] = ConfMat(nBenar, testLbl, LblPred)
    tp = 0;
    tn = 0;
    fp = 0;
    fn = 0;
    data = nBenar;
    for i = 1:length(LblPred)
        if (testLbl(i,1) == data)
            %true
            if (LblPred(i,1) == data)
                %true positif
                tp = tp+1;
            else
                %false negatif
                fn = fn+1;
            end
        else
            %false
            if (LblPred(i,1) ~= data)
                %true negatif
                tn = tn+1;
            else
                %false positif
                fp = fp+1;
            end
        end
    end
end