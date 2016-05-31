read_csv <- function(path, col_idx=1){
  # Read csv, using a column for row numbers.
  # 'col_idx' specifies the column index to use for naming the rows.

  df = read.csv(path, stringsAsFactors = FALSE)
  rownames(df) <- df[,1]
  return(df)
}
