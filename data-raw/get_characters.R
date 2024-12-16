## Get Naruto characters

naruto_characters <- naruto_get_characters()

write.csv(
  naruto_characters, "data-raw/naruto_characters.csv", row.names = FALSE
)

openxlsx::write.xlsx(
  x = naruto_characters, file = "data-raw/naruto_characters.xlsx", 
  overwrite = TRUE
)
