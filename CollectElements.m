function[miniarray]=CollectElements(n,OUT)
switch n
    case 1
        for i=1:3
            for j=1:3
        miniarray(i,j)=OUT(i,j);
            end
        end
    case 2
        i1=1;
        j1=1;
        for i=4:6
            for j=1:3
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 3
        i1=1;
        j1=1;
        for i=7:9
            for j=1:3
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 4
        i1=1;
        j1=1;
        for i=1:3
            for j=4:6
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 5
        i1=1;
        j1=1;
        for i=4:6
            for j=4:6
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 6
        i1=1;
        j1=1;
        for i=7:9
            for j=4:6
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 7
        i1=1;
        j1=1;
        for i=1:3
            for j=7:9
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 8
        i1=1;
        j1=1;
        for i=4:6
            for j=7:9
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
    case 9
        i1=1;
        j1=1;
        for i=7:9
            for j=7:9
        miniarray(i1,j1)=OUT(i,j);
            j1=j1+1;
            end
        i1=i1+1;
        j1=1;
        end
end
end
