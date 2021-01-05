using LinearAlgebra
cd("/Users/Marc/Dev/Advent Of Code/")
fields = Dict("byr"=>(1920,2002),"iyr"=>(2010,2020),"eyr"=>(2020,2030),"hgt"=>r"^(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)$","hcl"=>r"^#[0-9a-f]{6}$","ecl"=>r"^(amb|blu|brn|gry|grn|hzl|oth)$","pid"=>r"^[0-9]{9}$")

function validateField(val::String,(min,max)::Tuple{Int64,Int64})::Bool
    val = parse(Int,val)
    return (val >= min && val <= max) ? true : false
end

function validateField(val::String,criterion::Regex)::Bool
    return !isnothing(match(criterion,val))
end

function validateEntry(entry::Dict)::Int64
    if 0 ∈ in.(keys(fields), Ref(keys(entry)))
        return 0
    end
    for f in keys(entry)
        #println(f,entry[f],fields[f])
        if f ∉ keys(fields) continue end
        if !validateField(String(entry[f]),fields[f]) return 0 end
    end
    return 1
end

function countPassports(fileName::AbstractString)::Int64
    count = 0
    open(fileName) do f
        while !eof(f)
            #entry = map(x->String(x),split(rstrip(readuntil(f, "\n\n")),r"[\n ]"))
            entry = Dict(split(str,":") for str in map(x->String(x),split(rstrip(readuntil(f, "\n\n")),r"[\n ]")))
            #count += (0 ∉ in.(fields, Ref(keys(entry))))
            count += validateEntry(entry)
        end
    end
    return count
end

fileName = "data/input_4.txt"
println(countPassports(fileName))