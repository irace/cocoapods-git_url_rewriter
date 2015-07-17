module SourceURLRewriter
  # Url rewriter
  class Rewriter
    # Create a new rewriter with a context and config
    def initialize(context, config)
      @config = config
      @context = context
    end

    def rewrite!
      deps.each do |deps|
      end
    end

    private

    def deps
      @deps ||= @context.podfile.dependencies
    end
  end
end
