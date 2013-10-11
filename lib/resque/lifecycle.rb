module Resque
  module Lifecycle
    def self.included(base)
      base.class_eval do
        alias_method :push_without_lifecycle, :push
        extend ClassMethods
      end
    end

    module ClassMethods
      # Wrapper for the original Resque push method, which adds a
      # created_at timestamp to any +item+ pushed onto the queue which
      # responds to #[]=.
      #
      def push(queue, item)
        if item.respond_to?(:[]=)
          exists = item.respond_to?(:[]) && item['created_at']
          item['created_at'] = Time.now.to_i unless exists
        end
        push_without_lifecycle queue, item
      end
    end
  end
end
