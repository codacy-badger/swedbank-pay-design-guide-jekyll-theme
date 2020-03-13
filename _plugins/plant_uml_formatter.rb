require 'rouge'

class PlantUmlFormatter < Rouge::Formatters::HTML
  def stream(tokens, &block)
    yield "<div class='my-outer-div'>"

    tokens.each do |token, value|
      # for every token in the output, we render a span
      yield span(token, value)
    end

    yield "</div>"
  end
  
#  def convert(content)
#      puts content
#      plant_uml_jar_file = "./_plugins/plantuml.1.2020.2.jar"
#      diagram_directory = "_site/assets/diagrams"
#
#      
#
#      FileUtils.mkdir_p(diagram_directory) unless File.exists?(diagram_directory)
#
#      parsed_html = Nokogiri::HTML.parse(post.output)
#
#      parsed_html.css(".language-plantUML, .language-plantuml, .language-plantUml").each_with_index do | tag, tag_index |
#          uml_file_base_name = "#{post.name}_#{tag_index}"
#          uml_file_name = "#{diagram_directory}/#{uml_file_base_name}"
#          uml_file = File.open("#{uml_file_name}.puml", "w+"){ |f| f.write(tag.text)}
#          
#          system("java -jar #{plant_uml_jar_file} -tsvg #{uml_file_name}.puml") or raise "PlantUml error"
#
#          tag.parent.replace(File.read("./#{uml_file_name}.svg"))
#      end
#      post.output = parsed_html.to_html
#      
#    end
end