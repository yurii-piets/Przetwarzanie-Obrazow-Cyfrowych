function ret = quick_union(id, minV, maxV)
    id_minV = minV;
    id_maxV = maxV;
    ret = id;

    if id_minV > id_maxV
        id_minV = q;
        id_maxV = p;
    end

    ret(quick_root(id, id_minV)) = quick_root(id, id_maxV);
end

