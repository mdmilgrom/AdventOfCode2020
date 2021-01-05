list = map(x->tryparse(Int32,x),readlines("data/input_1_1.txt"))
for e in list
    for f in list
        if f == e
            continue
        end
        if in(2020 - e - f,list)
            println(e * f * (2020-e-f))
            break
        end
    end
end