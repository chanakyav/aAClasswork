class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        unless node.nil?
            @parent.children.delete(self) unless @parent.nil?
            @parent = node
            node.children << self unless node.children.include?(self)
        else
            @parent = nil
        end
    end

    def add_child(node)
        node.parent = self
        @children << node unless @children.include?(node)
    end
    
    def remove_child(node)
        raise 'Given node is not a child' unless @children.include?(node)
        node.parent = nil
    end
end
