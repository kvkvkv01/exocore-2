module Jekyll
  class CollapsibleBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @title, @summary = markup.split('|').map(&:strip)
      @title ||= 'Details'
    end

    def render(context)
      content = super
      <<~HTML
        <div class="collapsible">
          <button class="collapse-trigger">
            <span class="collapse-icon">▶</span>
            #{@title}
          </button>
          <div class="collapse-content">
            #{@summary ? "<div class=\"collapse-summary\">#{@summary}</div>" : ''}
            #{content}
          </div>
        </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('collapse', Jekyll::CollapsibleBlock)