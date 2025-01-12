include("dependencies_for_runtests.jl")

function instantiate_stokes_drift()
    ∂t_uˢ(z, t, h) = exp(z/h) * cos(t)
    ∂t_vˢ(z, t, h) = exp(z/h) * cos(t)
    ∂z_uˢ(z, t, h) = exp(z/h) * cos(t)
    ∂z_vˢ(z, t, h) = exp(z/h) * cos(t)
    stokes_drift = UniformStokesDrift(∂t_uˢ=∂t_uˢ, ∂t_vˢ=∂t_vˢ,
                                      ∂z_uˢ=∂z_uˢ, ∂z_vˢ=∂z_vˢ, parameters=20)

    return true
end

@testset "Stokes drift" begin
    @info "Testing Stokes drift..."

    @testset "Stokes drift" begin
        @test instantiate_stokes_drift()
    end
end
