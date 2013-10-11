# resque-lifecycle

Resque::Lifecycle extends Resque's default enqueueing process to add a simple timestamp to the payload of
each enqueued job. This allows easy measurement of queue throughput by inspecting the creation time of the
head element on the queue.

### Usage

```Ruby
require 'resque'
require 'resque-lifecycle'

module Resque
  include Resque::Lifecycle
end
```

Authors
=======

[Brandon Mitchell](https://github.com/bitbckt) & [Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/grosser/resque-lifecycle.png)](https://travis-ci.org/grosser/resque-lifecycle)
