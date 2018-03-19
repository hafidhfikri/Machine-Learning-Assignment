function nilai = JaccardCoef(movId1, movId2, ratings)
    %baris 1 userid
    %baris 2 judul film
    %baris 3 rating
    
    test1 = find(ratings(:,2) == movId1);
    test2 = find(ratings(:,2) == movId2);
    
    valMov1 = length(test1);
    valMov2 = length(test2);
    
    %proses
    userid1 = [];
    for i = 1:length(test1)
        userid1(i) = ratings(test1(i),1);
    end

    userid2 = [];
    for i = 1:length(test2)
        userid2(i) = ratings(test2(i),1);
    end
    
    arrayPilihDua = intersect(userid1,userid2);
    pilihdua = length(arrayPilihDua);
    
    %intersect masing-masing kelompok
    E = intersect(arrayPilihDua,userid1);
    F = intersect(arrayPilihDua,userid2);
    
    a = (valMov1 - length(E));
    b = (valMov2 - length(F));
    
    nilai = pilihdua/(a+b+pilihdua);
end