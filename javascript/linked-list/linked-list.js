export class LinkedList {
  constructor() {
    this._len = 0;
    this.head = null;
    this.tail = null;
  }

  push(value) {
    const n = new Node(value);

    if (!this._len) {
      this.head = n;
      this.tail = n;
      this._len++;
      return;
    }

    this.tail.next = n;
    n.prev = this.tail;
    this.tail = n;
    this._len++;
  }

  pop() {
    const n = this.tail;
    this.tail = this.tail.prev;
    this._len--;

    return n.value;
  }

  shift() {
    const n = this.head;
    this.head = n.next;
    this._len--;

    return n.value;
  }

  unshift(value) {
    const n = new Node(value);
    n.next = this.head;
    this.head = n;
    this._len++;
  }

  delete(value) {
    // if head if the value, remove it
    if (this.head.value == value) {
      this.shift();
      return;
    }

    // if tail is the value, remove it
    if (this.tail.value == value) {
      this.pop();
      return;
    }

    let current = this.head;

    while (current.next) {
      if (current.next && current.next.value == value) {
        current.next = current.next.next;
        if (current.next) {
          current.next.prev = current;
        }
        this._len--;
        return;
      }
      current = current.next;
    }

  }

  count() {
    return this._len;
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.prev = null;
    this.next = null;
  }
}
