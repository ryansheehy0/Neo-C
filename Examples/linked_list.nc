
struct Node(Type* parent, Type value, Type* child)

export class LinkedList<auto Type>()
	Node[dynamic] _nodeList

	void push(Type value)
		// Get the last node
		Node lastNode = _nodeList.at(-1)
		// Create new node on the heap
		#Node newNode(&lastNode.value, value, 0)
		// Add new node to _nodeList
		nodeList.push(newNode)
		// Set the last node's child to point to the new node's value


	// Adding
		// Push
		// Unshift
		// Insert
	// Removing
		// Pop
		// Shift
		// Delete
	// Getting
		// From index
		// Next node
		// Prev node
		// Move current node