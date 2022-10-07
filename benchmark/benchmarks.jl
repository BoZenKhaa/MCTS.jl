using MCTS
using POMDPs
using POMDPModels
using Random
using BenchmarkTools
using Random

SUITE = BenchmarkGroup()
SUITE["vanilla"] = BenchmarkGroup(["gridworld","vanilla"])
include("vanilla_gridworld.jl")