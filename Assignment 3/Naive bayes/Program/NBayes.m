clear;
clc;

dataset = csvread('Aggregation.csv');
%scatter(dataset(:,1),dataset(:,2),10,dataset(:,3));

sz = size(dataset);
prior = zeros([1 7]);
prior(1) = HitungPrior(dataset,sz(1),1);
prior(2) = HitungPrior(dataset,sz(1),2);
prior(3) = HitungPrior(dataset,sz(1),3);
prior(4) = HitungPrior(dataset,sz(1),4);
prior(5) = HitungPrior(dataset,sz(1),5);
prior(6) = HitungPrior(dataset,sz(1),6);
prior(7) = HitungPrior(dataset,sz(1),7);

%cari mean di split dulu datanya kalau bisa
data1 = zeros([sum(dataset(:,3)==1) sz(2)]);
data2 = zeros([sum(dataset(:,3)==2) sz(2)]);
data3 = zeros([sum(dataset(:,3)==3) sz(2)]);
data4 = zeros([sum(dataset(:,3)==4) sz(2)]);
data5 = zeros([sum(dataset(:,3)==5) sz(2)]);
data6 = zeros([sum(dataset(:,3)==6) sz(2)]);
data7 = zeros([sum(dataset(:,3)==7) sz(2)]);
i1 = 1;
i2 = 1;
i3 = 1;
i4 = 1;
i5 = 1;
i6 = 1;
i7 = 1;
for i=1:sz(1)
    if(dataset(i,3)==1)
        data1(i1,:) = dataset(i,:);
        i1 = i1+1;
    elseif (dataset(i,3)==2)
        data2(i2,:) = dataset(i,:);
        i2 = i2+1;
    elseif (dataset(i,3)==3)
        data3(i3,:) = dataset(i,:);
        i3 = i3+1;
    elseif (dataset(i,3)==4)
        data4(i4,:) = dataset(i,:);
        i4 = i4+1;
    elseif (dataset(i,3)==5)
        data5(i5,:) = dataset(i,:);
        i5 = i5+1;
    elseif (dataset(i,3)==6)
        data6(i6,:) = dataset(i,:);
        i6 = i6+1;
    elseif (dataset(i,3)==7)    
        data7(i7,:) = dataset(i,:);
        i7 = i7+1;
    end
end

%hitung std dan mean dari masing2 data
%data pada kolom 1
std_mean1 = zeros([7 2]);
%index 1 mean
%index 2 std
std_mean1(1,1) = mean(data1(:,1));
std_mean1(1,2) = std(data1(:,1));

std_mean1(2,1) = mean(data2(:,1));
std_mean1(2,2) = std(data2(:,1));

std_mean1(3,1) = mean(data3(:,1));
std_mean1(3,2) = std(data3(:,1));

std_mean1(4,1) = mean(data4(:,1));
std_mean1(4,2) = std(data4(:,1));

std_mean1(5,1) = mean(data5(:,1));
std_mean1(5,2) = std(data5(:,1));

std_mean1(6,1) = mean(data6(:,1));
std_mean1(6,2) = std(data6(:,1));

std_mean1(7,1) = mean(data7(:,1));
std_mean1(7,2) = std(data7(:,1));

%data pada kolom 2
std_mean2 = zeros([7 2]);
%index 1 mean
%index 2 std
std_mean2(1,1) = mean(data1(:,2));
std_mean2(1,2) = std(data1(:,2));

std_mean2(2,1) = mean(data2(:,2));
std_mean2(2,2) = std(data2(:,2));

std_mean2(3,1) = mean(data3(:,2));
std_mean2(3,2) = std(data3(:,2));

std_mean2(4,1) = mean(data4(:,2));
std_mean2(4,2) = std(data4(:,2));

std_mean2(5,1) = mean(data5(:,2));
std_mean2(5,2) = std(data5(:,2));

std_mean2(6,1) = mean(data6(:,2));
std_mean2(6,2) = std(data6(:,2));

std_mean2(7,1) = mean(data7(:,2));
std_mean2(7,2) = std(data7(:,2));

%training
datatest = dataset;
datatest(:,3) = 0;
for i = 1:sz(1)
    pred_value = 0;
    pred_label = 0;
    for j = 1:7
        d1_like = HitungLikehood(std_mean1(j,1),std_mean1(j,2),dataset(i,1));
        d2_like = HitungLikehood(std_mean2(j,1),std_mean2(j,2),dataset(i,2));
        
        Prost = HitungProst(d1_like,d2_like,prior(j));
        
        if(Prost>pred_value)
            pred_value = Prost;
            pred_label = j;
        end
    end
    
    datatest(i,3) = pred_label;
end

scatter(datatest(:,1),datatest(:,2),10,datatest(:,3));

%bagian analisis
%cari confusion matrix
tblCM = zeros([7 4]);
for i = 1:7
    [tp tn fp fn]  = ConfMat(i,dataset(:,3),datatest(:,3));
    tblCM(i,:) = [tp tn fp fn] ;
end

[F1MicAvg F1MacAvg Accuracy] = F1AndAccFunction(tblCM);

disp(['F1 Micro Average dari dataset diatas adalah ' num2str(F1MicAvg*100) '%']);