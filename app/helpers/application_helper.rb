module ApplicationHelper
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language)
    end
  end

  def markdown(text)
    rndr = MarkdownRenderer.new(:filter_html => true, :hard_wrap => true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    markdown_to_html = Redcarpet::Markdown.new(rndr, options)
    markdown_to_html.render(text).html_safe
  end
end
