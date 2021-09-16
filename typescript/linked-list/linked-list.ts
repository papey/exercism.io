export class LinkedList<TElement> {
  private _len: number;
  private _fakeHead: Node<TElement>;
  private _fakeTail: Node<TElement>;

  constructor() {
    this._len = 0;
    this._fakeHead = new Node();
    this._fakeTail = new Node(undefined, this._fakeHead);
    this._fakeHead.next = this._fakeTail;
  }

  get tail(): Node<TElement> | null {
    return this._fakeTail.prev;
  }

  get head(): Node<TElement> | null {
    return this._fakeHead.next;
  }

  private insert(
    value: TElement,
    prev: Node<TElement>,
    next: Node<TElement>
  ): void {
    const node = new Node(value, prev, next);
    prev.next = next.prev = node;
    this._len++;
  }

  private remove(node: Node<TElement>): Node<TElement> {
    if (node.next) node.next.prev = node.prev;
    if (node.prev) node.prev.next = node.next;
    this._len--;
    return node;
  }

  private findNode(value: TElement): Node<TElement> | null {
    let current = this.head;
    while (current && current.value != value) {
      current = current.next;
    }

    return current;
  }

  public push(value: TElement): void {
    this.insert(value, this.tail as Node<TElement>, this._fakeTail);
  }

  public pop(): TElement | undefined {
    return this.remove(this.tail as Node<TElement>).value;
  }

  public shift(): TElement | undefined {
    return this.remove(this.head as Node<TElement>).value;
  }

  public unshift(value: TElement): void {
    this.insert(value, this._fakeHead, this.head as Node<TElement>);
  }

  public delete(value: TElement): Node<TElement> | void {
    const node = this.findNode(value);
    if (node) return this.remove(node);
  }

  public count(): number {
    return this._len;
  }
}

class Node<TElement> {
  value: TElement | undefined;
  next: Node<TElement> | null;
  prev: Node<TElement> | null;

  constructor(
    value: TElement | undefined = undefined,
    prev: Node<TElement> | null = null,
    next: Node<TElement> | null = null
  ) {
    this.value = value;
    this.prev = prev;
    this.next = next;
  }
}
