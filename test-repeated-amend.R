library(updateme)
library(tidyverse)
library(ggtext)
data(mtcars)

base_plot <- ggplot(mtcars, aes(hp, mpg)) +
  geom_point(size = 4, alpha = 0.6, color = "#22333b") +
  geom_smooth(linewidth = 1.5, se = F, colour = "#3a86ff") +
  labs(
    title = "Example of a plot **embedded** within another",
    subtitle = "Using the function *'annotation_custom()'*"
  ) +
  theme_bw() +
  theme(
    plot.title = element_textbox_simple(),
    plot.subtitle = element_textbox_simple()
  ) +
  xlim(50, 200)

embedded_plot <- ggplot(mtcars, aes(hp, mpg)) +
  geom_point(size = 4, alpha = 0.6, colour = "#22333b") +
  geom_smooth(size = 1.5, se = F, colour = "#3a86ff") +
  theme_bw()

base_plot + annotation_custom(ggplotGrob(embedded_plot),
  xmin = 125,
  xmax = 200,
  ymin = 22,
  ymax = 35
)
