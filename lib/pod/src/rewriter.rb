module SourceURLRewriter
  # Url rewriter
  class Rewriter
    # Create a new rewriter with a context and config
    def initialize(context, config)
      @config = config
      @context = context
    end

    def rewrite!
      specs.each do |spec|
        next if spec.source.nil? || spec.source[:git].nil?

        source_url = spec.source[:git]

        Pod::UserInterface.warn("> Found Git Source URL #{source_url}")
      end
    end

    private

    def specs
      @specs ||= @context.umbrella_targets.map(&:specs).flatten.uniq
    end
  end
end
