library(rvest)
library(stringr)

webpage <- read_html("https://stat.uconn.edu/graduate-assistants/")

names <- html_nodes(webpage, xpath = "//*[@id='post-281']/div/table/tbody/tr[*]/td[2]/text()[1]")
jobs <- html_nodes(webpage, xpath = "//*[@id='post-281']/div/table/tbody/tr[*]/td[2]/text()[2]")
offices <- html_nodes(webpage, xpath = "//*[@id='post-281']/div/table/tbody/tr[*]/td[2]/text()[3]")
emails <- html_nodes(webpage, xpath = "//*[@id='post-281']/div/table/tbody/tr[*]/td[2]/text()[4]")

names <- str_replace_all(html_text(names), "[\r\n]" , "")
jobs <- str_replace_all(html_text(jobs), "[\r\n]" , "")
offices <- str_replace_all(html_text(offices), "[\r\n]" , "")
offices <- str_replace_all(offices, "Office:" , "")
offices <- str_replace_all(offices, " " , "")
emails <- str_replace_all(html_text(emails), "[\r\n]" , "")
emails <- str_replace_all(emails, "E-Mail:" , "")
emails <- str_replace_all(emails, " " , "")
data.frame(names, jobs, offices, emails)
