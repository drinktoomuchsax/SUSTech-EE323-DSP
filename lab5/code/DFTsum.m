function [X, k] = DFTsum(x)
    N = length(x);
    j = sqrt(-1);
    X = zeros(1, N);

    for k = 1:N
        for n = 1:N
            X(k) = X(k) + x(n) * exp(-j * 2 * pi * (k-1) * (n-1) / N);%only index dont care about move, the value cares
        end
    end

    % Generate the index vector k
    k = 0:N-1;
end
