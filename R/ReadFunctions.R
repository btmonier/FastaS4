readFasta <- function(path) {
    x <- scan(path, character(), quote = "", quiet = TRUE)
    x[seq_along(x) %% 2 > 0] <- gsub(
        pattern = ">",
        replacement = "",
        x = x[seq_along(x) %% 2 > 0]
    )
    return(x)
}