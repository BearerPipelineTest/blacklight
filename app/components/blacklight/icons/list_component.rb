# frozen_string_literal: true

module Blacklight
  module Icons
    class ListComponent < ::ViewComponent::Base
      def call
        svg.html_safe # rubocop:disable Rails/OutputSafety
      end

      def svg
        <<~SVG
          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" aria-hidden="true" width="24" height="24" viewBox="0 0 24 24">
            <path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 4h14v-2H7v2zm0 4h14v-2H7v2zM7 7v2h14V7H7z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
          </svg>
        SVG
      end
    end
  end
end
