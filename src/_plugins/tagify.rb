module Jekyll
  module TagifyFilter
    def tagify(input)
      name = input["tag_name"]
      content = input["content"]

      attributes = input.fetch("attributes", {}).
        map { |k, v| %Q(#{k}="#{CGI::escapeHTML(v)}") }

      if content.nil?
        "<#{[name, attributes].flatten.compact.join(' ')}>"
      else
        "<#{[name, attributes].flatten.compact.join(' ')}>#{content}</#{name}>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::TagifyFilter)
