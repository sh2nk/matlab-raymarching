function dS = GetDist(p)

    planeDist = [[1,1,1], p(2)];

    sphereDist = [[0, 0, 0], Shapes.GetSphereDist(p - [0, 1, 4], 0.6)];

    % tp = p - [0, 2, 6];
    % tp = [tp(1), [tp(2), tp(3)] * Rotate2(pi/2)];

    % torusDist = [[0.2, 0.9, 0.1], Shapes.GetTorusDist(tp, [1.6, 0.4])];

    tb = p - [0, 1, 4];
    tbrot = [tb(1), tb(3)] * Rotate2(pi/4);
    tb = [tbrot(1), tb(2), tbrot(2)];
    boxDist = [[1,0.1,0.3], Shapes.GetBoxDist(tb, [0.5, 0.5, 0.5])];

    dS = unionObjects(planeDist, intersectObjects(sphereDist, boxDist));
end

function res = unionObjects(a, b)
    if a(4) < b(4)
        res = a;
    else
        res = b;
    end
end

function res = intersectObjects(a, b)
    d = max(-a(4), b(4));
    res = [b(1), b(2), b(3), d];
end