template <typename T>
struct Node {
	T value;
	Node<T>* nextNode = nullptr;
	Node<T>* prevNode = nullptr;
};

template<typename T>
class DoublyLinkedList {
	private:
		Node<T>* _head = nullptr;
		Node<T>* _nodeAt(int index) const;
	public:
		~DoublyLinkedList();
		T& at(int index) const;
		void remove(int index);
		void add(int index, T value);
};

template<typename T>
DoublyLinkedList<T>::~DoublyLinkedList() {
	Node<T>* currNode = _head;
	while (currNode != nullptr) {
		Node<T>* prevNode = currNode;
		currNode = currNode->nextNode;
		delete prevNode;
	}
}

template<typename T>
Node<T>* DoublyLinkedList<T>::_nodeAt(int index) const {
	Node<T>* currNode = _head;
	for (int i = 0; currNode != nullptr; i++) {
		if (i == index) return currNode;
		currNode = currNode->nextNode;
	}
	throw std::out_of_range("Index out of bounds.");
}

template<typename T>
T& DoublyLinkedList<T>::at(int index) const {
	return _nodeAt(index)->value;
}

template<typename T>
void DoublyLinkedList<T>::remove(int index) {
	Node<T>* deletedNode = _nodeAt(index);
	Node<T>* prevNode = deletedNode->prevNode;
	Node<T>* nextNode = deletedNode->nextNode;
	// Change the linked list to remove the deleted node
	if (prevNode) prevNode->nextNode = nextNode;
	if (nextNode) nextNode->prevNode = prevNode;
	// Free the deleted node
	delete deletedNode;
}

template<typename T>
void DoublyLinkedList<T>::add(int index, T value) {
	// Create new node
	Node<T>* newNode = new Node<T>;
	newNode->value = value;
	// Get the prev and next nodes
	Node<T>* prevNode = _nodeAt(index);
	Node<T>* nextNode = prevNode->nextNode;
	// Set the next node properties
	newNode->prevNode = prevNode;
	newNode->nextNode = nextNode;
	// Set the prev and next properties
	prevNode->nextNode = newNode;
	nextNode->prevNode = newNode;
}