#
library(dplyr)


template <- '
.%s .participant-image {
    background: url("../../images/participants/%s") no-repeat;
background-size: cover; }
'


tmp <- 
  list.files("images/participants", pattern = "(jpg|png)$") %>%
  as.list %>% lapply(function(x) sprintf(template, stringi::stri_replace_all_regex(x,"\\.(jpg|png)", ""), x)) %>%
  unlist

write(tmp, "style/participants.css")

