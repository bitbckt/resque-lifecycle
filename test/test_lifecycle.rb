require 'helper'

module ResqueMock
  include Resque::Lifecycle
end

class LifecycleTest < Test::Unit::TestCase

  def setup
    ResqueMock.clear
  end

  should 'add created_at to items with #[]=' do
    assert_not_nil ResqueMock.push('queue', { })[:created_at]
  end

  should 'not add created_at to items with #[]= if already there' do
    yesterday = Time.now.to_i - 86400
    ResqueMock.push('queue', {:created_at => yesterday})
    existing = ResqueMock.pop('queue')
    assert_equal yesterday, existing[:created_at]
  end

  should 'not modify items missing #[]=' do
    item = Object.new
    assert_equal item.object_id, ResqueMock.push('queue', item).object_id
  end

end
