# %% [code]
neuropsychOutOfPocket <- function(total_cost) {
  remainder <- total_cost - 1500
  remainder - (remainder * 0.80)
}

neuropsychOutOfPocket(total_cost = 3000)
neuropsychOutOfPocket(total_cost = 6000)
