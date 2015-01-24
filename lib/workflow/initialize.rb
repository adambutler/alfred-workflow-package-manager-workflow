module Workflow
  class Initialize
    def self.table_exits(db, table_name)
      table = db.execute <<-SQL
         SELECT name
         FROM sqlite_master
         WHERE type='table'
         AND name='#{table_name}';
      SQL

      return !table.empty?
    end

    def self.create_table(db, table_name)
      db.execute <<-SQL
        create table #{table_name} (
          title varchar(80),
          git_repository_url varchar(80),
          description varchar(600)
        );
      SQL
    end

    def self.create_database
      db = SQLite3::Database.new "workflow.db"
      unless self.table_exits db, "workflows"
        self.create_table(db, "workflows")
      end
    end
  end
end

Workflow::Initialize.create_database
