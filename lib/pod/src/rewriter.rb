module SourceURLRewriter
  # Used to provide rewritten urls
  # People using this pod would install as follows
  # plugin 'cocoapods-github_token_http_rewriter', {
  #   "pattern" => "replacement"
  # }
  class Rewriter
    def url_for(url) 
      options = user_options
      if options 
        first_matching_transform_key = options.keys.select {|key| url.start_with?(key)}.first 

        if first_matching_transform_key
          rewritten_url = url.sub(first_matching_transform_key, options[first_matching_transform_key])
          Pod::UI.info("Transforming download URL #{url}} into #{rewritten_url}")
          return rewritten_url
        end
      else
        Pods::UI.notice("No options have been specified for rewriting, every url will pass through.")
      end

      Pod::UI.info("No patterned matched, passing #{url} through")
      return url
    end

    private

    def user_options
      options = podfile.plugins['cocoapods-github_token_http_rewriter']
      options
    end

    def podfile
      Pod::Config.instance.podfile
    end

  end
end
