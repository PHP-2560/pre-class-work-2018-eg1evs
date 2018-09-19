# PART 1
# Exercise 1
rates = c(1, 0.2, 5, 7.3, 10)  # create a vector of rates
exp.draws.1 <-  rexp(n = 200)  # create 200x1 vectors of random draws from each rate

# Exercise 2
exp.draws.0.2 <-  rexp(n = 200, rate = 0.2)
exp.draws.5 <-  rexp(n = 200, rate = 5)
exp.draws.7.3 <-  rexp(n = 200, rate = 7.3)
exp.draws.10 <-  rexp(n = 200, rate = 10)

# Exercise 3
hist(exp.draws.1)
plot(exp.draws.1)
plot(exp.draws.1, exp.draws.10)

# Exercise 4
exp.draws <- data.frame(exp.draws.1, exp.draws.0.2, exp.draws.5, exp.draws.7.3, exp.draws.10)
means <- apply(exp.draws, 2, mean)
sds <- apply(exp.draws, 2, sd)

plot(means, rates)  # mean of exp is the inverse of rate --> that's what we see in simulated data
plot(sds, rates)  # for rate = 1, stdev = mean, so the plot is the same
plot(means, sds)  # same here: stdev = mean --> all poinst lie on 45-degree line


# PART 2
# Exercise 5
big.exp.draws.1 <- rexp(n = 1.1 * 10**6)  # simulate 1.1 mln of std expon
mean(big.exp.draws.1)  # empirical mean = empirical stdev and almost equal to rate which is what we expect
sd(big.exp.draws.1)  # empirical mean = empirical stdev and almost equal to rate which is what we expect
hist(big.exp.draws.1)  # no, it doesn't. it matches and should match PDF of exponential, not CDF

mean(big.exp.draws.1[big.exp.draws.1>1])  # find meand among values > 1

big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow = 1100, ncol = 1000)
matrix_histogram <- hist(big.exp.draws.1.mat)  # create a histogram from matrix. as the absolute size increases,
# density / counts fall. we can see it by looking at mids which is cell midpoints: they increase and density / counts fall
mean(big.exp.draws.1.mat[371,]) # calculate the mean of 371-st row
apply(big.exp.draws.1.mat, 1, mean)
hist(apply(big.exp.draws.1.mat, 1, mean))  # simulated means are centerd around true mean but are distributed around it.
# this is LLN + CLT at work
