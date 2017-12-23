module GistCleanupFilter
  def gist_cleanup(html_code)
    html_code.gsub(/#{code_init_regexp}/, '')
      .gsub(/#{code_end_regxp}/, '')
  end

  def code_init_regexp
    "<div><script src='.*'></script><noscript>"
  end

  def code_end_regxp
    "</noscript></div>"
  end
end

Liquid::Template.register_filter(GistCleanupFilter)

