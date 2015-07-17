# Top level module for source url rewriter
module SourceURLRewriter
  Pod::HooksManager.register('cocoapods-github_token_http_rewriter', :pre_install) do |context|
    require 'cocoapods'
    require 'pod/src/configuration'
    require 'pod/src/rewriter'

    Pod::UI.warn('Just about to set some stuff up')
    configuration = SourceURLRewriter::Configuration.new(context)
    SourceURLRewriter::Rewriter.new(context, configuration).rewrite!
  end
end

module Pod
  module Downloader
    class Git
        alias_method :github_token_http_rewriter_url, :url
        # FIXME: This needs to be better encapsulated
        def url
          if github_token_http_rewriter_url.start_with?("git@git.corp.yahoo.com") 
            huh = github_token_http_rewriter_url.sub("git@git.corp.yahoo.com:", "https://47d02b88fc9cf9a3a0ba96692165558e8047f009@git.corp.yahoo.com/")
            Pod::UI.info("Transformed a #{github_token_http_rewriter_url} into #{huh}")
            return huh
          end
          return github_token_http_rewriter_url
        end
    end
  end
end

