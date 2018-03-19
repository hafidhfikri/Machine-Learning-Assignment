function prior = HitungPrior(data,n,lbl)
    prior = sum(data(:,3)==lbl)/n;
end
