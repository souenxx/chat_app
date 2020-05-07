class ToppagesController < ApplicationController
  def index
  	require 'nokogiri'
  	require 'open-uri'

  	url='https://news.yahoo.co.jp/ranking/access/news'

  	charset=nil
  	html=open(url) do |f|
  		charset=f.charset
  		f.read
  	end

  	doc=Nokogiri::HTML.parse(html,charset)

  	#title
  	titlelist=html.scan(%r{<div class="newsFeed_item_title">[^<]*})
  	@title0=/>/.match(titlelist[0]).post_match
  	@title1=/>/.match(titlelist[1]).post_match
  	@title2=/>/.match(titlelist[2]).post_match
  	@title3=/>/.match(titlelist[3]).post_match

  	#image
  	imagelist=html.scan(%r{<img src="https://[^"]*})
  	@image0=/"/.match(imagelist[1]).post_match
  	@image1=/"/.match(imagelist[2]).post_match
  	@image2=/"/.match(imagelist[3]).post_match
  	@image3=/"/.match(imagelist[4]).post_match


  end
end
