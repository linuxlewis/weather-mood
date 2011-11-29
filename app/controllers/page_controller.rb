class PageController < ApplicationController
  require 'net/http'
  require 'rexml/document'


  def home
    @title = "Home"
  end

  def mood
    #http://weather.yahooapis.com/forecastrss?w=12781350
    xml_data = Net::HTTP.get_response(URI.parse("http://weather.yahooapis.com/forecastrss?w=12781350")).body
    doc = REXML::Document.new(xml_data)
    doc.elements.each("//yweather:location") { |element| @city = element.attributes["city"]}
    doc.elements.each("//yweather:condition") { |element| @temp = element.attributes["temp"]}
    temp = @temp
    @tempcolor = get_hex(temp.to_i)
  end

  private
    
    def get_hex(temp_f)
      
      if(temp_f >= 100)
        '#990000'  
      elsif(temp_f >= 90)
        '#cc0000'
      elsif(temp_f >= 80)
        '#ff6600'

      elsif(temp_f >= 70) 
        '#ff9900'

      elsif(temp_f >= 60)
        '#ffcc00' 

      elsif(temp_f >= 50)
        '#ffff00'

      elsif(temp_f >= 40)
        '#ffff00'

      elsif(temp_f >= 30)
        '#00ffff'

      elsif(temp_f >= 20)
        '#00ccff'

      elsif(temp_f >= 10)
        '#0066ff'

      elsif(temp_f >= 0)
        '#ff00ff'
      else
        '#ff00ff'
      end

    end 

end
