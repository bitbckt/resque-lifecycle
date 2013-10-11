require File.expand_path '../helper', __FILE__

module ResqueMock
  include Resque::Lifecycle
end

class LifecycleTest < Test::Unit::TestCase

  should 'add created_at to items with #[]=' do
    assert_not_nil ResqueMock.push('queue', { })[:created_at]
  end

  should 'not modify items missing #[]=' do
    item = Object.new
    assert_equal item.object_id, ResqueMock.push('queue', item).object_id
  end

end
