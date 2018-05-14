module Octopus
  module ReplicationTracking
    module ProxyMethods
      def self.extended(base)
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def master_shard?
          current_shard == Octopus.master_shard
        end

        def replication_position
          master_shard? ? master_replication_position : slave_replication_position
        end

        private

        def master_replication_position
          execute('SHOW MASTER STATUS;').first.try(:[], 1)
        end

        def slave_replication_position
          execute('SHOW SLAVE STATUS;').first.try(:[], 6)
        end
      end
    end
  end
end

Octopus::Proxy.extend(Octopus::ReplicationTracking::ProxyMethods)
