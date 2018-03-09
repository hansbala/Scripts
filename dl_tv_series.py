#!/usr/bin/python3
"""
Developed by:   HANS BALA
Last edited:    Fri Mar  9 19:01:40 IST 2018
Python Version: Python 3.5.2
Dependencies:   axel (Shell), BeautifulSoup (Python)

The purpose of this program is to download an entire TV Series.
My workflow of downloading an entire TV Series is as follows:
--> Google Search : index of <TV Series> <season #> <quality>
--> Look for a good site and open that site
--> Copy the site URL to the clipboard
--> Run the program and feed it the site URL

It will spit the entire TV Series in the current directory

This is not tested against a vast array of sites. It is only in the
initial stages. If you find a bug, create a pull request, and please
, please, please follow the Google Python style guidelines.
"""

import os

from bs4 import BeautifulSoup as soup
from urllib.request import urlopen as uReq

def acceptUrl():
	link = input('Enter a url: ')
	return link

my_url = acceptUrl()
url_html = uReq(my_url)
page_soup = soup(url_html, "lxml")

links = page_soup.findAll("a")
links.pop(0)

for temp_link in links:
	curr_link = temp_link.attrs['href']
	end_url = my_url + curr_link

	system_command = 'axel -a -n 20' + " '" + end_url + "' "
	os.system(system_command)
