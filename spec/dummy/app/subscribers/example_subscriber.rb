# frozen_string_literal: true
class ExampleSubscriber
  include MasterControl::Synq::Subscriber

  event_handler example_upsert_event: :upsert_example_object
  event_handler example_delete_event: :delete_example_object

  protected

  def upsert_example_object(_object)
    true
  end

  def delete_example_object(_object)
    true
  end
end
