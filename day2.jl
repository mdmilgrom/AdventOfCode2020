data = map(x->split(x,@r_str("[ :-]"),keepempty=false),readlines("data/input_2.txt"))
counter = 0
for line in data
    global counter
    #l,h = parse(Int32,line[1]),parse(Int32,line[2])
    f,s = parse(Int32,line[1]),parse(Int32,line[2])
    #c = length(findall(line[3],line[4])) 
    c = line[3]
    counter += Int64((line[4][f:f] == c || line[4][s:s] == c) && !(line[4][f:f] == c && line[4][s:s] == c))
end
println(counter)