module MarkdownHelper
    def markdown(text)
      unless @markdown
        options = {
          filter_html: true,
          autolink: true,
          space_after_headers: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          tables: true,
          hard_wrap: true,
          xhtml: true,
          lax_html_blocks: true,
          strikethrough: true
        }

        extensions = {
            autolink: true,
            superscript: true,
            disable_indented_code_blocks: true
          }      
        renderer = Redcarpet::Render::HTML.new(options)
        @markdown = Redcarpet::Markdown.new(renderer, extensions)
      end
  
      @markdown.render(text).html_safe
    end
  end