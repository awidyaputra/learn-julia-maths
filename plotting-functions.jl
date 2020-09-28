### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ efe6e2e2-0164-11eb-2260-dbbfc2e67a67
md"# Plotting Functions Using Pluto"

# ╔═╡ b8e08d80-0165-11eb-3beb-a719a4787b84
md"_First, we set up a clean package environment:_"

# ╔═╡ d7abefac-0165-11eb-144e-1164232687e9
begin
	import Pkg
	Pkg.activate(mktempdir())
end

# ╔═╡ de326aea-0165-11eb-038f-75d94185ae13
begin
	Pkg.add("Plots")
	using Plots
end

# ╔═╡ 09c86f08-016e-11eb-2337-bb78c1e351d2
begin
	Pkg.add("PlutoUI")
	using PlutoUI
end

# ╔═╡ e23a545e-0165-11eb-2489-312695678edb
md"_Next, we add the `Plots` package to our environment, and we import it._"

# ╔═╡ e583c368-0165-11eb-0ae6-45db56b25dc7
md"(If you already had Plots installed, then this will just use the globally installed version! Neat)"

# ╔═╡ ebbaad1c-0165-11eb-11ce-27a21e553650
md"We need to choose a _backend_ for Plots.jl. We choose `plotly` because it works with no additional dependencies. You can [read more about backends](http://docs.juliaplots.org/latest/backends/#backends) in Plots.jl - it's one of its coolest features!"

# ╔═╡ ef4ffc8e-0165-11eb-35bd-61abd2f54676
plotly()

# ╔═╡ 535328ce-0165-11eb-1c02-05c4916085b2
md"""
## Creating an interactive cosine graph
Define function $$y = f(x) = A cos(x + \phi)$$. With

A = Amplitude

ϕ = Phase"""

# ╔═╡ a7d872be-016a-11eb-1bdf-3d47863d049e
function y(x, A, ϕ)
	return A * cos(x + ϕ)
end

# ╔═╡ e85d1d4e-016a-11eb-243b-e51c08ae32e1
md"Let's plot $$y = f(x)$$ for $$x = [-2π, 2π]$$"

# ╔═╡ c4eea27c-016c-11eb-1900-ed0a5ac9216f
start = -2π

# ╔═╡ cfdeabb4-016c-11eb-2e8e-ad131296c35b
stop = 2π

# ╔═╡ d4fbc7f8-016c-11eb-373b-6168bac120c2
step = 0.01

# ╔═╡ ebbff6ee-016c-11eb-03b3-c9b08985b88c
x = start:step:stop

# ╔═╡ 024ce21e-016d-11eb-1ff9-658bea727c61
md"We can make the plot interactive by creating sliders for Amplitude and Phase"

# ╔═╡ 5b5667b2-016e-11eb-3c7f-d3e86551d009
md"""
Amplitude slider:

$(@bind A Slider(-5:0.2:5, default=1))

Phase slider:

$(@bind phi Slider(-5:0.2:5, default=0))
"""

# ╔═╡ fb1fc39e-016c-11eb-11aa-737ab19e5a2e
Y = [y(xi,A,phi) for xi=x]

# ╔═╡ 35f2c9ee-016d-11eb-3da6-ed6e3c148465
plot(x, Y)

# ╔═╡ bcdad72a-016e-11eb-0886-0963a3ccb005
md"""
Amplitude = $A

Phase = $phi"""

# ╔═╡ Cell order:
# ╠═efe6e2e2-0164-11eb-2260-dbbfc2e67a67
# ╟─b8e08d80-0165-11eb-3beb-a719a4787b84
# ╠═d7abefac-0165-11eb-144e-1164232687e9
# ╠═de326aea-0165-11eb-038f-75d94185ae13
# ╠═09c86f08-016e-11eb-2337-bb78c1e351d2
# ╟─e23a545e-0165-11eb-2489-312695678edb
# ╟─e583c368-0165-11eb-0ae6-45db56b25dc7
# ╟─ebbaad1c-0165-11eb-11ce-27a21e553650
# ╟─ef4ffc8e-0165-11eb-35bd-61abd2f54676
# ╠═535328ce-0165-11eb-1c02-05c4916085b2
# ╠═a7d872be-016a-11eb-1bdf-3d47863d049e
# ╠═e85d1d4e-016a-11eb-243b-e51c08ae32e1
# ╠═c4eea27c-016c-11eb-1900-ed0a5ac9216f
# ╠═cfdeabb4-016c-11eb-2e8e-ad131296c35b
# ╠═d4fbc7f8-016c-11eb-373b-6168bac120c2
# ╠═ebbff6ee-016c-11eb-03b3-c9b08985b88c
# ╠═fb1fc39e-016c-11eb-11aa-737ab19e5a2e
# ╠═35f2c9ee-016d-11eb-3da6-ed6e3c148465
# ╠═024ce21e-016d-11eb-1ff9-658bea727c61
# ╟─5b5667b2-016e-11eb-3c7f-d3e86551d009
# ╟─bcdad72a-016e-11eb-0886-0963a3ccb005
