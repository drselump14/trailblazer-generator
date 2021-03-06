module Trailblazer
  # Trailblazer Generator
  class Generator
    # Generator commands registry
    module Commands
      # Generate Command
      module Generate
        # Generate Operation Command
        class Operations < Base
          desc "Generate default operations: #{Trailblazer::Generator.file_list.operation}"
          example ["Blog", "Blog --layout=plural"]

          # Required Arguments
          argument :concept, required: true, desc: ARGUMENT_CONCEPT

          # Optional Arguments
          option :layout,                desc: OPTION_LAYOUT, default: :singular
          option :json,                  desc: OPTION_JSON
          option :path,                  desc: OPTION_PATH
          option :stubs,                 desc: OPTION_STUBS
          option :add_type_to_namespace, desc: OPTION_ADD_TYPE_TO_NAMESPACE, type: :boolean
          option :app_dir,               desc: OPTION_APP_DIR
          option :concepts_folder,       desc: OPTION_CONCEPTS_FOLDER

          def call(concept:, **options)
            read_custom_options
            run_generator concept, :operation, options, Trailblazer::Generator.file_list.operation
            close_generator
          end
        end
      end
    end
  end
end
