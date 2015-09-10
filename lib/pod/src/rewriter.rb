module SourceURLRewriter
  # Used to provide rewritten urls
  # People using this pod would install as follows
  # plugin 'cocoapods-github_token_http_rewriter', {
  #   "pattern" => "replacement"
  # }
  class Rewriter
    def url_for(url)
      if user_options
        transformed_key = transform_key(url)

        if transformed_key
          rewritten_url = url.sub(transformed_key, user_options[transformed_key])
          Pod::UI.info("Transforming URL #{url} into #{rewritten_url}")
          return rewritten_url
        end
      else
        Pod::UI.notice('No options have been specified for rewriting.')
      end

      url
    end

    private

    def transform_key(url)
      user_options.keys.find do |key|
        url.start_with?(key)
      end
    end

    def user_options
      if podfile.nil?
        @options ||= podfile.plugins['cocoapods-git_url_rewriter']
        Pod::UI.notice('No options have been specified for rewriting') unless @options
        @options
      end
    end

    def podfile
      Pod::Config.instance.podfile
    end
  end
end
