rates = c(1, 0.2, 5, 7.3, 10)

exp.draws.1 <-  rexp(n = 200)
exp.draws.0.2 <-  rexp(n = 200, rate = 0.2)
exp.draws.5 <-  rexp(n = 200, rate = 5)
exp.draws.7.3 <-  rexp(n = 200, rate = 7.3)
exp.draws.10 <-  rexp(n = 200, rate = 10)

hist(exp.draws.1)
plot(exp.draws.1)
plot(exp.draws.1, exp.draws.10)

exp.draws <- data.frame(exp.draws.1, exp.draws.0.2, exp.draws.5, exp.draws.7.3, exp.draws.10)
means <- apply(exp.draws, 2, mean)
sds <- apply(exp.draws, 2, sd)

plot(means, rates)
plot(sds, rates)
plot(means, sds)

big.exp.draws.1 <- rexp(n = 1.1 * 10**6)
mean(big.exp.draws.1)
sd(big.exp.draws.1)
hist(big.exp.draws.1)

mean(big.exp.draws.1[big.exp.draws.1>1])

big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow = 1100, ncol = 1000)
matrix_histogram <- hist(big.exp.draws.1.mat)
mean(big.exp.draws.1.mat[371,])
apply(big.exp.draws.1.mat, 1, mean)
hist(apply(big.exp.draws.1.mat, 1, mean))