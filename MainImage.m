function fragColor = MainImage(fragCoord, iResolution)
    uv = (fragCoord - iResolution * 0.5)./iResolution(2);

    ro = [0, 2, 0];
    rd = normalizeVector([uv(1), uv(2)-0.25, 1]);

    d = RayMarch(ro, rd);
    p = ro + rd*d;

    fragColor = GetLight(p, [2, 6, 0], [0.5, 0.6, 1], 70.0) + GetLight(p, [-2, 2, 0], [1, 0.6, 0.5], 70.0) + GetLight(p, [0, 2, 4], [1, 1, 0.5], 100.0);
end