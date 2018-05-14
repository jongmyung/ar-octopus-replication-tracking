# Octopus Replication Tracking
This Gem is extension of ar-octopus to help to find replication file and position number for each shard. Currently only working for mysql2 adapter.

## Install
Add this line to Gemfile:

    gem 'ar-octopus-replication-tracking', git: 'git://github.com/jongmyung/octopus-replication-tracking.git'

## How to Use
Setup `shards.yml` and ready to use.

```yaml
octopus:
  environments:
    - development
  development:
    asia:
      adapter: mysql2
      database: asia_db
    europe:
      adapter: mysql2
      database: europe_db
    america:
      adapter: mysql2
      database: america_db
```

### Syntax
Replication satus from asia shard

    > Octopus.replication_position(:asia)
    => 

Replication status from europe shard

    Octopus.replication_position(:europe)
