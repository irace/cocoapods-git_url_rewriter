# Top level module for source url rewriter
module SourceURLRewriter
  Pod::HooksManager.register('source_rewriter', :pre_install) do |context|
    require 'cocoapods'
    require 'pod/src/configuration'
    require 'pod/src/rewriter'

    Pod::UI.warn('Just about to set some stuff up')
    configuration = SourceURLRewriter::Configuration.new(context)
    SourceURLRewriter::Rewriter.new(context, configuration).rewrite!
  end
end
