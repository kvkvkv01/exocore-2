require 'kramdown'

module Kramdown
  module Parser
    class GFM
      COLLAPSIBLE_START = /^:::(\s*{([^}]*)})?/
      COLLAPSIBLE_END = /^:::/

      def parse_collapsible
        start_line_number = @src.current_line_number
        result = @src.scan(COLLAPSIBLE_START)
        options = parse_collapsible_options($2)
        
        el = new_block_el(:collapsible, nil, nil, location: start_line_number)
        el.options = options
        
        content = []
        
        while true
          break if @src.match?(COLLAPSIBLE_END)
          content << @src.current_line
          break if @src.eos?
          @src.pos = @src.pos + @src.matched_size
        end
        
        @src.scan(COLLAPSIBLE_END)
        
        # Parse the content as block-level elements
        parse_blocks(el, content.join("\n"))
        @tree.children << el
      end

      def parse_collapsible_options(options_str)
        return {} unless options_str
        options = {}
        options_str.scan(/(\w+)="([^"]*)"/) do |key, value|
          options[key.to_sym] = value
        end
        options
      end
    end
  end

  module Converter
    class Html
      def convert_collapsible(el, indent)
        title = el.options[:title] || 'Details'
        summary = el.options[:summary]
        
        content = inner(el, indent)
        summary_html = summary ? %(<div class="collapse-summary">#{summary}</div>) : ''
        
        %(<div class="collapsible">
            <button class="collapse-trigger">
              <span class="collapse-icon">▶</span>
              #{title}
            </button>
            <div class="collapse-content">
              #{summary_html}
              #{content}
            </div>
          </div>)
      end
    end
  end
end

# Register the new element type
Kramdown::Parser::GFM::BLOCK_PARSERS.unshift(:collapsible)
