function [out] = MyDirectFrom(X,B,A)

    LengthB = length(B);
    LengthX = length(X);

    if (isrow(X) == 0)
        X = X';
    end

    XX = [zeros(1,LengthB-1),X];
    YY = [zeros(1,LengthB-1),zeros(1,LengthX)];

    A = 1/A(1) * A;
    B = 1/A(1) * B;

    Bflip = fliplr(B);
    Aflip = fliplr(A);

    for k = LengthB:LengthB+LengthX-1
        Sum1 = Bflip(1:end)   * XX(k-(LengthB-1):k)';
        Sum2 = Aflip(1:end-1) * YY(k-(LengthB-1):k-1)';
        YY(k)  = Sum1-Sum2;
    end
    out = YY(LengthB:LengthX+LengthB-1)';

end