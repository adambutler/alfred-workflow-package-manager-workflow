module Workflow
  class Git
    def self.download(git_repository_url)
      puts `cd #{WORKFLOW_PATH} && git clone #{git_repository_url}`
    end
  end
end
