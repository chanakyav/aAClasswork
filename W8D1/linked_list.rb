class Node 

    attr_accessor :data, :link

    def initialize(data, link)
        @data = data
        @link = link
    end

end

def display(node)
    temp = node
    while !temp.nil?
        print temp.data.to_s + " " 
        temp = temp.link
    end
    puts
end

node1 = Node.new(1,nil)
node2 = Node.new(2,nil)
node3 = Node.new(3,nil)
node4 = Node.new(4,nil)
node5 = Node.new(5,nil)

node1.link = node2
node2.link = node3
node3.link = node4
node4.link = node5

print "Linked List: "
display(node1)


def reverse_linked_list(node)
    arr = []
    temp = node
    while !temp.nil?
        arr << temp
        temp = temp.link
    end
    i = arr.length - 1
    new_node = arr.last
    temp = new_node
    while i > 0
        temp = arr[i]
        temp.link = arr[i - 1]
        i -= 1
        temp.link = nil if i == 0
    end
    display(new_node)
end

p reverse_linked_list(node1)
