include("../src/MAGMA.jl")
using MAGMA
using Base.Test

N = 100
srand(123)

# test dot
let x = randn(N), y = randn(N)
    dx = MagmaVector(x)
    dy = MagmaVector(y)
    @test x == get(dx)
    @test y == get(dy)
    @test_approx_eq dot(x,y) dot(dx,dy)
end

# test axpy!
let a = randn(), x = randn(N), y = randn(N)
    dx = MagmaVector(x)
    dy = MagmaVector(y)
    @test x == get(dx)
    @test y == get(dy)
    axpy!(a,dx,dy)
    @test_approx_eq a*x+y get(dy)
end

# test gemv!
let a = randn(), b = randn(), A = randn(N,N), x = randn(N), y = randn(N)
    dA = MagmaMatrix(A)
    dx = MagmaVector(x)
    dy = MagmaVector(y)
    @test x == get(dx)
    @test y == get(dy)
    gemv!(a,dA,dx,b,dy)
    @test_approx_eq a*A*x+b*y get(dy)
end

