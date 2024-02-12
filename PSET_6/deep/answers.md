# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

I did not approach this design because it is not practical, and for big data I am forced to run a query for each table which makes it hard to reach a specific data.

## Partitioning by Hour

This approach may be better from the above ,but all important data are stored in one table which is dangerous beacause I may lost it all at once. Another thing is that I will have another tables I actually do not get benefit from.

## Partitioning by Hash Value

This may the best design from my point of view, in opposite to the first design I can reach a specific data easly, in addition to making use of the other tables, and the data is distributed evenly which is good to be preserved.
