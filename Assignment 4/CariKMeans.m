function [finalCentr, finalCluster] = CariKMeans(dataK, initCent)
jalan = true;
fCentr = initCent;
[x y] = size(dataK);
[nCluster yCluster] = size(initCent);
while jalan
    %DARI SINI
    tempArr = [];
    for i = 1:x
        %ambil datanya
        data = dataK(i,:);
        in = 3;%index awal untuk isi distance
        tempArr(i,[1 2]) = data;
        for j = 1:nCluster
            eucDist = sqrt(((data(1)-fCentr(j,1))^2)+((data(2)-fCentr(j,2))^2));
            tempArr(i,in) = eucDist;
            in = in+1;
        end
    end

    %pelabelan
    for i = 1:x
        data = tempArr(i,:);
        %get data pertama
        dp = data(3);
        ind = 1;
        for j = 1:(nCluster-1)
            if(dp>data(3+j))
                dp = data(3+j);
                ind = j+1;
            end
        end
        tempArr(i,nCluster+3) = ind;    
    end

    %ambil rata2 untuk centroid baru
    cntrdBaru = [];
    for i = 1:nCluster
        pnjmlh = [];
        in = 0;
        for j = 1:x
            if tempArr(j,end) == i
                in = in+1;
                pnjmlh(in,:) = tempArr(j,1:2);
            end
        end
        %hitung rata2
        rt2 = sum(pnjmlh);
        cntrdBaru(i,1) = rt2(1)/in;
        cntrdBaru(i,2) = rt2(2)/in;
    end

    % cek kemiripan
    if isequal(cntrdBaru,fCentr)
        jalan = false;
    end
    
    fCentr = cntrdBaru;
end
finalCentr = fCentr;
finalCluster = tempArr;
end