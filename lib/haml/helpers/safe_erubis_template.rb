module Haml
  class SafeErubisTemplate < Tilt::ErubisTemplate

    def initialize_engine
    end

    def prepare
      @options.merge! :engine_class => ActionView::Template::Handlers::Erubis
      super
    end

    def precompiled_preamble(locals)
      [super, "@output_buffer = ActionView::OutputBuffer.new;"].join("\n")
    end

    def precompiled_postamble(locals)
      [super, '@output_buffer.to_s'].join("\n")
    end
  end
end