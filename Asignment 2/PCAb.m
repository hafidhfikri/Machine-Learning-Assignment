clear;
clc;

N = 5000;
[X y] = loadmnist(N);

%load first 1000
gbr = X(1:1000,:);
lbl = y(1:1000);

%tampilin
% visual(X(1:100,:));

%verifikasi
vi = [];
for i = 1:10
    for j = 1:10
        vi(i,j) = y(((i-1)*10)+j);
    end
end

disp('Verifikasi data dengan yang ada di plot ');
disp(vi);

%transpose data object(i)
B = transpose(gbr);

%Subtract the means of data thus the data now is zero-centered.(ii)
[m n] = size(B);
% mG = mean(B);
% arrSubsTrG = bsxfun(@min,B,mean(B));

%Compute covariance matrix C of the zero-centered data (iii)
% fl = arrSubsTrG';
% C = (arrSubsTrG * fl)/(n-1);
C = cov(gbr);

%Compute the eigenvectors vi and eigenvalues i of covariance matrix C(iv)
[v L] = eig(C);

%Sort descending the eigenvalues, and re-order the eigenvectors correspond
%to the order of eigen values.(v)
aSort = zeros([m 2]);
for i = 1:m
    aSort(i,1) = i;
    aSort(i,2) = L(i,i);
end

%bubblesort
mn = m;
while(mn>0)
    mnew = 0;
    for i = 2:mn
        if(aSort(i,2)<aSort(i-1,2))
            val = aSort(i,:);
            aSort(i,:) = aSort(i-1,:);
            aSort(i-1,:) = val;
            mnew = i;
        end
    end
    mn = mnew;
end

%seleksi yang terbaik sebanyak 64 buah
slksi = zeros([64 2]);
for i = 0:63
    slksi(i+1,:) = aSort(m-i,:);
end

%pindahin 
slksiEig = zeros([784 64]);
for i = 1:64
    slksiEig(:,i) = v(:,slksi(i,1));
end

%Visualize the 64 first principal components (these are 64 eigen vectors correspond to the
% 64 first eigen values) using provided visual function. (vi)
visual(slksiEig');

%Project the data into eigen subspaces (PCA domain) using 64 first principal components.
% Y = fl*(slksiEig');
Y = slksiEig'*B;

%What is the dimension of each data object in PCA domain now?
%ans : 64x1000

% Reconstruct data from PCA domain (obtained from step vii) into native domain. Visualize
% 100 first reconstructed data and compare them to 100 first original data that are already
% visualized in (a). Give your opinion.
Bc = slksiEig * Y;
Bct = Bc';
visual(Bct(1:100,:));

%What is the percentage of correct reconstruction obtained from (c)?
%rumus sum of 64 terbaik dibagi sum of semua nilai dari vector eigen
a1 = sum(slksi);
a2 = sum(aSort);

presentase = (a1(2)/a2(2))*100;

disp(['Presentase dari correct reconstruction adalah ' num2str(presentase) '%']);