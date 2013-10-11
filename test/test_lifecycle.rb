require File.expand_path '../helper', __FILE__

module ResqueMock
  include Resque::Lifecycle
end

describe Resque::Lifecycle do
  it 'adds created_at to items with #[]=' do
    ResqueMock.push('queue', { })[:created_at].wont_equal nil
  end

  it 'does not modify items missing #[]=' do
    item = Object.new
    ResqueMock.push('queue', item).object_id.must_equal item.object_id
  end
end
