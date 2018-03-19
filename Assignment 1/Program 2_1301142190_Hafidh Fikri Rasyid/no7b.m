clear;
clc;

N = 5000;
[X y] = loadmnist(N);

%biar random tapi gak ngulang
p = randperm(N);

%ambil index random
training_set = p(1:2500);
test_set = p(2501:5000);

disp('Proses pemisahan data...');

%konversi ke label dan isi
%train
trainLbl = [];
trainGmbr = [];
for i = 1:length(training_set)
    trainLbl(i,1) = y(training_set(i));
    trainGmbr(i,:) = X(training_set(i),:);
end

%test
testLbl = [];
testGmbr = [];
for i = 1:length(test_set)
    testLbl(i,1) = y(test_set(i));
    testGmbr(i,:) = X(test_set(i),:);
end

%misahin data training
kls0G = [];
kls1G = [];
kls2G = [];
kls3G = [];
kls4G = [];
kls5G = [];
kls6G = [];
kls7G = [];
kls8G = [];
kls9G = [];
i1 = 1;
i2 = 1;
i3 = 1;
i4 = 1;
i5 = 1;
i6 = 1;
i7 = 1;
i8 = 1;
i9 = 1;
i0 = 1;
for i = 1:length(trainLbl)
    if trainLbl(i,1) == 0
        kls0G(i0,:) = trainGmbr(i,:);
        i0 = i0+1;
    elseif trainLbl(i,1) == 1
        kls1G(i1,:) = trainGmbr(i,:);
        i1 = i1+1;
    elseif trainLbl(i,1) == 2
        kls2G(i2,:) = trainGmbr(i,:);
        i2 = i2+1;
    elseif trainLbl(i,1) == 3
        kls3G(i3,:) = trainGmbr(i,:);
        i3 = i3+1;
    elseif trainLbl(i,1) == 4
        kls4G(i4,:) = trainGmbr(i,:);
        i4 = i4+1;
    elseif trainLbl(i,1) == 5
        kls5G(i5,:) = trainGmbr(i,:);
        i5 = i5+1;
    elseif trainLbl(i,1) == 6
        kls6G(i6,:) = trainGmbr(i,:);
        i6 = i6+1;
    elseif trainLbl(i,1) == 7
        kls7G(i7,:) = trainGmbr(i,:);
        i7 = i7+1;
    elseif trainLbl(i,1) == 8
        kls8G(i8,:) = trainGmbr(i,:);
        i8 = i8+1;
    elseif trainLbl(i,1) == 9
        kls9G(i9,:) = trainGmbr(i,:);
        i9 = i9+1;
    end
end

arrMean = [];
arrMean(1,:) = mean(kls0G);
arrMean(2,:) = mean(kls1G);
arrMean(3,:) = mean(kls2G);
arrMean(4,:) = mean(kls3G);
arrMean(5,:) = mean(kls4G);
arrMean(6,:) = mean(kls5G);
arrMean(7,:) = mean(kls6G);
arrMean(8,:) = mean(kls7G);
arrMean(9,:) = mean(kls8G);
arrMean(10,:) = mean(kls9G);

%tampilin hasil dari rata2
visual(arrMean(1:10,:));