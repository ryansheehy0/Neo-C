template <typename T>
struct Node {
	T value;
	Node<T>* nextNode;
	Node<T>* prevNode;
};

template<typename T>
class DoublyLinkedList {
	private:
		Node<T>* _head = nullptr;
		Node<T>* _nodeAt(int index);
	public:
		T& at(int index) const;
		void remove(int index);
		void add(int index, T value);
};

template<typename T>
Node<T>* DoublyLinkedList<T>::_nodeAt(int index) {
	Node<T>* currHead = _head;
	for (int i = 0; currHead != nullptr; i++) {
		if (i == index) return currHead;
		currHead = currHead->nextNode;
	}
	throw std::out_of_range("Index out of bounds.");
}

template<typename T>
T& DoublyLinkedList<T>::at(int index) const {

}

template<typename T>
void LinkedList<T>::remove(int index) {
	Node* prevHead = nullptr;
	Node* currHead = _head;
	for (int i = 0; currHead != nullptr; i++) {
		if (i == index) {
			Node* deletedNode = currHead;
			prevHead->nextNode = deletedNode->nextNode;
			delete deletedNode;
			return;
		}
		prevHead = currHead;
		currHead = currHead->nextNode;
	}
	throw std::out_of_range("Index out of bounds.");
}

template<typename T>
void LinkedList<T>::add(int index, T value) {
	
}