module Workflow
  class Manage

    def self.installed
      puts """<?xml version='1.0'?>
      <items>
        <item valid='no'>
          <title>Feature coming soon</title>
        </item>
      </items>
    """
    end

    def self.remove(title, git_repository_url)
      if self.workflow_is_already_installed(title)
        puts "Error: Workflow is already installed"
        return
      end
      if system "cd #{WORKFLOW_PATH} && git clone #{git_repository_url}"
        DB.execute "INSERT INTO workflows ('title', 'git_repository_url') VALUES ('#{title}', '#{git_repository_url}');"
      end
    end
  end
end
