------------------------
GENERAL INSTRUCTIONS
------------------------
CHECK SIMULATION STATUS:

./simfactory/bin/sim list-simulations 
or
./simfactory/bin/sim list-simulations sim-name


CHECK SIMULATION OUTPUTS:

./simfactory/bin/sim show-output --follow sim-name


STOP SIMULATION:

./simfactory/bin/sim stop sim_name

------------------------
MULTIPATCH
------------------------

1 - Use kranc to build a multipatch thorn:

Kranc/Examples
../../Kranc/Bin/kranc SimpleWaveMultipatch.m

2 - (DO ONCE!) include SimpleWaveMultipatch in kranc.th

3 - build the simulation with this thorn included

./simfactory/bin/sim build -j2 --thornlist thornlists/kranc.th

4 - create-run a simulation with parameters from .par:

./simfactory/bin/sim create-run SimpleWaveMultipatch \
    --parfile arrangements/KrancExamples/simplewave_multipatch.par

