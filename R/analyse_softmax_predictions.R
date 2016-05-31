source("clean_all.R")


add_max_label <- function(df){
  # Appends column equal to the column entries with the max probability.

  row_max = apply(df[,-1], 1, max)
  df_max = cbind(df,row_max)
  
  exclude_cols = c(1, ncol(df_max)) # 1=img name, ncol(df_TF)=row_max added above
  df_TF = df_max[,-exclude_cols]
  df_TF = df_TF == df_max[,ncol(df_max)] # find which col = row_max
  
  max_label = apply(df_TF, 1, function(u) paste( names(which(u)), collapse="," ))
  df_return = cbind(df_max, max_label)
  return(df_return)
}

source("helpers.R")

compare_label_two_df<- function(df1, df2){
  # Creates new dataframe: (df1_)row_max, (df1_)max_labels, df2_max_labels, df2_row_max

  df2_max_label = df2[, "max_label"][match(rownames(df1), rownames(df2))]
  df2_row_max = df2[, "row_max"][match(rownames(df1), rownames(df2))]
  comparison = cbind(df1[, c("row_max", "max_label")], df2_max_label, df2_row_max)
  return(comparison)
}
