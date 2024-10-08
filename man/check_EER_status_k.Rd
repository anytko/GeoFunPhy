% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_EER_status_k.r
\name{check_EER_status_k}
\alias{check_EER_status_k}
\title{Check Eco-Evolutionary Rarity (EER) Status with K Parameter}
\usage{
check_EER_status_k(
  data_frame,
  range_size_col,
  mean_evol_dist_col,
  fun_dist_col,
  range_size_k,
  mean_evol_dist_k,
  fun_dist_k
)
}
\arguments{
\item{data_frame}{A data frame containing scaled (typically using the median and median absolute deviation) values of range size, evolutionary distinctiveness, and functional distinctiveness.}

\item{range_size_col}{A column within the data frame corresponding to the range size (km^2) of the species; should be z transformed (typically using the median and meadian absolute deviation) for ecological status classification. Use the name of the column in "".}

\item{mean_evol_dist_col}{A column within the data frame corresponding to the evolutionary distinctivess of the species; should be z transformed (typically using the median and meadian absolute deviation) for ecological status classification. Use the name of the column in "".}

\item{fun_dist_col}{A column within the data frame corresponding to the functional distinctivess of the respective species. Use the name of the column in "".}

\item{range_size_K}{The optimal number of clusters (K) for range size.}

\item{mean_evol_dist_K}{The optimal number of clusters (K) for mean evolutionary disctinctiveness.}

\item{fun_dist_K}{The optimal number of clusters (K) for functional disctinctiveness.}
}
\value{
A data frame with an additional column "classifications" indicating the ecological status of each species.
}
\description{
This function categorizes species into eco-evolutionary status based on the provided trait data and custom thresholds based on specified optimal K clusters.
}
\examples{

Create a dataframe of maple, ash, and pine species with range size, evolutionary distinctiveness, and functional distinctiveness

species_names <- c("Abies_alba", "Abies_grandis", "Abies_nordmanniana", "Acer_campestre", "Acer_monspessulanum", "Acer_negundo", "Acer_opalus", "Acer_platanoides", "Acer_pseudoplatanus", "Acer_saccharinum", "Fraxinus_angustifolia", "Fraxinus_excelsior", "Fraxinus_ornus", "Fraxinus_pennsylvanica", "Pinus_banksiana", "Pinus_cembra", "Pinus_nigra", "Pinus_pinaster", "Pinus_pinea", "Pinus_ponderosa", "Pinus_strobus", "Pinus_sylvestris", "Pinus_uncinata")

FD_values <- runif(min = -2, max = 2, n=23)

range_values <- runif(min = -2, max = 2, n=23)

evol_dist_values <- runif(min = -2, max = 2, n=23)

forest_data <- data.frame(species_name = species_names, fun_dist = FD_values, range_size = range_values, mean_evol_dist = evol_dist_values)

Find the "elbows" in the k means plots below
elbow_plot(forest_data, "range_size")
elbow_plot(forest_data, "mean_evol_dist")
elbow_plot(forest_data, "fun_dist")

eco_stat <- check_EER_status_k(data_frame = forest_data, fun_dist_col = "fun_dist", range_size_col = "range_size", mean_evol_dist_col = "mean_evol_dist", range_size_k = 3, mean_evol_dist_k = 3, fun_dist_k = 3)

print(eco_stat)
}
