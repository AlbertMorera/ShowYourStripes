library(tidyverse)
library(sf)

world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")

world <- world 

world_to_plot <- world %>%
  mutate(new = "globe") %>%
  group_by(new) %>%
  summarise()

img <- readPNG("strips.png")

ggplot()+
  ggpubr::background_image(img) +
  geom_sf(data = world_to_plot, fill = "white", col = NA) +
  coord_sf(xlim = c(-162, 162),
           ylim = c(-78, 78)) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())
