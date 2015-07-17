module SourceURLRewriter
  Pod::HooksManager.register("source_rewriter", :pre_install) do |intaller_context|
    require 'cocoapods'
    require 'pod/src/configuration'
    require 'pod/src/rewriter'

    Pod::UI.warn("Just about to set some stuff up")
    configuration = SourceURLRewriter::Configuration.new(intaller_context)
    SourceURLRewriter::Rewriter.new(installer_context, configuration).rewrite!
  end
end