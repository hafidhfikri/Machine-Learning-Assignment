function SSE = cariSSE(dataC, finalCentr)
[x1 y1] = size(dataC);
[x2 y2] = size(finalCentr);

totSSE = 0;
for i = 1:x2
    cx = finalCentr(i,:);
    for j = 1:x1
        if dataC(j,end) == i
            hitungNorm = sqrt(((dataC(j,1)-cx(1))^2)+((dataC(j,2)-cx(2))^2));
            totSSE = totSSE + hitungNorm;
        end
    end
end
SSE = totSSE;
end