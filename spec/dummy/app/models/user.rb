# frozen_string_literal: true
class User
  def find_by(*)
    raise NotImplementedError, 'This test class does not actually look anything up in the database'
  end
end
