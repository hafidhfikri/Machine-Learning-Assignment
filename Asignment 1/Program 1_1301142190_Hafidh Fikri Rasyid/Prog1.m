clc;
clear;

%load data
[ratings items userids itemids] = loadmovielens();

disp(' ');
disp('Soal A');

nilai1 = JaccardCoef(1,2,ratings);   
disp(' ');
disp(['Nilai Koefisien Jaccard antara film Toy Story dan GoldenEye adalah '  num2str(nilai1)]);

%three color : red dan three color : blue di index ke 59 dan 60
nilai2 = JaccardCoef(59,60,ratings);   
disp(' ');
disp(['Nilai Koefisien Jaccard antara film Three Color : Red dan Three Color : Blue adalah '  num2str(nilai2)]);

%taxi driver di index ke-23
listfilm = {};
for i = 1:length(items)
    if i ~=23
        listfilm{i,1} = items(i);
        listfilm{i,2} = JaccardCoef(23,i,ratings);
    else
        listfilm{i,1} = 0;
        listfilm{i,2} = 0;
    end
end

hasil3 = sortrows(listfilm,2);

disp(' ');
disp('yang memiliki bobot jaccard terbesar dari film Taxi Driver adalah : ');
for i = length(hasil3):-1:(length(hasil3)-4)
    disp([char(hasil3{i,1}) ' dengan bobot ' num2str(hasil3{i,2})]);
end

%film die hard : with a vengeance di index ke-550
listfilm = {};
for i = 1:length(items)
    if i ~=550
        listfilm{i,1} = items(i);
        listfilm{i,2} = JaccardCoef(550,i,ratings);
    else
        listfilm{i,1} = 0;
        listfilm{i,2} = 0;
    end
end

hasil4 = sortrows(listfilm,2);

disp(' ');
disp('yang memiliki bobot jaccard terbesar dari film Die Hard : With A Vengeance adalah : ');
for i = length(hasil4):-1:(length(hasil4)-4)
    disp([char(hasil4{i,1}) ' dengan bobot ' num2str(hasil4{i,2})]);
end

% % %%%SOAL B %%%
disp(' ');
disp('Soal B');
nilai1b = CorCov(1,2,ratings);   

disp(' ');
disp(['Nilai Correlation antara film Toy Story dan GoldenEye adalah ' num2str(nilai1b)]);

%three color : red dan three color : blue di index ke 59 dan 60
nilai2b = CorCov(59,60,ratings);   
disp(' ');
disp(['Nilai Correlation antara film Three Color : Red dan Three Color : Blue adalah '  num2str(nilai2b)]);

%taxi driver di index ke-23
listfilm = {};
for i = 1:length(items)
    if i ~=23
        listfilm{i,1} = items(i);
        listfilm{i,2} = CorCov(23,i,ratings);
    else
        listfilm{i,1} = 0;
        listfilm{i,2} = 0;
    end
end

hasil3 = sortrows(listfilm,2);

disp(' ');
disp('yang memiliki bobot Correlation terbesar dari film Taxi Driver adalah : ');
for i = length(hasil3):-1:(length(hasil3)-4)
    disp([char(hasil3{i,1}) ' dengan bobot ' num2str(hasil3{i,2})]);
end

%film die hard : with a vengeance di index ke-550
listfilm = {};
for i = 1:length(items)
    if i ~=550
        listfilm{i,1} = items(i);
        listfilm{i,2} = CorCov(550,i,ratings);
    else
        listfilm{i,1} = 0;
        listfilm{i,2} = 0;
    end
end

hasil4 = sortrows(listfilm,2);

disp(' ');
disp('yang memiliki bobot correlation terbesar dari film Die Hard : With A Vengeance adalah : ');
for i = length(hasil4):-1:(length(hasil4)-4)
    disp([char(hasil4{i,1}) ' dengan bobot ' num2str(hasil4{i,2})]);
end

disp(' ');
disp(' ');
input('Press Any Key To Continue....');