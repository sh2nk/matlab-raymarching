function n = GetNormal(p)
    d = GetDist(p);
    d = d(4);
    
    approx = 0.01;

    e1 = GetDist(p - [approx, 0, 0]);
    e2 = GetDist(p - [0, approx, 0]);
    e3 = GetDist(p - [0, 0, approx]);

    e1 = e1(4);
    e2 = e2(4);
    e3 = e3(4);

    gd = [e1 e2 e3];

    n = d - gd;
end