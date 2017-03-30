# good
out = []
out << content_tag(:li, 'one')
out << content_tag(:li, 'two')
safe_join(out)
out.html_safe

raw text
