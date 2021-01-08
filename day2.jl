using BenchmarkTools
data = map(x->split(x,@r_str("[ :-]"),keepempty=false),readlines("data/input_2.txt"))
function solve2_1(data)
    counter = 0
    for line in data
        l,h = parse(Int32,line[1]),parse(Int32,line[2])
        c = count(line[3],line[4])
        #c = length(collect(eachmatch(Regex(line[3]*"{1}"),line[4])))
        counter += (c>=l && c<=h) ? 1 : 0 
    end
    return counter
end
function solve2_2(data)
    counter = 0
    for line in data
        f,s = parse(Int32,line[1]),parse(Int32,line[2])
        c = line[3]
        counter += Int64((line[4][f:f] == c || line[4][s:s] == c) && !(line[4][f:f] == c && line[4][s:s] == c))
    end
    return counter
end
@btime solve2_1(data)
println(solve2_1(data))
@btime solve2_2(data)
println(solve2_2(data))