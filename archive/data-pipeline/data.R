# ========================
#       Wrangle data
# ========================
wrangle_data <- function(data_raw, scheme){
  # Rename columns in raw data
  colnames(data_raw)[1] <- "code"; colnames(data_raw)[3] <- "tonality_type"
  # Remove columns for working data
  removed_cols <- c("description","area")
  data <- data_raw %>% select(-removed_cols)
  # Define a new variable, distance from equator (hence approximate humidity)
  data <- data %>% mutate(dist_equator = abs(latitude))
  # ===============================
  #       Tonality Variable 
  # ===============================
  if(scheme == "complex"){
    # Create new dataset with simplified binary variable
    # 0: Atonal/Simple Tonal
    # 1: Complex Tonal
    data <- data %>% mutate(complex_tonal = (tonality_type == 3))
    # Remove any unneeded columns for this case
  } else if(scheme == "any_tonal")
  {
    # Create new dataset with simplified binary variable
    # 0: Atonal
    # 1: Simple/Complex Tonal
    data <- data %>% mutate(is_tonal = (tonality_type != 1))
  } else{ 
    stop("Please enter a scheme that is either 'any_tonal' or 'complex'.") 
  }
  # ===============================
  # Return wrangled dataset
  return(data)
}
