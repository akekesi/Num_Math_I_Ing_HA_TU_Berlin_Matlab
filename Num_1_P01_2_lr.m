%% L-R Zerlegung
function [L,R] = Num_1_P01_2_lr(A)

% A fuer test:
% A = [2 -1 6; -4 5 -3; 8 11 67];

L = eye(size(A));
R = A;
laenge = length(A);

for k = 1:1:laenge-1        % Spalte
    for m = k+1:1:laenge    % Zeile fuer L
        s = R(m,k)/R(k,k);
        L(m,k) = s;
        for n = k:1:laenge  % Spalte fuer R
            R(m,n) = R(m,n) - s*R(k,n);
        end
    end
end
end
