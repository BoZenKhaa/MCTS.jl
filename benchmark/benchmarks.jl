using MCTS
using POMDPs
using POMDPModels
using Random
using BenchmarkTools

SUITE = BenchmarkGroup()
SUITE["vanilla"] = BenchmarkGroup(["gridworld","vanilla"])
include("vanilla_gridworld.jl")