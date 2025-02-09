# frozen_string_literal: true

require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../test_app_templates', __dir__)

  def remove_index
    remove_file "public/index.html"
  end

  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)

    Bundler.with_unbundled_env do
      run "bundle install"
    end
    options = '--devise'
    if ENV['BLACKLIGHT_API_TEST'].present?
      options += ' --skip-assets'
    end

    generate 'blacklight:install', options
  end

  def run_test_support_generator
    say_status("warning", "GENERATING test_support", :yellow)

    generate 'blacklight:test_support'
  end
end
