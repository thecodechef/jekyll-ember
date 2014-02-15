module Jekyll
  module Tags

    class HbsTemplatesTag < Liquid::Tag

      def initialize(tag_name, name, tokens)
        super
        @name = name.strip
      end

      def render(context)
        content = ""
        Dir["app/templates/*.hbs"].each do |template|
          name = template.gsub("app/templates/", "").gsub(".hbs", "")
          template_contents = File.read("app/templates/#{name}.hbs")
          content << "<script type='text/x-handlebars' data-template-name='#{name}'>\n#{template_contents}</script>\n"
        end
        content
      end

    end
  end
end

Liquid::Template.register_tag('hbs_templates', Jekyll::Tags::HbsTemplatesTag)
