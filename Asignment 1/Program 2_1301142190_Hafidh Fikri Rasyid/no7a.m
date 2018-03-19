clear;
clc;

N = 5000;
[X y] = loadmnist(N);

%biar random tapi gak ngulang
p = randperm(N);

%tampilin
visual(X(p(1:100),:));

%verifikasi
v = [];
for i = 1:10
    for j = 1:10
        v(i,j) = y(p(((i-1)*10)+j));
    end
end

disp('Verifikasi data dengan yang ada di plot ');
disp(v);