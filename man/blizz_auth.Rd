% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blizz_auth.R
\name{blizz_auth}
\alias{blizz_auth}
\title{Authenticate Blizzard API}
\usage{
blizz_auth(id, secret, refresh = FALSE, install = TRUE)
}
\arguments{
\item{id}{The Client ID provided once a Client has been made on Blizzard's Dev Portal.}

\item{secret}{The Client Secret provided once a Client has been made on Blizzard's Dev Portal.}

\item{refresh}{If TRUE, the CLIENT_AUTH_TOKEN will be refreshed. Blizzard Auth Tokens expire after 24 hours.}

\item{install}{If TRUE, will install the key in your \code{.Renviron} file for use in future sessions.  Defaults to TRUE.}
}
\description{
The function will install the Client ID, Client Secret, and
Authentication Token to the \code{.Renviron} file for repeated use. However,
tokens expire after 24 hours so after the initial install, running
\code{blizz_auth(refresh = TRUE)} will be required once the 24 hour period
has passed.
}
