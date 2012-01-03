module Purugin
  module StringUtils
    def camelcase_to(string, replacement=' ')
      string.gsub(/(.)([A-Z])/, "\\1#{replacement}\\2")
    end
  end
end
