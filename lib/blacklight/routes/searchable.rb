# frozen_string_literal: true

module Blacklight
  module Routes
    class Searchable
      def initialize(defaults = {})
        @defaults = defaults
      end

      def call(mapper, _options = {})
        mapper.match '/', action: 'index', as: 'search', via: [:get, :post]
        mapper.get '/advanced', action: 'advanced_search', as: 'advanced_search'

        mapper.post ":id/track", action: 'track', as: 'track'
        mapper.get ":id/raw", action: 'raw', as: 'raw', defaults: { format: 'json' }

        mapper.get "opensearch"
        mapper.get 'suggest', as: 'suggest_index'
        mapper.get "facet/:id", action: 'facet', as: 'facet'
      end
    end
  end
end
