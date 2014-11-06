include("../src/MAGMA.jl")
using MAGMA
using Base.Test

let x = [1.:100.], y = [101.:200.]
    dx = MagmaVector(x)
    dy = MagmaVector(y)
    @test x == get(dx)
    @test y == get(dy)
    @test dot(x,y) == dot(dx,dy)
end

