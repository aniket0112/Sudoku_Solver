function[flag]=CheckForSUDOKUconsistency(ANSWER)
flag=0;
for i=1:9
    k=1;
    l=1;
    for j=1:9
        if ANSWER(i,j)~='0'
        row(1,k)=ANSWER(i,j);
        k=k+1;
        end
        if ANSWER(j,i)~='0'
        column(1,l)=ANSWER(j,i);
        l=l+1;
        end
    end 
    u_row=unique(row);
    u_column=unique(column);
    srow=size(row);
    su_row=size(u_row);
    scolumn=size(column);
    su_column=size(u_column);
    if ((srow(2)~=su_row(2)) || (scolumn(2)~=su_column(2)))
    flag = 1;
    return
    end
    for minimumarray=1:9
            elements=CollectElements(minimumarray,ANSWER);
            elements=reshape(elements,[1,9]);
            i=1;
            for a=1:9
                if elements(1,a)~='0'
                element_array(1,i)=elements(1,a);
                i=i+1;
                end
            end
            selement_array=size(element_array);
            suelement_array=size(unique(element_array));
            if selement_array(2)~=suelement_array(2)
                flag=1;
                return
            end
            clear elements;
            clear element_array;
    end
    clear row;
    clear column;
    clear u_row;
    clear u_column;
end
end