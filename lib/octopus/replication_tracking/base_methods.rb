module Octopus
  module ReplicationTracking
    module BaseMethods
      def self.extended(base)
        base.extend(ModuleMethods)
      end

      module ModuleMethods
        def replication_position(shard)
          conn = ActiveRecord::Base.connection

          using(shard) { conn.replication_position } if conn.is_a?(Octopus::Proxy)
        end
      end
    end
  end
end

Octopus.extend(Octopus::ReplicationTracking::BaseMethods)
