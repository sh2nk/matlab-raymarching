function d = GetBoxDist(p, b)
    q = abs(p) - b;
    d = norm(max(q, 0.0)) + min(max(q(1), max(q(2), q(3))), 0.0);
end