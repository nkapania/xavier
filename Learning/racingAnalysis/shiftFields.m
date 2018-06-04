function b = shiftFields(b, shift)
    names = fieldnames(b);
    N = len(names);
    for i = 1:N
        field = names{i};
        M = len(b.(field));
        b.(field) = reshape(b.(field),M,1);
        b.(field) = circshift(b.(field), shift);
    end
end
    