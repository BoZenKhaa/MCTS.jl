n_iter = 1000
depth = 10
ec = 10.0
RNG = MersenneTwister(1)

solver = MCTSSolver(
    n_iterations=n_iter,
    depth=depth,
    exploration_constant=ec,
    enable_tree_vis=true,
    sizehint=100_000,
    rng=RNG
)
mdp = SimpleGridWorld(;size=(10,10))
planner = solve(solver, mdp)

function benchmark_action(n, rng, mdp, planner)
    for i in 1:n
        state = rand(rng, initialstate(mdp))
        a = action(planner, state)
    end
end

GC.enable_logging(false)

# @benchmark benchmark_action(42, $RNG, $mdp, $planner)
SUITE["vanilla"]["action"] = @benchmarkable  benchmark_action(42, $RNG, $mdp, $planner)
# SUITE["vanilla"]["action"] = @benchmarkable POMDPs.action($planner, $state)

