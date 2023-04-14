<< "KrancThorn.m";


derivatives = {
  PDstandard[i_]     -> StandardCenteredDifferenceOperator[1,1,i],
  PDstandard[i_, i_] -> StandardCenteredDifferenceOperator[2,1,i],
  PDstandard[i_, j_] -> StandardCenteredDifferenceOperator[1,2,i]StandardCenteredDifferenceOperator[1,2,j]};


DefineDerivative[pd, PDstandard];

groups = {{"evolved_group", {phi, pi}}};

initialSineCalc = {
  Name      -> "initial_sine",
  Schedule  -> {"AT initial"},
  Equations ->
  {
    phi -> Sin[2 Pi (x + 3y - t)],
    pi  -> 0
  }};

evolveCalc = {
  Name      -> "calc_rhs",
  Schedule  -> {"IN MoL_CalcRHS"},
  Where     -> Interior,
  Equations ->
  {
    dot[phi] -> pi,
    dot[pi]  -> Euc[ui,uj] pd[phi,li,lj]
  }};

CreateKrancThornTT[
  groups, ".", 
  "SimpleWave", 
  PartialDerivatives -> derivatives,
  DeclaredGroups     -> {"evolved_group"},
  Calculations       -> {initialSineCalc, evolveCalc},
  UseJacobian -> True
];
