set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

configure :development do
  activate :livereload
end

activate :syntax

activate :livereload

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "post"
  blog.permalink = "{year}/{month}/{day}/{title}"
  blog.sources = "{year}-{month}-{day}-{title}.html"

  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page{num}"
end

page "/blog/atom.xml", layout: false

# Per-page layout changes:
# page "/path/to/file.html", :layout => false
# page "/path/to/file.html", :layout => :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
