# === Read functions for FastaS4 ====================================

## readFASTA - not exported
readFasta <- function(path) {
    fas <- scan(path, character(), quote = "", quiet = TRUE, sep = "\n")
    intervals <- grep("^>", fas, value = FALSE)
    fas[intervals] <- paste("@@@", fas[intervals], "@@@", sep = "")
    fas <- unlist(strsplit(paste(fas, collapse = ""), "@@@"))
    seqnames <- grep("^>", fas, value = TRUE)
    loh <- paste(c("^[", LETTERS, letters, "-]"), collapse = '')
    seqs <- grep(loh, fas, value = TRUE)
    ids <- fas[grep("^>", fas, value = FALSE)]
    ids <- gsub(">" , "", ids)
    return(
        list(
            seqID = ids,
            seq = seqs
        )
    )
}


## Summarizer - not exported
summFASTA <- function(object) {
    xID <- object@seqID
    xID <- sprintf(paste0("%0-", max(nchar(xID)), "s"), xID)
    xNO <- sprintf(paste0("%0", max(nchar(seq_along(xID))), "s"), seq_along(xID))
    xSQL <- nchar(object@seq)
    
    xSQ <- object@seq
    xSQ <- ifelse(
        test = nchar(xSQ) > 10, 
        yes = paste(
            substr(xSQ, start = 1, stop = 5), 
            "...", 
            substr(xSQ, start = nchar(xSQ) - 5, stop = nchar(xSQ))
        ), 
        no = paste(xSQ)
    )
    xSQ <- sprintf(paste0("%0-", max(nchar(xSQ)), "s"), xSQ)
    
    xHD <- c(
        sprintf(paste0("%0-", max(nchar(seq_along(xID))), "s"), ""),
        sprintf(paste0("%0-", max(nchar(xID)), "s"), "ID"),
        sprintf(paste0("%0-", max(nchar(xSQ)), "s"), "Sequence"),
        sprintf(paste0("%0-", max(nchar(nchar(object@seq))), "s"), "Length")
    )
    
    xSP <- c(
        sprintf(paste0("%0-", max(nchar(seq_along(xID))), "s"), ""),
        sprintf(paste0("%0-", max(nchar(xID)), "s"), "..."),
        sprintf(paste0("%0-", max(nchar(xSQ)), "s"), "..."),
        sprintf(paste0("%0-", max(nchar(nchar(object@seq))), "s"), "...")
    )
    
    
    
    if (length(xID) <= length(utils::head(xID)) + length(utils::head(xID))) {
        cat("A FASTA class with", length(object@seq), "IDs\n")
        cat(xHD[1], " ", xHD[2], " ", xHD[3], " ", xHD[4], "\n")
        cat(
            paste0(
                "[", xNO, "] ", 
                xID, " | ", 
                xSQ, " | ", 
                nchar(object@seq)
            ),
            sep = "\n"
        )
    } else {
        cat("A FASTA class with", length(object@seq), "IDs\n")
        cat("Showing the first and last 5 IDs...\n")
        cat(xHD[1], " ", xHD[2], " ", xHD[3], " ", xHD[4], "\n")
        cat(
            paste0(
                "[", utils::head(xNO, 5), "] ", 
                utils::head(xID, 5), " | ", 
                utils::head(xSQ, 5), " | ", 
                nchar(utils::head(object@seq, 5))
            ),
            sep = "\n"
        )
        cat(xSP[1], " ", xSP[2], " ", xSP[3], " ", xSP[4], "\n")
        cat(
            paste0(
                "[", utils::tail(xNO, 5), "] ", 
                utils::tail(xID, 5), " | ", 
                utils::tail(xSQ, 5), " | ", 
                nchar(utils::tail(object@seq, 5))
            ),
            sep = "\n"
        )
    }
    
}