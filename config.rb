###
# Blog settings
###

Time.zone = 'America/New_York'

activate :blog do |blog|
  blog.permalink = "{year}/{month}/{day}/{title}"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}"
  blog.taglink = "/tags/{tag}"
  blog.layout = "post"
  blog.summary_separator = /<!-- more -->/
  blog.summary_length = nil
  blog.year_link = "/{year}.html"
  blog.month_link = "/{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/rss", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

set :encoding, 'utf-8'
set :relative_links, true

# Support for browsing from the build folder.
# set :strip_index_file,  false


# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes
activate :rouge_syntax

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def shared_partial(*sources)
    sources.inject([]) do |combined, source|
      combined << partial("../shared/partials/#{source}")
    end.join
  end

  def pages
    require 'yaml'
    Pathname.new("shared/pages.yml").open { |file| YAML.load(file) }
  end

  def me
    require 'yaml'
    Pathname.new("shared/me.yml").open { |file| YAML.load(file) }
  end

  def long_date(date)
    date.strftime("%A %B #{date.day.ordinalize}, %Y")
  end

  def summary_or_post(post)
    post.body == post.summary ? post.body : post.summary + "<a href=#{post.url} title=#{post.title}>Read More</a>"
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'scripts'

set :images_dir, 'images'

# Allow shared assets folder to not be in source, thereby not dragging in every asset
after_configuration do
  sprockets.append_path "../shared/images"
  sprockets.append_path "../shared/scripts"
  # sprockets.append_path "../shared/fonts"
  sprockets.append_path "../shared/partials"
  sprockets.append_path "../shared/stylesheets"
end

# Build-specific configuration
configure :build do
  activate :sprockets

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
end

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true
set :markdown_engine, :redcarpet

activate :directory_indexes
