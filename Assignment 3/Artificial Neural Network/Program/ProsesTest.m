function [akurasi th] = ProsesTest(P,T,W1,W2,b1,b2)
    jumBener = 0;
    nRow = size(P,1);
    TotEr = [];
    th = [];
    for i = 1:nRow
        %forward
        [A1 A2 E] = ForwardProp(P,T,W1,b1,W2,b2,i);
        TotEr = [TotEr E];
        if (A2<0.1667)
            hasil = 1;
        elseif (A2<0.3334)&(A2>=0.1667)
            hasil = 2;
        elseif (A2<0.5001)&(A2>=0.3334)
            hasil = 3;
        elseif (A2<0.6668)&(A2>=0.5001)
            hasil = 4;
        elseif (A2<0.8335)&(A2>=0.6668)
            hasil = 5;
        elseif (A2<1)&(A2>=0.8335)
            hasil = 6;
        end
        th(i) = hasil;
        if hasil == T(i)
            jumBener = jumBener +1;
        end

    end
    th = th';
    akurasi = (jumBener/nRow)*100;
end