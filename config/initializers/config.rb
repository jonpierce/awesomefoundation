SECRETS = YAML::load(File.open(File.join(RAILS_ROOT, "config", "secrets.yml")))
WORDPRESS_PATH = Rails.env.development? ? "/Users/jon/Development/awesomefoundation-blog" : "/opt/apps/blog"
WORDPRESS_THEME = "awesomefound"