require 'active_support/inflector'
require 'active_support/core_ext/hash/except'
require 'active_model'

class FormSuper < Hashie::Mash
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  def initialize(attributes = nil)
    self.id = self.class.to_s.downcase.pluralize
    super(convert_value(attributes))
  end
  
  def self.all
    return []
  end
  
  alias save valid?
  
  protected

  def convert_value(val, duping=false) #:nodoc:
    if ::Hash === val
      val = val.dup if duping
      Hashie::Mash.new(val)
    else
      super
    end
  end
  
end
