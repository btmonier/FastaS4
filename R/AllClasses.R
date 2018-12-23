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
        seqID = "list",
        seq = "list"
    )
)