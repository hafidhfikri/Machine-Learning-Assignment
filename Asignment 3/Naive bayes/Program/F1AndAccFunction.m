function [F1MicAvg F1MacAvg Accuracy] = F1AndAccFunction(cm1)
    %index pada kolom
    %indeks 1 = tp
    %indeks 2 = tn
    %indeks 3 = fp
    %indeks 4 = fn
    [x y] = size(cm1);
    
    %precission & recall cm1
    pre_rec = zeros([x 2]);
    for i=1:x
        pre_rec(i,1) = cm1(i,1)/(cm1(i,1)+cm1(i,3));
        pre_rec(i,2) = cm1(i,1)/(cm1(i,1)+cm1(i,4));
    end
    
    jmlCM = sum(cm1);
    jmlPreRec = sum(pre_rec);
    
    %F1 Micro Average
    %Mic precission
    Mip = jmlCM(1)/(jmlCM(1)+jmlCM(3));
    %Mic recall
    Mir = jmlCM(1)/(jmlCM(1)+jmlCM(4));
    %F1 Micro Average Score
    F1MicAvg = (2*Mip*Mir)/(Mip+Mir);
    
    %F1 Macro Average
    %Mac precission
    Map = pre_rec(1)/x;
    %Mac recall
    Mar = pre_rec(2)/x;
    %F1 Macro Average Score
    F1MacAvg = (2*Map*Mar)/(Map+Mar);
    
    %akurasi
    Accuracy = (jmlCM(1)+jmlCM(2))/(jmlCM(1)+jmlCM(2)+jmlCM(3)+jmlCM(4));
end