module SourceURLRewriter
  class Configuration
    # The token to append into the URL
    attr_reader :token
    # An array of patterns to match against
    attr_reader :begins_with_matches

    def initialize(installer_context)
      # Pull configuration info out of context
      # Find token and path urls
    end
  end
end
