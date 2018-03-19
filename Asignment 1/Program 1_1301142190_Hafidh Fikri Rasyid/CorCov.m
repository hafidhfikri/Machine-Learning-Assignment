function nilai = CorCov(movId1, movId2, ratings)
    %baris 1 userid
    %baris 2 judul film
    %baris 3 rating
    
    test1 = find(ratings(:,2) == movId1);
    test2 = find(ratings(:,2) == movId2);

    valMov1 = length(test1);
    valMov2 = length(test2);
    
    valMov1a = length(test1);
    valMov2a = length(test2);
    
    valMov1a = valMov1;

    movIdArr1 = [];
    movIdArr2 = [];

    for i=1:length(test1)
        movIdArr1(i) = ratings(test1(i),3);
    end

    for i=1:length(test2)
        movIdArr2(i) = ratings(test2(i),3);
    end

    %ada missing data problem
    %metode deletion
    tmp = [];
    if valMov1 > valMov2
        for i = 1:valMov2
            tmp(i) = movIdArr1(i);
        end
        movIdArr1 = tmp;
    else
        for i = 1:valMov1
            tmp(i) = movIdArr2(i);
        end
        movIdArr2 = tmp;
    end

%     metode interpolation
%     tmp = [];
%     if valMov1 > valMov2
%         %data dua yg dikit
%         tmp = interp1(1:numel(movIdArr1),movIdArr1,linspace(1,numel(movIdArr1),numel(movIdArr2)));
%         movIdArr1 = tmp;
%     else
%         %data 1 yang dikit
%         tmp = interp1(1:numel(movIdArr2),movIdArr2,linspace(1,numel(movIdArr2),numel(movIdArr1)));
%         movIdArr2 = tmp;
%     end
    
    %cari rata2
    mean1 = mean(movIdArr1);
    mean2 = mean(movIdArr2);
    
    %cari standar deviasi
    std1 = std(movIdArr1);
    std2a = std(movIdArr2);
    
    %hitung cov
    tmpcov = 0;
    for i = 1:length(movIdArr1)
        tmpcov = tmpcov+((movIdArr1(i)-mean1)*(movIdArr2(i)-mean2));
    end

    fincov = tmpcov/(length(movIdArr1)-1);
    
    %DIPAKE BUAT CROSSCHECK JAWABAN
    %fincova = cov(movIdArr1,movIdArr2);
    %nilaibener = corrcoef(movIdArr1,movIdArr2);
    
    if (std1~=0) && (std2a~=0)
        nilai = fincov/(std1*std2a);
        %nilai = nilaibener(1,2);
    else
        nilai = 0;
    end 
    
end