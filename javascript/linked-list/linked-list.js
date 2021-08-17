export class LinkedList {
  constructor() {
    this._len = 0;
    this.reset();
  }

  push(value) {
    const n = new Node(value);

    if (!this._len) {
      this.head = this.tail = n;
      this._len++;
      return;
    }

    this.tail.next = n;
    n.prev = this.tail;
    this.tail = n;
    this._len++;
  }

  pop = () => { return this.remove(this.tail) }

  shift = () => { return this.remove(this.head) }

  unshift(value) {
    const n = new Node(value);
    n.next = this.head;
    this.head = n;
    this._len++;
  }

  delete(value) {
    let current = this.head;
    while (current && current.value != value) {
      current = current.next;
    }

    if (!current) {
      return;
    }

    return this.remove(current);
  }

  remove(node) {
    this._len--;
    if (this._len == 0) {
      this.reset();
    }

    if (node == this.head) {
      this.head = this.head.next;
      this.head.prev = null;
    }

    if (node == this.tail) {
      this.tail = this.tail.prev;
      this.tail.next = null;
    }

    if (node.prev) {
      node.prev.next = node.next;
    }

    if (node.next) {
      node.next.prev = node.prev;
    }

    return node.value;
  }

  count() {
    return this._len;
  }

  reset() {
    this.head = this.tail = null;
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.prev = this.next = null;
  }
}
