module ReadingsHelper
  
  def markdown_parse(str)
    BlueCloth.new(str).to_html.html_safe
  end
  
end
