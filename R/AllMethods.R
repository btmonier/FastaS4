# === Methods for FastaS4 classes ===================================

#' @param object an S4 class obect
#' @rdname FASTA-class
#' @aliases show,FASTA-method
setMethod(
    f = "show",
    signature = "FASTA", 
    def = function(object) {
        summFASTA(object)
    }
)
