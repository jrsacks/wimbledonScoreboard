#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://wimbledon.com/en_GB/scores/index2.html"))
doc.css('.cmatch').each do |div|
  if div.css('.eventinfo').first.inner_html.include? "Gentlemen's Singles"
    div.css('.crtrow').each do |player|
      points = player.css('.crtpts').search('span').text
      sets = player.css('.crtset').map do |set|
        set.search('span').text
      end
      printf "%-20s  %-2s  %s\n", player.search('a').inner_html, points, sets.join(' ')
    end
    print "\n"
  end
end
