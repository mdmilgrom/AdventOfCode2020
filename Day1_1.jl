using BenchmarkTools
list = map(x->tryparse(Int64,x),readlines("data/input_1_1.txt"))
function solve1_1(list)::Int64
    for e in list
        if (2020 - e) ∈ list
            return e * (2020-e)
        end
    end
end

function solve1_2(list)::Int64
    for i in 1:length(list)
        e = list[i]
        for f in list[i+1:end]
            (2020-e-f) ∈ list && return (2020-e-f) * e * f
        end
    end
end
@btime solve1_1(list)
@btime solve1_2(list)
println(solve1_1(list))
println(solve1_2(list))