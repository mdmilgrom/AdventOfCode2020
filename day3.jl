grid = readlines("data/input_3.txt")
bounds = length(grid[1]),length(grid)
slopes = [[1,1],[3,1],[5,1],[7,1],[1,2]]
trees = zeros(Int64,length(slopes)) 
i = 1
for slope in slopes
    global i
    local pos = [0,1]
    #println("$slope $i")
    while pos[2] + slope[2] <= bounds[2] 
        @assert i < 6 "$i $pos $slope"
        global trees
        pos += slope
        x = pos[1] % (bounds[1]) + 1
        trees[i] += Int64(grid[pos[2]][x:x] == "#")
    end
    i += 1
end
println(trees)
println(prod(trees))
