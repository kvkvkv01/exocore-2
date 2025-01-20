require 'kramdown/parser'

class CollapsibleBlock < Kramdown::Parser::GFM
  def initialize(source, options)
    super
    @span_parsers.unshift(:collapsible)
  end

  def parse_collapsible
    start_pos = @src.pos
    @src.pos += @src.matched_size
    @tree.children << Element.new(:html_element, 'div', 
      { 'class' => 'collapsible' }, category: :block)
    true
  end
end

module Jekyll
  class MarkdownBlocks < Jekyll::Generator
    def generate(site)
      site.pages.each { |page| process(page) }
      site.posts.docs.each { |post| process(post) }
    end

    def process(page)
      content = page.content
      content.gsub!(/^:::\s*{([^}]*)}(.*?)^:::/m) do |match|
        options = parse_options($1)
        content = $2
        generate_html(options, content)
      end
      page.content = content
    end

    private

    def parse_options(options_string)
      options = {}
      options_string.scan(/(\w+)="([^"]*)"/) do |key, value|
        options[key.to_sym] = value
      end
      options
    end

    def generate_html(options, content)
      title = options[:title] || 'Details'
      summary = options[:summary]
      
      html = <<~HTML
        <div class="collapsible">
          <button class="collapse-trigger">
            <span class="collapse-icon">▶</span>
            #{title}
          </button>
          <div class="collapse-content">
      HTML

      html += "<div class=\"collapse-summary\">#{summary}</div>" if summary
      html += "#{content}</div></div>"
      
      html
    end
  end
end