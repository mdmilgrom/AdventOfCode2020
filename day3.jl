using BenchmarkTools
grid = readlines("data/input_3.txt")
function solve3(grid)
    slopes = [[1,1],[3,1],[5,1],[7,1],[1,2]]
    bounds = length(grid[1]),length(grid)
    trees = zeros(Int64,length(slopes)) 
    i = 1
    for slope in slopes
        pos = [0,1]
        while pos[2] + slope[2] <= bounds[2] 
            @assert i < 6 "$i $pos $slope"
            pos += slope
            x = pos[1] % (bounds[1]) + 1
            trees[i] += Int64(grid[pos[2]][x:x] == "#")
        end
        i += 1
    end
    return trees
end
@btime solve3(grid)
println(solve3(grid))
println(prod(solve3(grid)))
