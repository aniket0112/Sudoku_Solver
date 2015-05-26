[row column]=size(out);
r_round=round((row)/9);
c_round=round((column)/9);
u=1;
for i=0:8
    for j=0:8
        xinit= i*c_round+20;    %xcoordinate is constant
        yinit= j*r_round+35;
        roi(u,1:4)=[xinit yinit 125 125];
        u=u+1;
    end
end

