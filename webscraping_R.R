######### web scraping com R
# Referência : https://www.youtube.com/watch?v=d9G4kjf_c4o
#install.packages("ralger")

library(ralger)

link <- "https://www.imdb.com/chart/top"

#Substitui (1) por (n)
node <- "#main > div > span > div > div > div.lister > table > tbody > tr:nth-child(n) > td.titleColumn > a"


extract <- scrap(link, node)
extract

#Procura os links das imagens
img_links <- images_preview(link)

imdb250 <- table_scrap(link)

link <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

my_nodes <- c(
  ".lister-item-header a", # The title
  ".text-muted.unbold", # The year of release
  ".ratings-imdb-rating strong" # The rating)
)

names <- c("title", "year", "rating") # respect the nodes order

df_rank <- tidy_scrap(link = link, nodes = my_nodes, colnames = names)
df_rank



