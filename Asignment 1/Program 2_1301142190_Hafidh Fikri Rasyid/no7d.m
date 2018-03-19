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

LblPredD = [];
for i = 1:length(testLbl)
    disp(['Data ke-' num2str(i)]);
    tmpDat = testGmbr(i,:);
    lblBagus = 1;
    lblBagusTmp = -1;
    for j = 1:length(trainLbl)
        %hitung euclidean distance
        tmp = 0;
        armin = trainGmbr(j,:);
        for k = 1:length(armin)
            tmp = tmp + ((tmpDat(k)-armin(k))^2);
        end
        
        if (lblBagusTmp > tmp) || (lblBagusTmp == -1)
            %dia lebih pendek
            lblBagus = trainLbl(j);
            lblBagusTmp = tmp;
        end
    end
    %masukin ke array yang baru
    LblPredD(i,1) = lblBagus;
end

%bikin confusion matrix
disp('Soal D');
for i = 1:10
    disp(['Confusion Matrix pada kelas ' num2str(i-1)]);
    [tp tn fp fn] = ConfMat(i-1,testLbl,LblPredD);
    disp(['Nilai True Positive = ' num2str(tp)]);
    disp(['Nilai True Negative = ' num2str(tn)]);
    disp(['Nilai False Positive = ' num2str(fp)]);
    disp(['Nilai False Negative = ' num2str(fn)]);
    akurasi = (tp+tn)/length(LblPredD);
    error_rate = (fp+fn)/length(LblPredD);
%     tp_rate = tp/(fn+tp);
%     fp_rate = fp/(tn+fp);
%     specificity = tn/(tn+fp);
%     precision = tp/(fp+tp);
%     prevalence = (fn+tp)/length(LblPredD);
    disp(['Nilai Akurasi= ' num2str(akurasi)]);
    disp(['Nilai Error Rate = ' num2str(error_rate)]);
    disp(' ');
end
disp('Selesai')
input('Press any key to continue...');