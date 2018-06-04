function res = contained(set, state)

    if isempty(set)
        res = 0;
        return;
    end

    ind = intersect( find(set(:,1) == state(1)), find(set(:,2) == state(2)));
    res = ~isempty(ind);
end
        