% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_DPM.R
\name{plot_DPM}
\alias{plot_DPM}
\title{Plot of a Dirichlet process mixture of gaussian distribution partition}
\usage{
plot_DPM(z, U_mu = NULL, U_Sigma = NULL, m, c, i, alpha = "?",
  U_SS = NULL, dims2plot = 1:nrow(z), ellipses = ifelse(length(dims2plot)
  < 3, TRUE, FALSE), gg.add = list(theme()))
}
\arguments{
\item{z}{data matrix \code{d x n} with \code{d} dimensions in rows
and \code{n} observations in columns.}

\item{U_mu}{either a list or a matrix containing the current estimates of mean vectors
of length \code{d} for each cluster. Default is \code{NULL} in which case
\code{U_SS} has to be provided.}

\item{U_Sigma}{either a list or an array containing the \code{d x d} current estimates
for covariance matrix of each cluster. Default is \code{NULL} in which case
\code{U_SS} has to be provided.}

\item{m}{vector of length \code{n} containing the number of observations currently assigned to
each clusters.}

\item{c}{allocation vector of length \code{n} indicating which observation belongs to which
clusters.}

\item{i}{current MCMC iteration number.}

\item{alpha}{current value of the DP concentration parameter.}

\item{U_SS}{a list containing \code{"mu"} and \code{"S"}. Default is \code{NULL} in which case
\code{U_mu} and \code{U_Sigma} have to be provided.}

\item{dims2plot}{index vector, subset of \code{1:d} indicating which dimensions should be drawn.
Default is all of them.}

\item{ellipses}{a logical flag indicating whethe ellipses should be drawn around clusters. Default
is \code{TRUE} if only 2 dimensions are plotted, \code{FALSE} otherwise.}

\item{gg.add}{a list of instructions to add to the ggplot2 instruction (see 
\code{\link[ggplot2]{gg-add}}). Default is \code{list(theme())}, which adds 
nothing to the plot.}
}
\description{
Plot of a Dirichlet process mixture of gaussian distribution partition
}
\author{
Boris Hejblum
}
