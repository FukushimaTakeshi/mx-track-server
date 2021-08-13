module Sortable
  extend ActiveSupport::Concern

  SORT_PARAMS = {
    ' ': 'ASC',
    '-': 'DESC'
  }.freeze

  included do
    scope :sorted, lambda { |sort_param|
      return if sort_param.nil?
      return unless sort_param.start_with?(*SORT_PARAMS.keys.map(&:to_s))

      sort_key = sort_param[1..]
      return unless attribute_names.include?(sort_key)

      order("#{sort_key}": SORT_PARAMS[:"#{sort_param[0]}"])
    }
  end
end
