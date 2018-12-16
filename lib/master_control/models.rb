# frozen_string_literal: true
module MasterControl
  module Models
    JSON_SCHEMA_PATTERNS = {
      uuid: '^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$'
    }.freeze
  end
end
