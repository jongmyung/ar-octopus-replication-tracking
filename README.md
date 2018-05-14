# Octopus Replication Tracking
This Gem is extension of ar-octopus to help to find replication file and position number for each shard.

## Notes
* Currently only working for mysql2 adapter
* DB user requires to have access `show master status;` and `show slave status;`

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
    earth:
      captain_america:
        adapter: mysql2
        database: captain_america_db
      hulk:
        adapter: mysql2
        database: hulk_db
      ironman:
        adapter: mysql2
        database: ironman_db
    galaxy:
      i_am_groot:
        adapter: mysql2
        database: i_am_grout_db
```

### Syntax
Replication satus from asia shard

    > Octopus.replication_position(:captain_america)
    => {:file_name=>"mysql-bin.000001", :position=>36668586}

Replication status from europe shard

    Octopus.replication_position(:ironman)
    => {:file_name=>"mysql-bin.000001", :position=>36668583}
    
Replication status from slave group

    Octopus.replication_position(slave_group: :galaxy)
    => {:file_name=>"mysql-bin.000001", :position=>36668586}
