Pod::HooksManager.register(:pre_install) do |intaller_context|
    configuration = Pod::GitSourceURLRewriter::Configuration.new(intaller_context)
    Pod::GitSourceURLRewriter::Rewriter.new(installer_context, configuration).rewrite
end