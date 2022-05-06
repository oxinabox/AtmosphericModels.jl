using AtmosphericModels, KiteUtils, BenchmarkTools
using Test

cd("..")
KiteUtils.set_data_path("") 
am = AtmosphericModel()

@testset "calc_wind_factor" begin
    @test calc_wind_factor(am, 6.0, Val{1}) ≈ 1.0
    @test calc_wind_factor(am, 6.0, Val{2}) ≈ 1.0
    @test calc_wind_factor(am, 6.0, Val{3}) ≈ 1.0
    @test abs(calc_wind_factor(am, 6.0, Val{4}) - 1.0) < 1.5e-5
    @test abs(calc_wind_factor(am, 6.0, Val{5}) - 1.0) < 1.5e-5
    @test abs(calc_wind_factor(am, 6.0, Val{6}) - 1.0) < 1.5e-5    
end

@testset "calc_rho" begin
    @test calc_rho(am, 0.0) ≈ am.set.rho_0
end