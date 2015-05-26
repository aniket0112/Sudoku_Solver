function[mininumber] = FindMinArray(col,row)
if(col>0 && col<4)
    if(row>0 && row<4)
        mininumber=1;
    elseif(row>3 && row<7)
        mininumber=4;
    elseif(row>6 && row<10)
        mininumber=7;
    end
elseif(col>3 && col<7)
    if(row>0 && row<4)
        mininumber=2;
    elseif(row>3 && row<7)
        mininumber=5;
    elseif(row>6 && row<10)
        mininumber=8;
    end
elseif(col>6 && col<10)
    if(row>0 && row<4)
        mininumber=3;
    elseif(row>3 && row<7)
        mininumber=6;
    elseif(row>6 && row<10)
        mininumber=9;
    end
end
end
