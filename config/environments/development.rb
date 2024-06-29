require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  config.x.webpush.vapid_public_key = ENV["VAPID_PUBLIC_KEY"]
  config.x.webpush.vapid_private_key = ENV["VAPID_PRIVATE_KEY"]
  config.x.webpush.vapid_subject_mailto = ENV.fetch("VAPID_SUBJECT_MAILTO", "mailto:mail@kaigionrails.example")

  config.x.github.app_id = ENV["GITHUB_APP_ID"]
  config.x.github.private_key = ENV["GITHUB_PRIVATE_KEY"]
  config.x.github.client_id = ENV["GITHUB_KEY"]
  config.x.github.client_secret = ENV["GITHUB_SECRET"]
  config.x.github.oauth_redirect_url = ENV["GITHUB_OAUTH_REDIRECT_URI"]

  config.x.sentry.dsn = ENV["SENTRY_DSN"]
  config.x.sentry.env = ENV.fetch("SENTRY_ENV", "development")

  config.redis_url = ENV["REDIS_URL"]

  config.application_url = ENV.fetch("APPLICATION_URL", "http://localhost:3000")
end
