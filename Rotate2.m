function mat = Rotate2(angle)
    c = cos(angle);
    s = sin(angle);

    mat = [c -s; s c];
end