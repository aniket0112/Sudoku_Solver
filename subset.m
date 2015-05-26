function[flag]=subset(U,B)
        u=union(U,B);
        flag=isequal(u,U);
end