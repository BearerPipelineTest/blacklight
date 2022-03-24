# frozen_string_literal: true

module Blacklight
  class Component < ViewComponent::Base
    def render_in(view_context, &block)
      # Work-around for https://github.com/github/view_component/issues/1315
      self.class.compile(raise_errors: true) unless Rails.application.config.eager_load

      super
    end
  end
end
