# frozen_string_literal: true

class Gutentag::Dirty
  def self.call(instance, tag_names)
    new(instance, tag_names).call
  end

  def initialize(instance, tag_names)
    @instance  = instance
    @tag_names = tag_names
  end

  def call
    return unless changes.present?

    instance.tag_names_will_change!
    instance.changed_attributes[:tag_names] = existing
  end

  private

  attr_reader :instance, :tag_names

  def changes
    (existing + tag_names).uniq - (existing & tag_names)
  end

  def existing
    instance.tag_names
  end
end
