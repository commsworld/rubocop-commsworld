module RuboCop
  module Cop
    module Commsworld
      class UnspecifiedModelPrivacy < Cop
        MSG = "Specify an access modifier for namespaced class `%<class_name>s` with either " \
              "`private_constant :%<class_name>s` or `public_constant :%<class_name>s`".freeze

        def_node_matcher :private_constant_declaration?, <<~PATTERN
          (send _ :private_constant _)
        PATTERN

        def_node_matcher :public_constant_declaration?, <<~PATTERN
          (send _ :public_constant _)
        PATTERN

        def on_class(node)
          return unless module_scope?(node)

          klass_name = node.identifier.node_parts.last

          node.parent.each_child_node do |child|
            next unless private_constant_declaration?(child) || public_constant_declaration?(child)
            return if klass_name == child.arguments.first.value
          end

          add_offense(node, message: message(node))
        end

        private

        def message(node)
          klass_name = node.identifier.node_parts.last

          format(MSG, class_name: klass_name)
        end

        def module_scope?(node)
          return unless node.parent

          case node.parent.type
          when :begin
            module_scope?(node.parent)
          when :module
            true
          end
        end
      end
    end
  end
end
