struct ListNode
	i64 value
	ListNode* next

export class LinkedListStack
	public
		~This()
			ListNode* curNode = _head
			while (curNode != null)
				ListNode* nextNode = curNode->next
				delete curNode
				curNode = nextNode

		i64 size() const
			i64 count = 0
			forEachNode((ListNode* curNode){
				count++
			})
			return count

		ListNode* find(i64 value) throws string
			forEachNode((ListNode* curNode){
				if (curNode->value == value) return curNode
			})
			throw "Cannot find ${value}."

		void push(i64 value = 0)
			ListNode* newNode = new ListNode(value, null)
			ListNode* tail = tail()
			if (tail)
				tail->next = newNode
			else
				_head = newNode

		i64 pop() throws string
			if (!_head) throw "The linked list is empty."
			ListNode* tail = null
			ListNode* prevTail = null
			forEachNode((ListNode* curNode){
				prevTail = tail
				tail = curNode
			})
			i64 value = tail->value
			delete tail
			if (prevTail)
				prevTail->next = null
			else // The tail is the head
				_head = null
			return value

	private
		ListNode* _head

		void forEachNode(void func(ListNode*))
			ListNode* curNode = _head
			while (curNode != null)
				func(curNode)
				curNode = curNode->next

		ListNode* tail()
			ListNode* curNode = _head
			ListNode* prevNode = null
			while (curNode != null)
				prevNode = curNode
				curNode = curNode->next
			return prevNode