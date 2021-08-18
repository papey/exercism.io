export class LinkedList {
  constructor() {
    this._len = 0;
    // _fakeHead and _fakeTail are fictive and just ensure operations are always done in the "middle" of the list
    this._fakeHead = new Node()
    this._fakeTail = new Node(undefined, this._fakeHead)
    this._fakeHead.next = this._fakeTail
  }

  get head() { return this._fakeHead.next }

  get tail() { return this._fakeTail.prev }

  unshift = (value) => { this.insert(value, this._fakeHead, this.head) }

  push = (value) => { this.insert(value, this.tail, this._fakeTail) }

  pop = () => { return this.remove(this.tail).value; }

  shift = () => { return this.remove(this.head).value; }

  delete = (value) => {
    const node = this.findNode(value);
    if (node) return this.remove(node)
  }

  remove(node) {
    node.next.prev = node.prev
    node.prev.next = node.next
    this._len--;
    return node
  }

  insert(value, prev, next) {
    const node = new Node(value, prev, next);
    prev.next = next.prev = node;
    this._len++;
  }

  count = () => { return this._len }

  findNode(value) {
    let current = this.head;
    while (current && current.value != value) {
      current = current.next;
    }

    return current
  }
}

class Node {
  constructor(value = undefined, prev = null, next = null) {
    this.value = value;
    this.prev = prev;
    this.next = next;
  }
}
