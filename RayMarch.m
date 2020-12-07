function dO = RayMarch(ro, rd)
    %some constants
    MAX_STEPS = 100;
    MAX_DIST = 100.0; 
    SURF_DIST = 0.01;  

    dO = 0.0;
    
    for i = 0:MAX_STEPS
        p = ro + rd*dO;
        dS = GetDist(p);
        dS = dS(4);
        dO = dO + dS;
        if dO>MAX_DIST || dS<SURF_DIST
            break
        end
    end
end