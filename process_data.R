library(tidyverse)

top_songs <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  # Count how many weeks each song spent on the chart
  summarize(weeks_on_chart = n(), .by = c(artist, track)) |>
  slice_max(weeks_on_chart, n = 10, with_ties = FALSE) |>
  # Format label and order songs so the longest-charting appears on top
  mutate(
    song = paste0(track, " (", artist, ")"),
    song = fct_reorder(song, weeks_on_chart)
  )
write_rds(top_songs, file = "clean_data.rds")
