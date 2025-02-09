# frozen_string_literal: true

##
# Module to help generate icon helpers for SVG images
module Blacklight::IconHelperBehavior
  ##
  # Returns the raw SVG (String) for a Blacklight Icon located in
  # app/assets/images/blacklight/*.svg. Caches them so we don't have to look up
  # the svg everytime.
  # @param [String, Symbol] icon_name
  # @return [String]
  def blacklight_icon(icon_name, _options = {})
    render "Blacklight::Icons::#{icon_name.to_s.camelize}Component".constantize.new
  rescue NameError
    render Blacklight::Icons::LegacyIconComponent.new(name: icon_name)
  end
end
