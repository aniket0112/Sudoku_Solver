[column row]=size(mask);
r_round=round((row)/9)-1;
c_round=round((column)/9)-1;
u=1;
for i=0:8
    for j=0:8
        xinit= (i*c_round)+15;    %xcoordinate is constant
        yinit= (j*r_round)+5;
        roi(u,1:4)= [yinit xinit r_round-6 c_round-3];
        u=u+1;
    end
end

