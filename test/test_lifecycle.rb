require File.expand_path '../helper', __FILE__

module ResqueMock
  include Resque::Lifecycle
end

describe Resque::Lifecycle do
  before do
    ResqueMock.clear
  end

  it 'adds created_at to items with #[]=' do
    ResqueMock.push('queue', { })["created_at"].wont_equal nil
  end

  it 'does not modify items missing #[]=' do
    item = Object.new
    ResqueMock.push('queue', item).object_id.must_equal item.object_id
  end

  it 'does not add created_at to items with #[]= if already there' do
    yesterday = Time.now.to_i - 86400
    ResqueMock.push('queue', {'created_at' => yesterday})
    existing = ResqueMock.pop('queue')
    existing['created_at'].must_equal yesterday
  end
end
