require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
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

