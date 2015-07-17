require 'cocoapods'
require 'pod/src/configuration'
require 'pod/src/rewriter'

module Pod
  module Downloader
    class Git
        alias_method :github_token_http_rewriter_url, :url
        # FIXME: This needs to be better encapsulated
        def url
          source_url_rewriter.url_for(github_token_http_rewriter_url)
        end

        def source_url_rewriter
          @source_url_rewriter ||= SourceURLRewriter::Rewriter.new
        end
    end
  end
end
