function dif = GetLight(p, pos, lightColor, lightStrength)
    %some constants
    MAX_STEPS = 100;
    MAX_DIST = 50.0; 
    SURF_DIST = 0.01;

    lightHardness = 8.0;

    l = normalizeVector(pos - p);
    n = GetNormal(p);

    projRatio = max(0.0, lightStrength * dot(l,n));

    t = 0.15;
    shadow = 1.0;

    for i = 1:MAX_STEPS
        if t > MAX_DIST
            break
        end
        d = GetDist(p + t*l);
        d = d(4);
        if d < SURF_DIST
            shadow = 0.0;
        end
        t = t + d;
        shadow = min(shadow, lightHardness * d / t);
    end

    d = GetDist(p);
    objColor = [d(1), d(2), d(3)];

    dif =  projRatio * shadow * (objColor .* lightColor);
end