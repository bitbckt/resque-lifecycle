require 'minitest/autorun'
require 'minitest/spec'

$LOAD_PATH.unshift File.expand_path "../../lib", __FILE__
require 'resque-lifecycle'

module ResqueMock
  extend self

  def push(queue, item)
    item
  end
end

