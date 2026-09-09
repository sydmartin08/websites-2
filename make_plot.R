library(tidyverse)

top_songs <- read_rds("clean_data.rds")

billboard_plot <- top_songs |>
  ggplot(aes(x = weeks_on_chart, y = song, fill = weeks_on_chart)) +
  geom_col(show.legend = FALSE) +
  scale_fill_viridis_c(option = "magma", direction = -1) +
  theme_minimal() +
  labs(
    title = "Top 10 Longest-Running Billboard Hits (2000)",
    subtitle = "Number of weeks spent on the Billboard Hot 100",
    x = "Total Weeks on Chart",
    y = NULL,
    caption = "Source: tidyr::billboard"
  )

ggsave("billboard.png", billboard_plot)
