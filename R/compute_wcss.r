#' Compute Within-Cluster Sum of Squares (WCSS)
#' Compute the Within-Cluster Sum of Squares (WCSS) for a given variable and a range of cluster values (k) using k-means clustering.
#' 
#' @param data A data frame containing the data for clustering.
#' 
#' @param variable The variable in the data frame to be used for clustering. Use the name of the column in "".
#' 
#' @param k_values A vector of integers specifying the number of clusters (k) to be considered.
#' 
#' @return A numeric vector containing the WCSS values for each value of k.
#' 
#' @details This function computes the Within-Cluster Sum of Squares (WCSS) for each value of k provided in the `k_values` parameter using k-means clustering. It returns a numeric vector where each element represents the WCSS value for the corresponding value of k.
#' 
#' @examples
#' 
#' Create a dataframe of maple ash and pine species with range size, average evolutionary distinctiveness, and functional distinctiveness values
#' species_names <- c("Abies_alba", "Abies_grandis", "Abies_nordmanniana", "Acer_campestre", "Acer_monspessulanum", "Acer_negundo", "Acer_opalus", "Acer_platanoides", "Acer_pseudoplatanus", "Acer_saccharinum", "Fraxinus_angustifolia", "Fraxinus_excelsior", "Fraxinus_ornus", "Fraxinus_pennsylvanica", "Pinus_banksiana", "Pinus_cembra", "Pinus_nigra", "Pinus_pinaster", "Pinus_pinea", "Pinus_ponderosa", "Pinus_strobus", "Pinus_sylvestris", "Pinus_uncinata")
#' 
#' FD_values <- runif(min = -2, max = 2, n=23)
#' 
#' range_values <- runif(min = -2, max = 2, n=23)
#' 
#' mean_evol_dist_values <- runif(min = -2, max = 2, n=23)
#'
#'forest_data <- data.frame(species_name = species_names, fun_dist = FD_values, range_size = range_values, mean_evol_dist = mean_evol_dist_values)
#'
#' Calculate the 8 wcss values for range size 
#' wcss_range <- compute_wcss(data = forest_data, variable = "range_size", k_values= c(1, 2, 3, 4, 5, 6, 7, 8))
#'
#' print(wcss_range)
#' 
#' Calculate the 8 wcss values for evolutionary distinctiveness
#' wcss_evol_dist <- compute_wcss(data = forest_data, variable = "mean_evol_dist", k_values= c(1, 2, 3, 4, 5, 6, 7, 8))
#'
#' print(wcss_evol_dist)
#'
#' Calculate the 8 wcss values for functional distinctiveness
#' wcss_fun_dist <- compute_wcss(data = forest_data, variable = "fun_dist", k_values= c(1, 2, 3, 4, 5, 6, 7, 8))
#'
#' print(wcss_fun_dist)
#' 
#' @seealso For automatically finding optimal values of k, see the `choose_optimal_k` function.
#' 
#' @export
#' 
compute_wcss <- function(data, variable, k_values) {
  wcss_values <- sapply(k_values, function(k) {
    model <- kmeans(data[[variable]], centers = k)
    return(sum(model$withinss))
  })
  return(wcss_values)
}

