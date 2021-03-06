% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MLE_sNiW_mmEM.R
\name{MLE_sNiW_mmEM}
\alias{MLE_sNiW_mmEM}
\title{EM MLE for mixture of sNiW}
\usage{
MLE_sNiW_mmEM(xi_list, psi_list, S_list, hyperG0, K, init = NULL,
  maxit = 100, tol = 0.1, doPlot = TRUE, verbose = TRUE)
}
\arguments{
\item{xi_list}{a list of length \code{N} whose elements are observed vectors of length \code{d}
of the mean parameters xi.}

\item{psi_list}{a list of length \code{N} whose elements are observed vectors of length \code{d}
of the skew parameters psi.}

\item{S_list}{a list of length \code{N} whose elements are observed variance-covariance matrices
of dimension \code{d x d}.}

\item{hyperG0}{prior mixing distribution used if \code{init} is \code{NULL}.}

\item{K}{integer giving the number of mixture components.}

\item{init}{a list for initializing the algorithm with the following elements: \code{b_xi},
\code{b_psi}, \code{lambda}, \code{B}, \code{nu}. Default is \code{NULL} in which case
the initialization of the algorithm is random.}

\item{maxit}{integer giving the maximum number of iteration for the EM algorithm.
Default is \code{100}.}

\item{tol}{real number giving the tolerance for the stopping of the EM algorithm.
Default is \code{0.1}.}

\item{doPlot}{a logical flag indicating wether the algorithm progression should be plotted. Default is \code{TRUE}.}

\item{verbose}{logical flag indicating whether plot should be drawn. Default is \code{TRUE}.}
}
\description{
Maximum likelihood estimation of mixture of
Normal inverse Wishart distributed observations with an EM algorithm
}
\examples{
set.seed(1234)
hyperG0 <- list()
hyperG0$b_xi <- c(0.3, -1.5)
hyperG0$b_psi <- c(0, 0)
hyperG0$kappa <- 0.001
hyperG0$D_xi <- 100
hyperG0$D_psi <- 100
hyperG0$nu <- 3
hyperG0$lambda <- diag(c(0.25,0.35))

xi_list <- list()
psi_list <- list()
S_list <- list()
for(k in 1:200){
 NNiW <- rNNiW(hyperG0, diagVar=FALSE)
 xi_list[[k]] <- NNiW[["xi"]]
 psi_list[[k]] <- NNiW[["psi"]]
 S_list[[k]] <- NNiW[["S"]]
}

hyperG02 <- list()
hyperG02$b_xi <- c(-1, 2)
hyperG02$b_psi <- c(-0.1, 0.5)
hyperG02$kappa <- 0.001
hyperG02$D_xi <- 10
hyperG02$D_psi <- 10
hyperG02$nu <- 3
hyperG02$lambda <- 0.5*diag(2)

for(k in 201:400){
 NNiW <- rNNiW(hyperG02, diagVar=FALSE)
 xi_list[[k]] <- NNiW[["xi"]]
 psi_list[[k]] <- NNiW[["psi"]]
 S_list[[k]] <- NNiW[["S"]]
}

mle <- MLE_sNiW_mmEM(xi_list, psi_list, S_list, hyperG0, K=2)

}
\author{
Boris Hejblum, Chariff Alkhassim
}
