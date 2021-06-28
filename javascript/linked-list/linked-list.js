export class LinkedList {
  constructor() {
    this.head = null;
  }

  push(value) {
    // create the node value
    const n = new Node(value);

    // if there is no head, use the fresh node as head
    if (this.head == null) {
      this.head = n;
      return;
    }

    // if there is a head
    let h = this.head;
    // go to the tail
    while (h.next) {
      h = h.next;
    }

    // set next to new node to create the new tail
    h.next = n;
  }

  pop() {
    // if head is tail, remove it and set it to null
    if (this.head.next == null) {
      const n = this.head;
      this.head = null;
      return n.value;
    }

    // point to the head
    let h = this.head;
    // loop over list elements
    while (h.next) {
      // if the current node is the end of the tail
      if (h.next.next == null) {
        // save it
        const n = h.next;
        // remove it by cutting the link
        h.next = null;

        return n.value;
      }
      // go forward in the list
      h = h.next;
    }
  }

  shift() {
    const n = this.head;
    this.head = n.next;
    return n.value;
  }

  unshift(value) {
    const n = new Node(value);
    n.next = this.head;
    this.head = n;
  }

  delete(value) {
    // do not delete if no head
    if (this.head == null) {
      return;
    }

    // if head if the value, remove it
    if (this.head.value == value) {
      this.head = this.head.next;
      return;
    }

    let h = this.head;

    while (h.next) {
      if (h.next && h.next.value == value) {
        h.next = h.next.next
        return;
      }
      h = h.next;
    }

  }

  count() {
    // if no head, len is 0
    if (this.head == null) {
      return 0;
    }

    let len = 1;
    let h = this.head;
    // go to the tail, count every move forward
    while (h.next) {
      len++;
      h = h.next;
    }

    return len;
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}
