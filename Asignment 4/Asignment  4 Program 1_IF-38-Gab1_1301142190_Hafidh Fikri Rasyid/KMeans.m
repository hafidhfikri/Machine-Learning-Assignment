clc;
clear;

dataset = csvread('Aggregation.csv');
blind_dataset = dataset(:, [1 2]);
[x y] = size(dataset);
figure;
scatter(blind_dataset(:,1),blind_dataset(:,2),13,'filled');
title('Grafik Pesebaran Data');

nCluster = 7; %banyak cluster

%generate random centroid from
clusterIndex = randi(x,[1 7]);

%generate koordinat dari dataset
fCentr = zeros([nCluster y-1]);
for i = 1:nCluster
    fCentr(i,:) = blind_dataset(clusterIndex(i),[1 2]);
end

[finalCentr, finalCluster] = CariKMeans(blind_dataset, fCentr);
SSEa = cariSSE(finalCluster,finalCentr);

%visualisasi
figure;
scatter(finalCluster(:,1),finalCluster(:,2),13,finalCluster(:,end),'filled');
title('Grafik Cluster A');

figure;
%scatter(finalCentr(:,1),finalCentr(:,2),13,1:nCluster,'filled');
scatter(finalCentr(:,1),finalCentr(:,2),13,'filled');
title('Grafik Centroid A');

%generate koordinat dari dataset per cluster
fCentrB = zeros([nCluster y-1]);
for i = 1:nCluster
    dt = randi(x);
    while i ~=  dataset(dt,end)
        dt = randi(x);
    end
    fCentrB(i,:) = blind_dataset(dt,[1 2]);
end
fa = fCentrB;
[finalCentrb, finalClusterb] = CariKMeans(blind_dataset, fCentrB);
SSEb = cariSSE(finalClusterb,finalCentrb);

%visualisasi
figure;
scatter(finalClusterb(:,1),finalClusterb(:,2),13,finalClusterb(:,end),'filled');
title('Grafik Cluster B');

figure;
%scatter(finalCentrb(:,1),finalCentrb(:,2),13,1:nCluster,'filled');
scatter(finalCentrb(:,1),finalCentrb(:,2),13,'filled');
title('Grafik Centroid B');