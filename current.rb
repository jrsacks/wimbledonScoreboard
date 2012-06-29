#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def find_day
  open("http://www.wimbledon.com/en_GB/scores/results/index.html").read.match(/day[0-9]*/)[0]
end

def output_page(url)
  doc = Nokogiri::HTML(open(url))
  doc.css('.scoringtable').each do |div|
    if div.css('.eventinfo').first.inner_html.include? "Gentlemen's Singles"
      div.css('.crtrow').each do |player|
        server = ''
        server = '-' if player.css('.currentServer').length > 0
        points = player.css('.crtpts').search('span').text
        sets = player.css('.crtset').map do |set|
          set.search('span').text
        end
        printf "%-20s  %-1s%-2s  %s\n", player.search('a').inner_html, server, points, sets.join(' ')
      end
      print "\n"
    end
  end
end

output_page("http://wimbledon.com/en_GB/scores/index2.html")
puts "---- Completed ----"
day = find_day
output_page("http://www.wimbledon.com/en_GB/scores/results/#{day}.html")
