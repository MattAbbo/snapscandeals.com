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
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  options.manifest = true

  # Silence problematic image_optim workers
  options.skip_missing_workers = true

  # Cause image_optim to be in shouty-mode
  options.verbose = false

  # Setting these to true or nil will let options determine them (recommended)
  options.nice = true
  options.threads = true

  # Image extensions to attempt to compress
  options.image_extensions = %w(.png .jpg .gif .svg)

  # Compressor worker options, individual optimisers can be disabled by passing
  # false instead of a hash
  options.advpng    = { :level => 4 }
  options.gifsicle  = { :interlace => false }
  options.jpegoptim = { :strip => ['all'], :max_quality => 100 }
  options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
  options.optipng   = { :level => 6, :interlace => false }
  options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
  # options.pngout    = { :copy_chunks => false, :strategy => 0 }
  # options.svgo      = {}
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# activate :s3_sync do |config|
#   config.bucket                 = 'mattabbo.com'
#   config.region                 = 'eu-west-1'
#   config.aws_access_key_id      = ENV['AWS_ACCESS_KEY']
#   config.aws_secret_access_key  = ENV['AWS_ACCESS_SECRET']
#   config.after_build            = true
# end
#
# activate :cloudfront do |config|
#   config.aws_access_key_id      = ENV['AWS_ACCESS_KEY']
#   config.aws_secret_access_key  = ENV['AWS_ACCESS_SECRET']
#   config.distribution_id        = 'E1TDV3EER2W5WG'
#   config.after_build            = true
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :blog do |blog|
  # set options on blog
end

activate :blog do |blog|
  blog.prefix = "blog"
end

activate :blog do |blog|
  blog.permalink = "blog/{title}.html"
end

activate :directory_indexes

Time.zone = "Harare"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
