# Introduction
ESPHome for Eastron SDM630.

Access to the full set of Registers of Eastron SDM630.

## TODO
The following user switch and associated multiplication factor (for kVAh/MVAh) has **NOT** been implemented in the code yet:

Relevant from the User Manual:
1. The power factor has its sign adjusted to indicate the nature of the load. Positive for capacitive and negative for inductive.
2. There is a user option to select either k or M for the energy prefix.
3. The same user option as in 2 above gives a prefix of none or k for Amp hours
4. The power sum demand calculation is for import power only
5. The negative total system power factor is a sign inverted version of parameter 32, the magnitude is the same as parameter 32.
6. There is a user option to select None, k or M for the energy prefix.