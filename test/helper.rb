require 'minitest/autorun'
require 'minitest/spec'

$LOAD_PATH.unshift File.expand_path "../../lib", __FILE__
require 'resque-lifecycle'

module ResqueMock
  extend self
  @items = {}

  def clear
    @items = {}
  end

  def push(queue, item)
    @items[queue] ||= []
    @items[queue].push(item)
    item
  end

  def pop(queue)
    @items[queue] ||= []
    @items[queue].pop
  end
end
