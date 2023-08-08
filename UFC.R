#rvest is for the html functions
#tidyverse is for data cleaning an manipulation

library(rvest)
library(tidyverse)

url = "http://www.ufcstats.com/event-details/6f81b6de2557739a"

#read_html() takes you to the link
#html_element("element") searches the page for elements called "element"
#html_table() imports the table as a data frame

html = read_html(url)

event_table = html  %>%
  html_element("table") %>%
  html_table()

tr = html %>%
  html_elements('tr') %>%
  html_text2()

td = html %>%
  html_elements('td') %>%
  html_text2()
  
p = html %>%
  html_elements('p') %>%
  html_text2()

#I'm gonna use td.
#Every 10 elements in td corresponds to a whole row in the table
#First name in the fighter names element is the winner
nashville23 <- tibble(W_L=rep("",24),
                          Fighter=columnCleaner(td,2),
                          KD=columnCleaner(td,3),
                          STR=as.integer(columnCleaner(td,4)),
                          TD=columnCleaner(td,5),
                          SUB=columnCleaner(td,6)
                          #Weight_Class=rep(NA,24),
                         # Method=rep(NA,24),
                          #Round=rep(NA,24),
                          #Time=as.Date(columnCleaner(td,10))
                      )







