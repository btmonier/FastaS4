# === Classes for FastaS4 ===========================================

#' @title Class FASTA
#' 
#' @description Class \code{FASTA} defines a FASTA file
#' 
#' @name FASTA-class
#' @rdname FASTA-class
#' @exportClass FASTA
setClass(
    Class = "FASTA",
    representation = representation(
        seqID = "character",
        seq = "character"
    )
)


#' @title Wrapper function for FASTA class
#'
#' @description This function provides a wrapper to create \code{FASTA} class
#'    objects based on a path to a FASTA file.
#' 
#' @param path a path to a FASTA file
#' 
#' @name FASTA
#' @rdname FASTA-class
#' 
#' @importFrom methods new
#' @export
FASTA <- function(path) {
    x <- readFasta(path)
    new(
        Class = "FASTA", 
        seqID = x[["seqID"]],
        seq = x[["seq"]]
    )
}