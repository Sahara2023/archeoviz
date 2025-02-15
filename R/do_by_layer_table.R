.do_by_layer_table <- function(dataset, input.location){
  df <- table(dataset$layer, dataset$location_mode)
  
  if(ncol(df) > 1 & nrow(df) > 0){
    df <- as.matrix(df)
    df <- df[order(rownames(df), decreasing = FALSE), ]
    df <- rbind(df, "Total" = apply(df, 2, sum))
    df <- cbind(df, "Total" = apply(df, 1, sum))
  }
  if(ncol(df) == 1 & nrow(df) > 1){
    df <- df[order(rownames(df), decreasing = FALSE), ]
    df <- c(df, "Total" = sum(df))
    df <- as.data.frame(df)
    colnames(df) <- input.location
  }
  data.frame(df)
}
