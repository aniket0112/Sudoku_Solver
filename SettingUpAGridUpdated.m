[column row]=size(mask);
r_round=floor((row)/9);
c_round=floor((column)/9);
u=1;
for i=0:8
    for j=0:8
        if i~=0
        xinit= (i*c_round);    %xcoordinate is constant
        else
            xinit=11;
        end
        if j~=0
            yinit= (j*r_round);
        else
            yinit=11;
        end
        roi(u,1:4)= [yinit xinit r_round c_round];
        u=u+1;
    end
end

