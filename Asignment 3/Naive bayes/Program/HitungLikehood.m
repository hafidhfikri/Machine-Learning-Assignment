function likehood = HitungLikehood(meanData,stdData,x)
    likehood = (1/(stdData*sqrt(2*pi)))*exp(-((x-meanData)^2/(2*(stdData)^2)));
end

