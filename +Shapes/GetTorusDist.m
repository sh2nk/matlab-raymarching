function d = GetTorusDist(p, rad)
    q = [norm([p(1),p(3)]) - rad(1), p(2)];
    d = norm(q) - rad(2);
end